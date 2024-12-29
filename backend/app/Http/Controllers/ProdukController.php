<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\DB;

class ProdukController extends Controller
{

    // Menampilkan daftar produk milik penjual
public function index()
{
    $user = Auth::user();

    if ($user->role === 'admin') {
        $produk = Produk::join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->where('produk.stok', '>', 0)
            ->select(
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                DB::raw("CONCAT('" . asset('storage/') . "/', produk.lokasi_gambar) AS lokasi_gambar"),
                'kategori_produk.kategori' // Menyertakan kategori produk
            )
            ->get();
    } else {
        $produk = Produk::milikPenjual($user->id)
            ->join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->where('produk.stok', '>', 0)
            ->select(
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                DB::raw("CONCAT('" . asset('storage/') . "/', produk.lokasi_gambar) AS lokasi_gambar"),
                'kategori_produk.kategori'
            )
            ->get();
    }

    return new ResponsResource(true, 'List Produk', $produk);
}




    // Menampilkan detail produk
    public function show($id)
    {
        $user = Auth::user();

        // Check if the user is an admin
        if ($user->role === 'admin') {
            // If admin, get the product details regardless of ownership
            $produk = Produk::with('kategoriProduk:id,kategori')->find($id);
        } else {
            // If penjual, get only their own product details
            $produk = Produk::milikPenjual($user->id)
                ->with('kategoriProduk:id,kategori')
                ->find($id);
        }

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        return new ResponsResource(true, 'Detail Data Produk', $produk);
    }


    // Menambahkan produk baru
    public function store(Request $request)
    {
        // Validasi data yang diterima
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'harga' => 'required|numeric|min:0',
            'stok' => 'required|integer|min:0',
            'deskripsi' => 'required|string',
            'kategori_produk_id' => 'required|exists:kategori_produk,id',
            'lokasi_gambar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Jika validasi gagal, return error
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Menyimpan gambar produk di storage public
        $path = $request->file('lokasi_gambar')->store('produk', 'public');

        // Menyimpan produk baru dengan penjual_id yang diambil dari Auth (user yang login)
        $produk = Produk::create([
            'nama' => $request->nama,
            'harga' => $request->harga,
            'stok' => $request->stok,
            'deskripsi' => $request->deskripsi,
            'kategori_produk_id' => $request->kategori_produk_id,
            'lokasi_gambar' => $path,
            'penjual_id' => Auth::id(), // Menambahkan penjual_id sesuai user yang login
        ]);

        // Mengembalikan respons sukses
        return new ResponsResource(true, 'Data Produk Berhasil Ditambahkan', $produk);
    }


    // Memperbarui produk
    public function update(Request $request, $id)
    {


        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'harga' => 'required|numeric|min:0',
            'stok' => 'required|integer|min:0',
            'deskripsi' => 'required|string',
            'kategori_produk_id' => 'required|exists:kategori_produk,id',
            'lokasi_gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $user = Auth::user();
        $produk = Produk::milikPenjual($user->id)->find($id);

        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        if ($request->hasFile('lokasi_gambar')) {
            Storage::delete('public/' . $produk->lokasi_gambar);
            $produk->lokasi_gambar = $request->file('lokasi_gambar')->store('produk', 'public');
        }

        $produk->update($request->only(['nama', 'harga', 'stok', 'deskripsi', 'kategori_produk_id']));

        return new ResponsResource(true, 'Data Produk Berhasil Diubah', $produk);
    }


    // Menghapus produk
    public function destroy($id)
    {
        $user = Auth::user();

        // Jika pengguna adalah admin, tidak perlu cek milik penjual
        if ($user->role === 'admin') {
            $produk = Produk::find($id); // Admin bisa menghapus produk apa saja
        } else {
            // Jika pengguna adalah penjual, hanya dapat menghapus produk miliknya
            $produk = Produk::milikPenjual($user->id)->find($id);
        }

        // Jika produk tidak ditemukan
        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        // Hapus data terkait di transaksi_detail yang menggunakan produk ini
        DB::table('transaksi_detail')->where('produk_id', $produk->id)->delete();

        // Menghapus gambar produk jika ada
        if ($produk->lokasi_gambar) {
            Storage::delete('public/' . $produk->lokasi_gambar);
        }

        // Menghapus produk
        $produk->delete();

        return new ResponsResource(true, 'Data Produk Berhasil Dihapus', null);
    }



    public function getAllProducts(Request $request)
    {
        // Mulai query produk
        $produk = Produk::join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->select(
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                DB::raw("CONCAT('" . asset('storage/') . "/', produk.lokasi_gambar) AS lokasi_gambar"),
                'kategori_produk.kategori'
            )
            ->where('produk.stok', '>', 0); // Filter produk dengan stok > 0

        // filter berdasarkan kategori
        if ($request->has('kategori')) {
            $produk->where('produk.kategori_produk_id', $request->kategori);
        }

        // Eksekusi query dan ambil data produk
        $produk = $produk->get();

        return new ResponsResource(true, 'List Semua Produk', $produk);
    }






    public function getProductById($id)
    {
        // Dapatkan produk berdasarkan id beserta nama penjual
        $produk = Produk::join('kategori_produk', 'produk.kategori_produk_id', '=', 'kategori_produk.id')
            ->join('user', 'produk.penjual_id', '=', 'user.id') // Join dengan tabel users untuk mengambil nama penjual
            ->select(
                'produk.id',
                'produk.nama',
                'produk.harga',
                'produk.deskripsi',
                'produk.stok',
                DB::raw("CONCAT('" . asset('storage/') . "/', produk.lokasi_gambar) AS lokasi_gambar"),
                'kategori_produk.kategori',
                'user.nama as penjual_nama' // Menambahkan kolom penjual_nama
            )
            ->where('produk.id', $id)
            ->first();

        // Jika produk tidak ditemukan
        if (!$produk) {
            return new ResponsResource(false, 'Produk Tidak Ditemukan', null);
        }

        // Mengembalikan response dengan data produk dan nama penjual
        return new ResponsResource(true, 'Detail Produk', $produk);
    }

}


