<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\ResponsResource;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $input = [
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ];

        $user = User::create($input);

        return new ResponsResource(true, 'Data User Berhasil Ditambahkan', $user);
    }

    public function login(Request $request)
    {
        $input = [
            'email' => $request->email,
            'password' => $request->password
        ];

        $user = User::where('email', $input['email'])->first();

        if (Auth::attempt($input)) {
            $user = Auth::user();
            $success['token'] = $user->createToken('token')->plainTextToken;
            return new ResponsResource(true, 'User Berhasil Login', $success);
        } else {
            return new ResponsResource(false, 'User Gagal Login', null);
        }
    }
}
