<?php

namespace App\Presenters;

use App\Models\User;
use Hemp\Presenter\Presenter;

class UrbRequestPresenter  extends Presenter
{
    public function getUserAttribute(){

        return User::find($this->user_id);
    }

}
