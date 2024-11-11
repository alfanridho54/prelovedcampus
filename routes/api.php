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

// kategori produk
Route::get('/kategori_produk', [KategoriProdukController::class, 'index']);
Route::get('/kategori_produk/{id}', [KategoriProdukController::class, 'show']);
Route::post('/kategori_produk/create', [KategoriProdukController::class, 'store']);

// produk
Route::get('/produk', [ProdukController::class, 'index']);
Route::get('/produk/{id}', [ProdukController::class, 'show']);
Route::post('/produk/create', [ProdukController::class, 'store']);

// role
Route::get('/role', [RoleController::class, 'index']);
Route::get('/role/{id}', [RoleController::class, 'show']);
Route::post('/role/create', [RoleController::class, 'store']);

// user
Route::get('/user', [UserController::class, 'index']);
Route::get('/user/{id}', [UserController::class, 'show']);
Route::post('/user/create', [UserController::class, 'store']);

// transaksi
Route::get('/transaksi', [TransaksiController::class, 'index']);
Route::get('/transaksi/{id}', [TransaksiController::class, 'show']);
Route::post('/transaksi/create', [TransaksiController::class, 'store']);

// status pembayaran
Route::get('/status_pembayaran', [StatusPembayaranController::class, 'index']);
Route::get('/status_pembayaran/{id}', [StatusPembayaranController::class, 'show']);
Route::post('/status_pembayaran/create', [StatusPembayaranController::class, 'store']);
