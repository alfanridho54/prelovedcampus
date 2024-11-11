<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\ResponsResource;
use App\Models\User;

class UserController extends Controller
{
    public function index()
    {
        $users = DB::table('user')
            ->join('role', 'user.role_id', '=', 'role.id')
            ->select(
                'user.nama',
                'user.email',
                'user.foto',
                'user.no_hp',
                'user.alamat',
                'role.role'
            )
            ->get();
        return new ResponsResource(true, 'List Data User', $users);
    }
}
