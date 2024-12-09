<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ResponsResource;
use App\Models\Transaksi;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class TransaksiController extends Controller
{
    public function index()
    {
        $transaksi = DB::table('transaksi')
            ->join('user', 'transaksi.user_id', '=', 'user.id')
            ->join('produk', 'transaksi.produk_id', '=', 'produk.id')
            ->join('status_pembayaran', 'transaksi.status_pembayaran_id', '=', 'status_pembayaran.id')
            ->select(
                'transaksi.jumlah_beli',
                'transaksi.total_harga',
                'transaksi.metode_pembayaran',
                'transaksi.tanggal_transaksi',
                'user.nama as user_nama',
                'produk.nama as produk_nama',
                'status_pembayaran.status_pembayaran as status_pembayaran'
            )
            ->get();

        return new ResponsResource(true, 'List Data Transaksi', $transaksi);
    }

    public function show($id)
    {
        $transaksi = DB::table('transaksi')
            ->join('user', 'transaksi.user_id', '=', 'user.id')
            ->join('produk', 'transaksi.produk_id', '=', 'produk.id')
            ->join('status_pembayaran', 'transaksi.status_pembayaran_id', '=', 'status_pembayaran.id')
            ->select(
                'transaksi.jumlah_beli',
                'transaksi.total_harga',
                'transaksi.metode_pembayaran',
                'transaksi.tanggal_transaksi',
                'user.nama as user_nama',
                'produk.nama as produk_nama',
                'status_pembayaran.status_pembayaran as status_pembayaran'
            )
            ->where('transaksi.id', $id)
            ->get();
        return new ResponsResource(true, 'List Data Transaksi', $transaksi);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'produk_id' => 'required',
            'jumlah_beli' => 'required',
            'total_harga' => 'required',
            'metode_pembayaran' => 'required',
            'tanggal_transaksi' => 'required',
            'status_pembayaran_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $transaksi = Transaksi::create([
            'user_id' => $request->user_id,
            'produk_id' => $request->produk_id,
            'jumlah_beli' => $request->jumlah_beli,
            'total_harga' => $request->total_harga,
            'metode_pembayaran' => $request->metode_pembayaran,
            'tanggal_transaksi' => $request->tanggal_transaksi,
            'status_pembayaran_id' => $request->status_pembayaran_id,
        ]);

        return new ResponsResource(true, 'Data Transaksi Berhasil Ditambahkan', $transaksi);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'produk_id' => 'required',
            'jumlah_beli' => 'required',
            'total_harga' => 'required',
            'metode_pembayaran' => 'required',
            'tanggal_transaksi' => 'required',
            'status_pembayaran_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $transaksi = Transaksi::findOrFail($id);
        $transaksi->update([
            'user_id' => $request->user_id,
            'produk_id' => $request->produk_id,
            'jumlah_beli' => $request->jumlah_beli,
            'total_harga' => $request->total_harga,
            'metode_pembayaran' => $request->metode_pembayaran,
            'tanggal_transaksi' => $request->tanggal_transaksi,
            'status_pembayaran_id' => $request->status_pembayaran_id,
        ]);

        return new ResponsResource(true, 'Data Transaksi Berhasil Diupdate', $transaksi);
    }

    public function destroy($id)
    {
        $transaksi = Transaksi::findOrFail($id);
        $transaksi->delete();
        return new ResponsResource(true, 'Data Transaksi Berhasil Dihapus', null);
    }
}
