<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KategoriProdukController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\StatusPembayaranController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/kategori_produk', [KategoriProdukController::class, 'index']);
Route::get('/produk', [ProdukController::class, 'index']);
Route::get('/role', [RoleController::class, 'index']);
Route::get('/user', [UserController::class, 'index']);
Route::get('/transaksi', [TransaksiController::class, 'index']);
Route::get('/status_pembayaran', [StatusPembayaranController::class, 'index']);
