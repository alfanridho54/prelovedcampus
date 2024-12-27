<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Produk;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\ResponsResource;

class CartController extends Controller
{
    // Menampilkan keranjang berdasarkan user_id
    public function index($userId)
    {
        $cartItems = Cart::with('produk')
            ->where('user_id', $userId)
            ->get()
            ->map(function ($item) {
                return [
                    'id' => $item->id,
                    'produk_nama' => $item->produk->nama,
                    'harga' => $item->produk->harga,
                    'jumlah' => $item->jumlah,
                    'subtotal' => $item->produk->harga * $item->jumlah,
                    'lokasi_gambar' =>  asset('storage/' . $item->produk->lokasi_gambar)
                ];
            });

        return new ResponsResource(true, 'List Data Keranjang', $cartItems);
    }


    // Menambah produk ke keranjang
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:user,id',
            'produk_id' => 'required|exists:produk,id',
            'jumlah' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $produk = Produk::find($request->produk_id);
        if (!$produk || $produk->stok < $request->jumlah) {
            return new ResponsResource(false, 'Stok produk tidak mencukupi', null);
        }

        $cartItem = Cart::where('user_id', $request->user_id)
            ->where('produk_id', $request->produk_id)
            ->first();

        if ($cartItem) {
            $cartItem->jumlah += $request->jumlah;
            $cartItem->save();
        } else {
            Cart::create($request->all());
        }

        return new ResponsResource(true, 'Produk berhasil ditambahkan ke keranjang', null);
    }

    // Menghapus item dari keranjang
    public function destroy($id)
    {
        $cartItem = Cart::find($id);

        if (!$cartItem) {
            return new ResponsResource(false, 'Item keranjang tidak ditemukan', null);
        }

        $cartItem->delete();
        return new ResponsResource(true, 'Item berhasil dihapus dari keranjang', null);
    }


    // Checkout keranjang
    public function checkout(Request $request)
    {
        $userId = $request->user_id;

        $cartItems = Cart::with('produk')
            ->where('user_id', $userId)
            ->get();

        if ($cartItems->isEmpty()) {
            return new ResponsResource(false, 'Keranjang kosong', null);
        }

        DB::beginTransaction();

        try {
            foreach ($cartItems as $item) {
                $produk = $item->produk;

                if ($produk->stok < $item->jumlah) {
                    DB::rollBack();
                    return new ResponsResource(false, 'Stok tidak mencukupi untuk produk: ' . $produk->nama, null);
                }

                // Kurangi stok produk
                $produk->stok -= $item->jumlah;
                $produk->save();

                // Simpan transaksi
                DB::table('transaksi')->insert([
                    'user_id' => $userId,
                    'produk_id' => $item->produk_id,
                    'jumlah_beli' => $item->jumlah,
                    'total_harga' => $produk->harga * $item->jumlah,
                    'metode_pembayaran' => $request->metode_pembayaran,
                    'tanggal_transaksi' => now(),
                    'status_pembayaran_id' => 1, // Belum Dibayar
                ]);
            }

            // Kosongkan keranjang
            Cart::where('user_id', $userId)->delete();

            DB::commit();
            return new ResponsResource(true, 'Checkout berhasil', null);
        } catch (\Exception $e) {
            DB::rollBack();
            return new ResponsResource(false, 'Terjadi kesalahan saat checkout', null);
        }
    }
}
