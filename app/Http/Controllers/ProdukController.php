<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use DB;
use App\Http\Resources\ResponsResource;

class ProdukController extends Controller
{
    //
    public function index()
    {
        $produk = Produk::all();
        return new ResponsResource(true, 'List Data Produk', $produk);
    }
}
