<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\Api\DashboardStatistiqueController;
use App\Http\Controllers\Api\UrbRequestController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register', [AuthController::class, 'register'])->middleware(['cors']);
Route::post('login', [AuthController::class, 'login'])->middleware(['cors']);

// Setting App
Route::controller(SettingController::class)->middleware(['cors'])->group(function () {
    Route::get('/settings', 'show')->name('setting.show');
    Route::post('/settings', 'update')->name('setting.update');
    Route::post('/settings/updateImagesAppSetting', 'updateImagesAppSetting')->name('setting.updateImagesAppSetting');
});

Route::middleware(['auth:api','scope:admin,manager','cors'])->group(function () {

    // user
    Route::resource('users', UserController::class);
    Route::controller(UserController::class)->group(function () {
        Route::get('/listUsers', 'index')->name('users.listUsers');
        Route::post('/users/uploadImage', 'uploadImage')->name('users.uploadImage');
        Route::post('/users/updateStatus', 'updateStatus')->name('users.updateStatus');
        Route::get('/get_user/{id}', 'show')->name('user.show');
        Route::post('/profile/changePassword/', 'changePassword')->name('profile.changePassword');
        Route::put('/profile/info/{user}', 'ChangeInfo')->name('profile.ChangeInfo');
        Route::put('/profile/general/{user}', 'ChangeGeneral')->name('profile.ChangeGeneral');
    });

    Route::resource('urb_requests', UrbRequestController::class);
    Route::controller(UrbRequestController::class)->group(function () {
        Route::get('/urb_requests', 'index')->name('urb_requests.index');
        Route::post('/urb_requests', 'store')->name('urb_requests.store');
        Route::get('/get_urb_requests/{id}', 'show')->name('urb_requests.show');
        Route::put('urb_requests/{id}', 'update')->name('urb_requests.update');
        Route::post('/urb_requests/updateStatus', 'updateStatus')->name('urb_requests.updateStatus');
        Route::post('/urb_requests/uploadImage', 'uploadImage')->name('urb_requests.uploadImage');

    });
    // dashboard statistique
    Route::controller(DashboardStatistiqueController::class)->group(function () {
        Route::get('/get_unapproved_request', 'getUnapprovedRequest')->name('urb_requests.getUnapprovedRequest');
        Route::get('/get_approved_request', 'getApprovedRequest')->name('urb_requests.getApprovedRequest');
        Route::get('/get_count_constraction', 'getCountConstraction')->name('urb_requests.getCountConstraction');
        Route::get('/get_count_reparation', 'getCountReparation')->name('urb_requests.getCountReparation');
        Route::get('/get_count_lotissement', 'getCountLotissement')->name('urb_requests.getCountLotissement');
        Route::get('/get_count_habiter', 'getCountHabiter')->name('urb_requests.getCountHabiter');

    });
});
