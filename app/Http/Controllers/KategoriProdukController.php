<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\KategoriProduk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;

class KategoriProdukController extends Controller
{
    public function index()
    {
        $kategori = DB::table('kategori_produk')->get();
        return new ResponsResource(true, 'List Data Kategori Produk', $kategori);
    }
}
