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
Route::post('/kategori_produk/update/{id}', [KategoriProdukController::class, 'update']);
Route::post('/kategori_produk/delete/{id}', [KategoriProdukController::class, 'destroy']);

// produk
Route::get('/produk', [ProdukController::class, 'index']);
Route::get('/produk/{id}', [ProdukController::class, 'show']);
Route::post('/produk/create', [ProdukController::class, 'store']);
Route::post('/produk/update/{id}', [ProdukController::class, 'update']);
Route::post('/produk/delete/{id}', [ProdukController::class, 'destroy']);

// role
Route::get('/role', [RoleController::class, 'index']);
Route::get('/role/{id}', [RoleController::class, 'show']);
Route::post('/role/create', [RoleController::class, 'store']);
Route::post('/role/update/{id}', [RoleController::class, 'update']);
Route::post('/role/delete/{id}', [RoleController::class, 'destroy']);

// user
Route::get('/user', [UserController::class, 'index']);
Route::get('/user/{id}', [UserController::class, 'show']);
Route::post('/user/create', [UserController::class, 'store']);
Route::post('/user/update/{id}', [UserController::class, 'update']);
Route::post('/user/delete/{id}', [UserController::class, 'destroy']);

// transaksi
Route::get('/transaksi', [TransaksiController::class, 'index']);
Route::get('/transaksi/{id}', [TransaksiController::class, 'show']);
Route::post('/transaksi/create', [TransaksiController::class, 'store']);
Route::post('/transaksi/update/{id}', [TransaksiController::class, 'update']);
Route::post('/transaksi/delete/{id}', [TransaksiController::class, 'destroy']);

// status pembayaran
Route::get('/status_pembayaran', [StatusPembayaranController::class, 'index']);
Route::get('/status_pembayaran/{id}', [StatusPembayaranController::class, 'show']);
Route::post('/status_pembayaran/create', [StatusPembayaranController::class, 'store']);
Route::post('/status_pembayaran/update/{id}', [StatusPembayaranController::class, 'update']);
Route::post('/status_pembayaran/delete/{id}', [StatusPembayaranController::class, 'destroy']);
