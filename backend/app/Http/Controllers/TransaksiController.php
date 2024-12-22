<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaksi;
use App\Models\User;
use App\Models\Produk;

class TransaksiController extends Controller
{
    // Menampilkan daftar transaksi
    public function index()
    {
        $transaksi = Transaksi::with(['user', 'produk', 'statusPembayaran'])->get();
        return response()->json($transaksi);
    }

    // Menambah transaksi baru
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required|exists:user,id',
            'produk_id' => 'required|exists:produk,id',
            'jumlah_beli' => 'required|integer|min:1',
            'total_harga' => 'required|numeric',
            'metode_pembayaran' => 'required|string|max:45',
            'status_pembayaran_id' => 'required|exists:status_pembayaran,id',
        ]);

        $produk = Produk::find($validatedData['produk_id']);
        if ($produk->stok < $validatedData['jumlah_beli']) {
            return response()->json(['message' => 'Stok tidak mencukupi'], 400);
        }

        // Kurangi stok produk
        $produk->stok -= $validatedData['jumlah_beli'];
        $produk->save();

        $transaksi = Transaksi::create($validatedData);
        return response()->json(['message' => 'Transaksi berhasil ditambahkan', 'data' => $transaksi], 201);
    }

    // Mengupdate status pembayaran transaksi
    public function updateStatusPembayaran(Request $request, $id)
    {
        $transaksi = Transaksi::find($id);
        if (!$transaksi) {
            return response()->json(['message' => 'Transaksi tidak ditemukan'], 404);
        }

        $validatedData = $request->validate([
            'status_pembayaran_id' => 'required|exists:status_pembayaran,id',
        ]);

        $transaksi->status_pembayaran_id = $validatedData['status_pembayaran_id'];
        $transaksi->save();

        return response()->json(['message' => 'Status pembayaran berhasil diperbarui', 'data' => $transaksi], 200);
    }
}
