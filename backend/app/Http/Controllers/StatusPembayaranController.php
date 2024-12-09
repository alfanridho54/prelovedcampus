<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ResponsResource;
use App\Models\StatusPembayaran;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class StatusPembayaranController extends Controller
{
    public function index()
    {
        $status_pembayaran = DB::table('status_pembayaran')->get();
        return new ResponsResource(true, 'List Data Status Pembayaran', $status_pembayaran);
    }

    public function show($id)
    {

        $status_pembayaran = DB::table('status_pembayaran')->where('id', $id)->get();
        return new ResponsResource(true, 'List Data Status Pembayaran', $status_pembayaran);
    }

    public function store(Request $request)
    {

        $status_pembayaran = StatusPembayaran::create([
            'status_pembayaran' => $request->status_pembayaran,
        ]);

        return new ResponsResource(true, 'Data Status Pembayaran Berhasil Ditambahkan', $status_pembayaran);


        $validator = Validator::make($request->all(), [
            'status_pembayaran' => 'required|min:3',
        ]);

        if ($validator->fails()) {
            return new ResponsResource(false, 'Gagal menambahkan status pembayaran', $validator->errors());
        }
    }

    public function update(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'status_pembayaran' => 'required|min:3',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $status_pembayaran = StatusPembayaran::where('id', $id)->update([
            'status_pembayaran' => $request->status_pembayaran,
        ]);

        return new ResponsResource(true, 'Data Status Pembayaran Berhasil Diubah', $status_pembayaran);
    }

    public function destroy($id)
    {
        $status_pembayaran = StatusPembayaran::where('id', $id)->delete();
        return new ResponsResource(true, 'Data Status Pembayaran Berhasil Dihapus', $status_pembayaran);
    }
}
