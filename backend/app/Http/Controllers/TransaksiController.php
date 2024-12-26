<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Transaksi;
use App\Models\Produk;

class TransaksiController extends Controller
{
    // Menampilkan semua transaksi
    public function index()
    {
        $transaksi = DB::table('transaksi')
            ->join('user', 'transaksi.user_id', '=', 'user.id')
            ->join('produk', 'transaksi.produk_id', '=', 'produk.id')
            ->join('status_pembayaran', 'transaksi.status_pembayaran_id', '=', 'status_pembayaran.id')
            ->select(
                'transaksi.id',
                'user.nama as user_nama',
                'produk.nama as produk_nama',
                'transaksi.jumlah_beli',
                'transaksi.total_harga',
                'transaksi.metode_pembayaran',
                'transaksi.tanggal_transaksi',
                'status_pembayaran.status_pembayaran as status_pembayaran'
            )
            ->get();

        return new ResponsResource(true, 'List Data Transaksi', $transaksi);
    }

    // Menampilkan detail transaksi berdasarkan ID
    public function show($id)
    {
        $transaksi = DB::table('transaksi')
            ->join('user', 'transaksi.user_id', '=', 'user.id')
            ->join('produk', 'transaksi.produk_id', '=', 'produk.id')
            ->join('status_pembayaran', 'transaksi.status_pembayaran_id', '=', 'status_pembayaran.id')
            ->select(
                'transaksi.id',
                'user.nama as user_nama',
                'produk.nama as produk_nama',
                'transaksi.jumlah_beli',
                'transaksi.total_harga',
                'transaksi.metode_pembayaran',
                'transaksi.tanggal_transaksi',
                'status_pembayaran.status_pembayaran as status_pembayaran'
            )
            ->where('transaksi.id', $id)
            ->first();

        if (!$transaksi) {
            return new ResponsResource(false, 'Transaksi tidak ditemukan', null);
        }

        return new ResponsResource(true, 'Detail Data Transaksi', $transaksi);
    }

    // Menambah transaksi baru
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:user,id',
            'produk_id' => 'required|exists:produk,id',
            'jumlah_beli' => 'required|integer|min:1',
            'metode_pembayaran' => 'required|string|max:45',
            'status_pembayaran_id' => 'required|exists:status_pembayaran,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Validasi stok produk
        $produk = DB::table('produk')->where('id', $request->produk_id)->first();
        if (!$produk || $produk->stok < $request->jumlah_beli) {
            return new ResponsResource(false, 'Stok produk tidak mencukupi', null);
        }

        // Hitung total harga
        $totalHarga = $produk->harga * $request->jumlah_beli;

        // Kurangi stok produk
        DB::table('produk')->where('id', $request->produk_id)->update([
            'stok' => $produk->stok - $request->jumlah_beli
        ]);

        // Simpan transaksi
        $transaksi = DB::table('transaksi')->insertGetId([
            'user_id' => $request->user_id,
            'produk_id' => $request->produk_id,
            'jumlah_beli' => $request->jumlah_beli,
            'total_harga' => $totalHarga,
            'metode_pembayaran' => $request->metode_pembayaran,
            'tanggal_transaksi' => now(),
            'status_pembayaran_id' => $request->status_pembayaran_id,
        ]);

        return new ResponsResource(true, 'Transaksi berhasil ditambahkan', $transaksi);
    }

    // Mengupdate transaksi
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:user,id',
            'produk_id' => 'required|exists:produk,id',
            'jumlah_beli' => 'required|integer|min:1',
            'metode_pembayaran' => 'required|string|max:45',
            'status_pembayaran_id' => 'required|exists:status_pembayaran,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $transaksi = DB::table('transaksi')->where('id', $id)->first();
        if (!$transaksi) {
            return new ResponsResource(false, 'Transaksi tidak ditemukan', null);
        }

        $produk = DB::table('produk')->where('id', $request->produk_id)->first();

        // Update stok produk
        if ($request->jumlah_beli > $transaksi->jumlah_beli) {
            $stokTambahan = $request->jumlah_beli - $transaksi->jumlah_beli;
            if ($produk->stok < $stokTambahan) {
                return new ResponsResource(false, 'Stok produk tidak mencukupi', null);
            }
            DB::table('produk')->where('id', $request->produk_id)->decrement('stok', $stokTambahan);
        } else {
            DB::table('produk')->where('id', $request->produk_id)->increment('stok', $transaksi->jumlah_beli - $request->jumlah_beli);
        }

        // Update transaksi
        $totalHarga = $produk->harga * $request->jumlah_beli;

        DB::table('transaksi')->where('id', $id)->update([
            'user_id' => $request->user_id,
            'produk_id' => $request->produk_id,
            'jumlah_beli' => $request->jumlah_beli,
            'total_harga' => $totalHarga,
            'metode_pembayaran' => $request->metode_pembayaran,
            'status_pembayaran_id' => $request->status_pembayaran_id,
        ]);

        return new ResponsResource(true, 'Transaksi berhasil diperbarui', null);
    }

    // Menghapus transaksi
    public function destroy($id)
    {
        $transaksi = DB::table('transaksi')->where('id', $id)->first();
        if (!$transaksi) {
            return new ResponsResource(false, 'Transaksi tidak ditemukan', null);
        }

        // Kembalikan stok produk
        DB::table('produk')->where('id', $transaksi->produk_id)->increment('stok', $transaksi->jumlah_beli);

        // Hapus transaksi
        DB::table('transaksi')->where('id', $id)->delete();

        return new ResponsResource(true, 'Transaksi berhasil dihapus', null);
    }
}
