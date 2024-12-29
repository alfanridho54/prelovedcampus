<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Produk;
use App\Models\User;
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
        \Log::info('Memulai proses checkout untuk user ID: ' . $request->user_id);

        $userId = $request->user_id;

        // Periksa apakah user memiliki alamat
        $user = User::find($userId);

        if (!$user || empty($user->alamat)) {
            \Log::warning('User belum mengatur alamat. User ID: ' . $userId . ', Alamat: ' . $user->alamat);
            return new ResponsResource(false, 'Anda harus mengisi alamat terlebih dahulu.', null);
        }

        \Log::info('Alamat ditemukan: ' . $user->alamat);

        $cartItems = Cart::with('produk')
            ->where('user_id', $userId)
            ->get();

        if ($cartItems->isEmpty()) {
            \Log::warning('Keranjang kosong untuk user ID: ' . $userId);
            return new ResponsResource(false, 'Keranjang kosong', null);
        }

        DB::beginTransaction();

        try {
            $totalHarga = 0;
            $transaksiItems = [];


            foreach ($cartItems as $item) {
                $produk = $item->produk;

                if ($produk->stok >= $item->jumlah) {
                    $produk->stok -= $item->jumlah;
                    $produk->save();

                    DB::table('transaksi')->insert([

                        'user_id' => $userId,
                        'produk_id' => $item->produk_id,
                        'jumlah_beli' => $item->jumlah,
                        'total_harga' => $produk->harga * $item->jumlah,
                        'metode_pembayaran' => $request->metode_pembayaran,
                        'tanggal_transaksi' => now(),
                        'status_pembayaran_id' => 1, // Belum Dibayar
                    ]);

                    $totalHarga += $produk->harga * $item->jumlah;

                    $transaksiItems[] = [
                        'id' => $item->id,
                        'produk_nama' => $produk->nama,
                        'harga' => $produk->harga,
                        'jumlah' => $item->jumlah,
                        'subtotal' => $produk->harga * $item->jumlah,
                    ];
                } else {
                    DB::rollBack();
                    return new ResponsResource(false, 'Stok tidak mencukupi untuk produk: ' . $produk->nama, null);
                }
            }

            Cart::where('user_id', $userId)->delete();

            DB::commit();

            return new ResponsResource(true, 'Checkout berhasil', [

                'user_id' => $userId,
                'status' => 'Belum Dibayar',
                'total' => $totalHarga,
                'metode_pembayaran' => $request->metode_pembayaran,
                'items' => $transaksiItems,
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Error saat checkout: ' . $e->getMessage());
            return new ResponsResource(false, 'Terjadi kesalahan saat checkout', null);
        }
    }




}
