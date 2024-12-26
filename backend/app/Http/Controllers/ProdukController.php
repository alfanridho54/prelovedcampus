<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\Validator;

class ProdukController extends Controller
{
    public function index()
    {
        $produk = DB::table('produk')
            ->join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->select(
                'produk.id',
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
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                'produk.lokasi_gambar',
                'kategori_produk.kategori'
            )
            ->where('produk.id', $id)
            ->first();

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        return new ResponsResource(true, 'Detail Data Produk', $produk);
    }

    public function store(Request $request)
{
    $validator = Validator::make($request->all(), [
        'kategori_produk_id' => 'required|exists:kategori_produk,id', // Pastikan kategori ada
        'nama' => 'required|string',
        'harga' => 'required|numeric',
        'deskripsi' => 'required|string',
        'stok' => 'required|integer',
        'lokasi_gambar' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'success' => false,
            'message' => 'Validation Error',
            'data' => $validator->errors()
        ], 422);
    }

    // Lanjutkan dengan menambahkan produk jika validasi berhasil
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


    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'kategori_produk_id' => 'required|exists:kategori_produk,id',
            'nama' => 'required|string|max:255',
            'harga' => 'required|numeric',
            'deskripsi' => 'required|string',
            'stok' => 'required|integer',
            'lokasi_gambar' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $produk = Produk::find($id);

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        $produk->update($request->all());

        return new ResponsResource(true, 'Data Produk Berhasil Diubah', $produk);
    }

    public function destroy($id)
    {
        $produk = Produk::find($id);

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        $produk->delete();

        return new ResponsResource(true, 'Data Produk Berhasil Dihapus', null);
    }
}
