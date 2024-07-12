<?php

namespace App\Presenters;

use Hemp\Presenter\Presenter;
use Hemp\Presenter\PresenterFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;


class ApiPresenter extends Presenter
{
    public $snakeCase = false;

    static  $fillObjects = [];


    // public static function convert($attributes, $model = null)
    // {
    //     $presenter = (new PresenterFactory)($model, ApiPresenter::class)->snakeCase();
    //     if ($model instanceof Model) {
    //         // return $presenter->processKeys($attributes);
    //         return $model->fill($presenter->processKeys($attributes));
    //     }
    //     return new $model($presenter->processKeys($attributes));
    // }

    // public static function transformToCamelCase($attributes, $model = null)
    // {

    //     $presenter = (new PresenterFactory)($model, ApiPresenter::class)->camelCase();
    //     if ($model instanceof Model) {
    //         return $model->fill($presenter->processKeys($attributes));
    //     }
    //     return new $model($presenter->processKeys($attributes));
    // }


    // public  static function setFillObjects($listObjectNmes)
    // {
    //     AssessmentPresenter::$fillObjects = is_array($listObjectNmes) ? $listObjectNmes : [];
    // }

    // public static function clearFillObjects()
    // {
    //     AssessmentPresenter::$fillObjects = [];
    // }
}
