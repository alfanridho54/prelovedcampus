<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Http\Resources\ResponsResource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class RoleController extends Controller
{
    public function index()
    {
        $role = DB::table('role')->get();
        return new ResponsResource(true, 'List Data Role', $role);
    }

    public function show($id)
    {
        $role = DB::table('role')->where('id', $id)->get();
        return new ResponsResource(true, 'List Data Role', $role);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $role = Role::create([
            'role' => $request->role,
        ]);

        return new ResponsResource(true, 'Data Role Berhasil Ditambahkan', $role);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'role' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $role = Role::where('id', $id)->update([
            'role' => $request->role,
        ]);

        return new ResponsResource(true, 'Data Role Berhasil Diubah', $role);
    }

    public function destroy($id)
    {
        $role = Role::where('id', $id)->delete();
        return new ResponsResource(true, 'Data Role Berhasil Dihapus', $role);
    }
}
