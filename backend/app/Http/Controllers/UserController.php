<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index()
    {
        $users = DB::table('user')
            ->select(
                'user.nama',
                'user.email',
                'user.foto',
                'user.no_hp',
                'user.alamat',
                'user.role'
            )
            ->get();
        return new ResponsResource(true, 'List Data User', $users);
    }

    public function show($id)
    {
        $user = DB::table('user')
            ->where('user.id', $id)
            ->select(
                'user.nama',
                'user.email',
                'user.password',
                'user.foto',
                'user.no_hp',
                'user.alamat',
                'user.role'
            )
            ->first();

        if ($user) {
            return new ResponsResource(true, 'Detail Data User', $user);
        } else {
            return new ResponsResource(false, 'User tidak ada', null);
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required',
            'email' => 'required',
            'password' => 'required|min:8',
            'alamat' => 'required',
            'role_id' => 'required',
        ]);

        if ($validator->fails()) {
            return new ResponsResource(false, 'Data User Gagal Ditambahkan', $validator->errors());
        }

        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => $request->password,
            'foto' => $request->foto,
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat,
            'role_id' => $request->role_id,
        ]);

        return new ResponsResource(true, 'Data User Berhasil Ditambahkan', $user);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required',
            'email' => 'required',
            'password' => 'required|min:8',
            'alamat' => 'required',
            'role_id' => 'required',
        ]);

        if ($validator->fails()) {
            return new ResponsResource(false, 'Data User Gagal Diupdate', $validator->errors());
        }

        $user = User::findOrFail($id);
        $user->update([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => $request->password,
            'foto' => $request->foto,
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat,
            'role_id' => $request->role_id,
        ]);

        return new ResponsResource(true, 'Data User Berhasil Diupdate', $user);
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return new ResponsResource(true, 'Data User Berhasil Dihapus', null);
    }
}
