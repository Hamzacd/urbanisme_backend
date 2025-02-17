<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'cin' => 'required',
            'password' => 'required',
            'role' => 'required',

        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        try {
            $user = User::create($input);

            $userRole = Role::create([
                'user_id' => $user->id,
                'role' => $input['role']
            ]);

            $user['token'] = $user->createToken($user->email . '_' . now(), [$userRole->role])->accessToken;
            $user['role'] = $userRole->role;

            $success['user'] = $user;

            return $this->sendResponse($success, 'User registered successfully.');
        } catch (\Exception $e) { // Catch any exceptions
            return $this->sendError('Registration Error.', ['error' => $e->getMessage()]);
        }
    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        // Validate request
        // $validator = Validator::make($request->all(), [
        //     'email' => 'required|email|exists:user,email',
        //     'password' => 'required'
        // ]);

        // if($validator->fails()){
        //     return $this->sendError('Validation Error.', $validator->errors());
        // }

        // Authentificate user request
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $user = User::find(Auth::user()->id);

            // Unauthorised user when his status is disabled
            if($user->status == 0){
                return $this->sendError('Your account has been disabled.', ['error'=>'Your account has been disabled']);
            }

            // Add role as scope
            $userRole = $user->role()->first();

            // $success['token'] =  $user->createToken('stockMangeApp')-> accessToken;
            // Token based on user role (scope)
            // $success['token'] =  $user->createToken($user->email . '_' . now() , [$userRole->role])->accessToken;
            // $success['role'] =  $userRole->role;
            // $success['user'] =  $user;
            $user['token'] = $user->createToken($user->email . '_' . now() , [$userRole->role])->accessToken;
            $user['role'] = $userRole->role;
            $success['user'] =  $user;




            return $this->sendResponse($success, 'User login successfully.');
        }
        else{
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        }
    }
}
