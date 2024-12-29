<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KategoriProdukController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\CartController;


// Rute otentikasi
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

// Rute kategori produk
Route::get('/kategori-produk', [KategoriProdukController::class, 'index']);
Route::get('/kategori-produk/{id}', [KategoriProdukController::class, 'show']);

// Semua user bisa melihat produk
Route::get('/produk', [ProdukController::class, 'getAllProducts']);
Route::get('/produk/{id}', [ProdukController::class, 'getProductById']);

// Penjual dapat mengelola produk mereka sendiri
Route::middleware(['auth:sanctum', 'peran:penjual-admin'])->group(function () {
    Route::post('/produk/create', [ProdukController::class, 'store']);
    Route::get('/penjual/produk', [ProdukController::class, 'index']);
});

// Admin dan penjual dapat mengedit atau menghapus produk
Route::middleware(['auth:sanctum', 'peran:admin-penjual'])->group(function () {
    Route::put('/produk/update/{id}', [ProdukController::class, 'update']);
    Route::delete('/produk/delete/{id}', [ProdukController::class, 'destroy']);
});

// Rute transaksi
Route::middleware(['auth:sanctum', 'peran:admin-penjual-customer'])->group(function () {
    Route::get('/transaksi', [TransaksiController::class, 'index']);  // Semua pengguna yang memiliki akses dapat melihat transaksi
    Route::get('/transaksi/{id}', [TransaksiController::class, 'show']);  // Detail transaksi bisa dilihat oleh pengguna yang berwenang
    Route::post('/transaksi/create', [TransaksiController::class, 'store']);  // Membuat transaksi oleh customer
    Route::put('/transaksi/update/{id}', [TransaksiController::class, 'updateStatusPembayaran']);  // Admin bisa mengupdate status pembayaran
    Route::delete('/transaksi/delete/{id}', [TransaksiController::class, 'destroy']);  // Hanya admin yang bisa menghapus transaksi
});

// Rute pengguna (user) dengan autentikasi
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', [UserController::class, 'index']);  // Semua user bisa melihat data dirinya
    Route::get('/user/me', [UserController::class, 'me']);  // Semua user bisa melihat data dirinya
    Route::get('/user/{id}', [UserController::class, 'show']);  // Hanya admin yang bisa melihat data user lain
    Route::put('/user/update', [UserController::class, 'update']);  // Pengguna bisa mengupdate data dirinya
    Route::post('/user/become-seller', [UserController::class, 'updateRoleToPenjual']);  // User bisa menjadi penjual
});

Route::middleware(['auth:sanctum', 'peran:admin'])->group(function () {
    Route::post('/user/create', [UserController::class, 'store']);  // Admin bisa membuat user baru
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy']);  // Admin bisa menghapus user

    // Rute kategori produk
    Route::post('/kategori-produk/create', [KategoriProdukController::class, 'store']);  // Admin bisa menambah kategori produk
    Route::put('/kategori-produk/update/{id}', [KategoriProdukController::class, 'update']);  // Admin bisa mengupdate kategori produk
    Route::delete('/kategori-produk/delete/{id}', [KategoriProdukController::class, 'destroy']);  // Admin bisa menghapus kategori produk
});

// Cart
Route::middleware(['auth:sanctum', 'peran:admin-penjual-customer'])->group(function () {
    Route::prefix('cart')->group(function () {
        Route::get('{userId}', [CartController::class, 'index']);  // Pengguna bisa melihat cart-nya
        Route::post('/', [CartController::class, 'store']);  // Pengguna bisa menambah item ke cart
        Route::delete('{id}', [CartController::class, 'destroy']);  // Pengguna bisa menghapus item dari cart
        Route::post('/checkout', [CartController::class, 'checkout']);  // Pengguna bisa checkout cart
    });
});

