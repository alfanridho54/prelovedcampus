<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ResponsResource;
use App\Models\Transaksi;
use Illuminate\Support\Facades\DB;


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
}
