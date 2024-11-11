<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\Validator;

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

    public function show($id)
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
            ->where('produk.id', $id)
            ->get();
        return new ResponsResource(true, 'List Data Produk', $produk);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kategori_produk_id' => 'required',
            'nama' => 'required',
            'harga' => 'required',
            'deskripsi' => 'required',
            'stok' => 'required',
            'lokasi_gambar' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $produk = Produk::create([
            'kategori_produk_id' => $request->kategori_produk_id,
            'nama' => $request->nama,
            'harga' => $request->harga,
            'deskripsi' => $request->deskripsi,
            'stok' => $request->stok,
            'lokasi_gambar' => $request->lokasi_gambar,
        ]);

        return new ResponsResource(true, 'Data Produk Berhasil Ditambahkan', $produk);
    }
}
