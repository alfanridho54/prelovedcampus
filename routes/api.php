<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KategoriProdukController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\StatusPembayaranController;
use App\Http\Controllers\Api\AuthController;


// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

// kategori produk

Route::get('/kategori_produk/{id}', [KategoriProdukController::class, 'show']);
// produk
Route::get('/produk', [ProdukController::class, 'index']);
Route::get('/produk/{id}', [ProdukController::class, 'show']);
Route::middleware(['auth:sanctum', 'peran:admin-penjual-customer'])->group(function () {
    // transaksi
    Route::get('/transaksi', [TransaksiController::class, 'index']);
    Route::get('/transaksi/{id}', [TransaksiController::class, 'show']);
    // status pembayaran
    Route::get('/status_pembayaran', [StatusPembayaranController::class, 'index']);
    Route::get('/status_pembayaran/{id}', [StatusPembayaranController::class, 'show']);
    // transaksi
    Route::post('/transaksi/create', [TransaksiController::class, 'store']);
    Route::put('/transaksi/update/{id}', [TransaksiController::class, 'update']);
    Route::delete('/transaksi/delete/{id}', [TransaksiController::class, 'destroy']);
});

Route::middleware(['auth:sanctum', 'peran:admin'])->group(function () {
    // kategori produk admin
    Route::get('/kategori_produk', [KategoriProdukController::class, 'index']);
    Route::post('/kategori_produk/create', [KategoriProdukController::class, 'store']);
    Route::put('/kategori_produk/update/{id}', [KategoriProdukController::class, 'update']);
    Route::delete('/kategori_produk/delete/{id}', [KategoriProdukController::class, 'destroy']);
    // user
    Route::get('/user', [UserController::class, 'index']);
    Route::get('/user/{id}', [UserController::class, 'show']);
    Route::post('/user/create', [UserController::class, 'store']);
    Route::put('/user/update/{id}', [UserController::class, 'update']);
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy']);
    // status pembayaran
    Route::post('/status_pembayaran/create', [StatusPembayaranController::class, 'store']);
    Route::put('/status_pembayaran/update/{id}', [StatusPembayaranController::class, 'update']);
    Route::delete('/status_pembayaran/delete/{id}', [StatusPembayaranController::class, 'destroy']);
});


Route::middleware(['auth:sanctum', 'peran:admin-penjual'])->group(function () {
    Route::post('/produk/create', [ProdukController::class, 'store']);
    Route::put('/produk/update/{id}', [ProdukController::class, 'update']);
    Route::delete('/produk/delete/{id}', [ProdukController::class, 'destroy']);
});
