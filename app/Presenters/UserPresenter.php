<?php

namespace App\Presenters;

use App\Models\Role;
use Hemp\Presenter\Presenter;

class UserPresenter extends Presenter
{
    public function getRoleUserAttribute(){
        return Role::where('user_id', $this->id)->first();
    }
}
