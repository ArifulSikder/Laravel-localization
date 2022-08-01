<?php

use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\App;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LocalizationController;
// Route::get('/', function () {
//     if (! in_array('bn', ['en', 'es', 'fr','bn'])) {
//         abort(400);
//     }
 
//     App::setLocale('bn');

//     return view('welcome');
// });

Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::get('google-autocomplete', [GoogleController::class, 'index']);

Route::get('change/lang', [LocalizationController::class, 'lang_change'])->name('LangChange');
Route::post('add-language', [LocalizationController::class, 'language_add'])->name('language_add');
Route::post('languages_key_value_store', [LocalizationController::class, 'languages_key_value_store'])->name('languages_key_value_store');
Route::post('languages_store', [LocalizationController::class, 'languages_store'])->name('languages_store');