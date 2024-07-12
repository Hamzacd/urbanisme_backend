<?php

namespace App\Http\Controllers\Api;

use App\Models\Fournisseur;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\Category;
use Carbon\Carbon;
use App\Models\UrbRequest;
use App\Presenters\UrbRequestPresenter;

class DashboardStatistiqueController extends BaseController
{
    public function getUnapprovedRequest()
    {
        $unaproved_req = UrbRequest::where('status' , 0)

            ->get()->present(UrbRequestPresenter::class);
        return $this->sendResponse($unaproved_req, 'retrieved successfully.');
    }
    public function getApprovedRequest()
    {
        $aproved_req = UrbRequest::where('status' , 1)

        ->get()->present(UrbRequestPresenter::class);
    return $this->sendResponse($aproved_req, 'retrieved successfully.');
    }



    public function getCountConstraction()
    {
        $countConstraction = UrbRequest::where('file_type' , 'Constraction')->count();

        return $this->sendResponse($countConstraction, 'retrieved successfully.');
    }

    public function getCountReparation()
    {
        $countReparation = UrbRequest::where('file_type' , 'Reparation')->count();

        return $this->sendResponse($countReparation, 'retrieved successfully.');
    }

    public function getCountLotissement()
    {
        $countLotissement = UrbRequest::where('file_type' , 'Lotissement')->count();

        return $this->sendResponse($countLotissement, 'retrieved successfully.');
    }

    public function getCountHabiter()
    {
        $countHabiter = UrbRequest::where('file_type' , "Permis d’habiter")->count();

        return $this->sendResponse($countHabiter, 'retrieved successfully.');
    }

}
