<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Http\Resources\ResponsResource;

class RoleController extends Controller
{
    public function index()
    {
        $role = Role::all();
        return new ResponsResource(true, 'List Data Role', $role);
    }
}
