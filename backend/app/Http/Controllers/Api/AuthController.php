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
    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        $user = Auth::user();
        $token = $user->createToken('token')->plainTextToken;

        return response()->json([
            'success' => true,
            'token' => $token,
            'role' => $user->role,  // Pastikan role juga dikirim jika diperlukan
        ]);
    }

    return response()->json(['message' => 'Unauthorized'], 401);
}

}
