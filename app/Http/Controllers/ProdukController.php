<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;

class ProdukController extends Controller
{
    //
    public function index()
    {
        $produk = DB::table('produk')
            ->join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->select(
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                'produk.lokasi_gambar',
                'kategori_produk.kategori'
            )
            ->get();
        return new ResponsResource(true, 'List Data Produk', $produk);
    }
}
