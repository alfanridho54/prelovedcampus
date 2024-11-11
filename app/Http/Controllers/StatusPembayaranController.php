<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ResponsResource;
use App\Models\StatusPembayaran;
use Illuminate\Support\Facades\DB;

class StatusPembayaranController extends Controller
{
    public function index()
    {
        $status_pembayaran = DB::table('status_pembayaran')->get();
        return new ResponsResource(true, 'List Data Status Pembayaran', $status_pembayaran);
    }
}
