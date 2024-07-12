<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\User as UserRessource;
use App\Models\Role;
use App\Models\User;
use App\Presenters\UserPresenter;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends BaseController
{
    public function index()
    {
        $users = User::where('is_deleted' , false)->get()->present(UserPresenter::class);
        return $this->sendResponse($users, 'User retrieved successfully.');
        // return $this->sendResponse(UserRessource::collection($users), 'User retrieved successfully.');
    }


    public function store(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'email' => 'required|unique:users',
            'password' => 'required',
            'name' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $input['password'] = bcrypt($input['password']);

        $user = User::create($input);

        Role::create([
            'user_id' => $user->id,
            'role' => $request->role
        ]);

        return $this->sendResponse(new UserRessource($user), 'User created successfully.');
    }

    public function show($id)
    {

        $user = User::where('id', $id)->where('is_deleted' , false)->get()->present(UserPresenter::class);

        if (is_null($user)) {
            return $this->sendError('User not found.');
        }

        return $this->sendResponse($user, 'User retrieved successfully.');
    }


    public function update(Request $request, User $user)
    {

        $input = $request->all();

        $user = User::where('id', $user->id)->first();

        if($request->email == null){
            $validator = Validator::make($input, [
                'name' => 'required',
            ]);

            $input['email'] = $user->email;
        }else{
            $validator = Validator::make($input, [
                'email' => 'required|unique:users',
                'name' => 'required',
            ]);

            $input['email'] = $request->email;
        }

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $input['avatare'] = $request->avatare;

        $user->name = $input['name'];
        $user->email = $input['email'];
        if( $input['password'] != null) $user->password =  bcrypt($input['password']);
        // $input['password'] != null ? $user->password =  bcrypt($input['password']) : $user->password = $user->password;
        $user->phone = $input['phone'];
        $user->adresse = $input['adresse'];
        $user->cin = $input['cin'];
        $user->avatare = $input['avatare'];
        $user->status = $input['status'];
        $user->save();

        Role::where('user_id', $user->id)->update(['role' => $input['role']]);

        return $this->sendResponse(new UserRessource($user), 'User updated successfully.');
    }


    public function destroy(User $user )
    {
        // $user = User::where('id', $id)->get();
        // if (!is_null($userRole)) {
        //     $userRole->delete();
        // }
        // Role::where('user_id', $user->id)->delete();;
        $user->update(array('is_deleted' => true));
        return $this->sendResponse([], 'User deleted successfully.');
    }



    public function uploadImage(Request $request)
    {

        if ($request->hasFile('imageFile')) {
            // $filename = $request->file('imageFile')->getClientOriginalName();
            $filename = $request->name;
            $extenstion = $request->file('imageFile')->getClientOriginalExtension();
            $autolink = $filename . rand() . '_' . time() . '.' . $extenstion;
            // $path = $request->file('imageFile')->storeAs('public/categories', $autolink);
            $path_2 = $request->file('imageFile')->move(public_path('storage/users'), $autolink);
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

    public function updateStatus(Request $request)
    {
        $input = $request->all();
        $user = User::find($input['id']);

        if (is_null($user)) {
            return $this->sendError('User not found.');
        }
        $user->status = $input['status'];
        $user->save();
        // Get All user updated
        $users = User::where('is_deleted' , false)->get()->present(UserPresenter::class);
        return $this->sendResponse($users, 'User retrieved successfully.');

    }


    public function changePassword(Request $request)
    {
        $user = User::find($request->id);
        $user_password_hashed = $user->password;
        $input = $request->all();

        $validator = Validator::make($input, [
            'OldPassword' => 'required',
            'NewPassword' => 'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $OldPassword = $input['OldPassword'];
        $NewPassword = $input['NewPassword'];

        // if (Hash::make($OldPassword) != $user_password_hashed) {
        //     return $this->sendError('Old Password incorrect', 'incorrect password, Try again !');
        // }

        $user->password = bcrypt($NewPassword);
        $user->save();

        return $this->sendResponse(new UserRessource($user), 'Password updated successfully.');
    }

    public function ChangeInfo(Request $request, User $user){

        $input = $request->all();

        $user->phone = $input['phone'];
        $user->adresse = $input['adresse'];
        $user->cin = $input['cin'];
        $user->save();

        return $this->sendResponse(new UserRessource($user), 'Profile info updated successfully.');
    }

    public function ChangeGeneral(Request $request, User $user){
        $input = $request->all();

        if($request->email == null){
            $validator = Validator::make($input, [
                'name' => 'required',
            ]);

            $input['email'] = $user->email;
        }else{
            $validator = Validator::make($input, [
                'email' => 'required|unique:users',
                'name' => 'required',
            ]);

            $input['email'] = $request->email;
        }

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $input['avatare'] = $request->avatare;
        $user->avatare = $input['avatare'];
        $user->name = $input['name'];
        $user->email = $input['email'];
        $user->save();

        return $this->sendResponse(new UserRessource($user), 'User updated successfully.');
    }
}
