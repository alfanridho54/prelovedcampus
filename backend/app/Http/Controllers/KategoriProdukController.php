<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\KategoriProduk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\Validator;

class KategoriProdukController extends Controller
{
    public function index()
    {
        $kategori = DB::table('kategori_produk')->get();
        return new ResponsResource(true, 'List Data Kategori Produk', $kategori);
    }

    public function show($id)
    {
        $kategori = DB::table('kategori_produk')->where('id', $id)->first();
        return new ResponsResource(true, 'List Data Kategori Produk', $kategori);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kategori' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $kategori = KategoriProduk::create([
            'kategori' => $request->kategori,
        ]);

        return new ResponsResource(true, 'Data Kategori Produk Berhasil Ditambahkan', $kategori);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'kategori' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $kategori = KategoriProduk::where('id', $id)->update([
            'kategori' => $request->kategori,
        ]);

        return new ResponsResource(true, 'Data Kategori Produk Berhasil Diubah', $kategori);
    }

    public function destroy($id)
    {
        $kategori = KategoriProduk::where('id', $id)->delete();
        return new ResponsResource(true, 'Data Kategori Produk Berhasil Dihapus', $kategori);
    }
}
