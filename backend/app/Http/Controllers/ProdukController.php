<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage; // Pastikan ini di luar kelas

class ProdukController extends Controller
{
    public function index(Request $request)
    {
        $query = DB::table('produk')
            ->join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->select(
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                'produk.lokasi_gambar',
                'kategori_produk.kategori'
            );

        // Jika ada parameter kategori, filter produk berdasarkan kategori_produk_id
        if ($request->has('kategori')) {
            $query->where('produk.kategori_produk_id', $request->kategori);
        }

        $produk = $query->get();

        // Proses URL gambar setelah query
        $produk = $produk->map(function ($item) {
            $item->lokasi_gambar = asset('storage/' . $item->lokasi_gambar);
            return $item;
        });

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
    // Cek apakah file gambar ada
    if (!$request->hasFile('lokasi_gambar')) {
        return response()->json(['error' => 'Gambar produk tidak ditemukan'], 422);
    }

    $validator = Validator::make($request->all(), [
        'nama' => 'required|string|max:255',
        'harga' => 'required|numeric|min:0',
        'stok' => 'required|integer|min:0',
        'deskripsi' => 'required|string',
        'kategori_produk_id' => 'required|exists:kategori_produk,id',
        'lokasi_gambar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',  // Validasi gambar
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    // Menyimpan gambar ke storage
    $path = $request->file('lokasi_gambar')->store('produk', 'public');  // Pastikan nama file sesuai dengan 'lokasi_gambar'

    // Simpan data produk ke database
    $produk = Produk::create([
        'nama' => $request->nama,
        'harga' => $request->harga,
        'stok' => $request->stok,
        'deskripsi' => $request->deskripsi,
        'kategori_produk_id' => $request->kategori_produk_id,
        'lokasi_gambar' => $path,  // Simpan path gambar ke kolom 'lokasi_gambar'
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
            'lokasi_gambar' => 'nullable|string', // Optional jika tidak mengganti gambar
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $produk = Produk::find($id);

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        // Perbarui data
        $produk->update($request->only(['nama', 'harga', 'deskripsi', 'stok', 'kategori_produk_id', 'lokasi_gambar']));

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
