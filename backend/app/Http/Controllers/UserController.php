<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function index(Request $request)
    {
        // Mendapatkan data user
        $users = User::all();

        return new ResponsResource(true, 'List Data User', $users);
    }

    public function show($id)
    {
        $user = User::find($id);

        if (!$user) {
            return new ResponsResource(false, 'User Tidak Ditemukan', null);
        }

        // Tambahkan validasi untuk memastikan hanya admin yang bisa melihat data user lain
        if (Auth::user()->id !== $user->id && Auth::user()->role !== 'admin') {
            return new ResponsResource(false, 'Anda tidak memiliki izin untuk mengakses data ini.', null);
        }

        return new ResponsResource(true, 'Detail Data User', $user);
    }


    public function store(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'no_hp' => 'required|string|max:15',
            'alamat' => 'required|string',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',  // Validasi foto
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Jika ada file foto, simpan ke storage
        $fotoPath = null;
        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('profile', 'public');
        }

        // Membuat user baru
        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat,
            'foto' => $fotoPath,  // Simpan path foto
        ]);

        return new ResponsResource(true, 'User Berhasil Ditambahkan', $user);
    }

    public function update(Request $request)
    {

        $user = Auth::user();  // Ambil user yang sedang login

        if (!$user) {
            return new ResponsResource(false, 'User Tidak Ditemukan', null);
        }

        // Validasi input data
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',  // Pastikan menggunakan field 'nama'
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'no_hp' => 'required|string|max:15',
            'alamat' => 'required|string',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',  // Validasi foto
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Menyimpan foto jika ada
        $fotoPath = $user->foto;  // Gunakan foto lama jika tidak ada foto baru
        if ($request->hasFile('foto')) {
            // Menghapus foto lama jika ada
            if ($user->foto) {
                Storage::delete('public/' . $user->foto);  // Hapus foto lama
            }
            // Menyimpan foto baru
            $fotoPath = $request->file('foto')->store('profile', 'public');
        }

        // Update data user
        $user->update([
            'nama' => $request->nama,
            'email' => $request->email,
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat,
            'foto' => $fotoPath,  // Update foto path
        ]);

        // Menghasilkan URL untuk foto
        $fotoUrl = Storage::url($fotoPath);

        return new ResponsResource(true, 'User Berhasil Diperbarui', [
            'user' => $user,
            'foto_url' => $fotoUrl,  // Menyertakan URL foto untuk frontend
        ]);
    }
    public function destroy($id)
    {
        // Mencari user berdasarkan ID
        $user = User::find($id);

        if (!$user) {
            return new ResponsResource(false, 'User Tidak Ditemukan', null);
        }

        // Hapus foto jika ada
        if ($user->foto) {
            Storage::delete('public/' . $user->foto);
        }

        // Hapus user
        $user->delete();

        return new ResponsResource(true, 'User Berhasil Dihapus', null);
    }

    public function updateRoleToPenjual(Request $request)
    {
        try {
            $user = auth()->user(); // Ambil user yang sedang login

            if (!$user) {
                return new ResponsResource(false, 'User tidak ditemukan.', null);
            }

            // Periksa jika role user sudah menjadi penjual
            if ($user->role === 'penjual') {
                return new ResponsResource(false, 'Anda sudah menjadi penjual.', null);
            }

            // Update role menjadi penjual
            $user->update(['role' => 'penjual']);

            return new ResponsResource(true, 'Role berhasil diperbarui menjadi penjual.', $user);
        } catch (\Exception $e) {
            \Log::error('Error saat memperbarui role:', ['error' => $e->getMessage()]);
            return new ResponsResource(false, 'Terjadi kesalahan saat memperbarui role.', null);
        }
    }

    public function me(Request $request)
{
    $user = $request->user();

    return new ResponsResource(true, 'Data User yang Login', $user);
}



}
