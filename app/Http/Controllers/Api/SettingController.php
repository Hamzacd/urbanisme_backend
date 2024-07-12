<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Setting as SettingRessource;
use App\Models\Setting;
use App\Presenters\SettingPresenter;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SettingController extends BaseController
{


    public function show()
    {

        $setting = Setting::all();

        if ($setting->count() == 0) {
            return $this->sendResponse([], 'Setting app not found');
            // return $this->sendError('Setting app not found.');
        }

        // Get First row in settings table
        return $this->sendResponse(new SettingRessource($setting[0]), 'Setting App retrieved successfully.');
    }


    public function update(Request $request)
    {
        $input = $request->all();
        if($request->id != null){
            if(!empty($request->TypeImgToremove)){
                $setting = Setting::find($request->id);
                if($request->TypeImgToremove == 'logo') $setting->appLogoImage = null;
                if($request->TypeImgToremove == 'background') $setting->appBgLoginImage = null;
                $setting->save();
                
            }else{
                $setting = Setting::find($request->id);
                $setting->appName = $request->appName;
                $setting->appTitle = $request->appTitle;
                $setting->appLogoImage = $request->appLogoImage;
                $setting->appBgLoginImage = $request->appBgLoginImage;
                $setting->appAdresse = $request->appAdresse;
                $setting->appPhone1 = $request->appPhone1;
                $setting->appPhone2 = $request->appPhone2;
                $setting->appFixe = $request->appFixe;
                $setting->save();
            }
            
        }else{
            $setting = Setting::create($input);
        }

        return $this->sendResponse(new SettingRessource($setting), 'Setting App updated successfully.');
    }

    public function updateImagesAppSetting(Request $request)
    {

        if ($request->hasFile('imageFile')) {
            // $filename = $request->file('imageFile')->getClientOriginalName();
            $filename = $request->name;
            $extenstion = $request->file('imageFile')->getClientOriginalExtension();
            $autolink = $filename . rand() . '_' . time() . '.' . $extenstion;
            // $path = $request->file('imageFile')->storeAs('public/categories', $autolink);
            $path_2 = $request->file('imageFile')->move(public_path('storage/settings'), $autolink);
            if ($path_2) {
                return response()->json(
                    [
                        'result' => 'ok',
                        'data' => ['filename' => $autolink],
                        'msg' => "Image saved successfully"
                    ]
                );
            }
        } else {
            return response()->json(
                [
                    'result' => 'no',
                    'data' => [],
                    'msg' => "Something went wrong !!!"
                ]
            );
        }
    }
}
