<?php

namespace App\Http\Controllers\Api;


use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\UrbRequest;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Presenters\UrbRequestPresenter;
use Illuminate\Support\Facades\Log;

class UrbRequestController extends BaseController
{
   public function index(Request $request)
{
    $keyword = $request->input('file_type');
    $user = $request->user();

    if ($user->role->role === 'admin') {
        $urb_request = UrbRequest::where('file_type', $keyword)->get();
    } elseif ($user->role->role === 'manager') {
        $urb_request = UrbRequest::where('file_type', $keyword)
                                 ->where('user_id', $user->id)
                                 ->get();
    } else {
        $urb_request = collect();
    }
    $urb_request = $urb_request->present(UrbRequestPresenter::class);

    return $this->sendResponse($urb_request, 'retrieved successfully.');
}




    public function store(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'file_type' => 'required',
            'topographiqueFile' => 'required',
            'proprietyFile' => 'required',
            'architectFile' => 'required',
            'procurationFile' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        // Handle file uploads
        // if ($request->hasFile('fileTopographique')) {
        //     $topographiquePath = $request->file('fileTopographique')->store('uploads', 'public');
        //     $input['fileTopographique'] = $topographiquePath;
        // }

        // if ($request->hasFile('fileProprity')) {
        //     $proprityPath = $request->file('fileProprity')->store('uploads', 'public');
        //     $input['fileProprity'] = $proprityPath;
        // }

        // if ($request->hasFile('fileAr')) {
        //     $arPath = $request->file('fileAr')->store('uploads', 'public');
        //     $input['fileAr'] = $arPath;
        // }

        // if ($request->hasFile('filePu')) {
        //     $puPath = $request->file('filePu')->store('uploads', 'public');
        //     $input['filePu'] = $puPath;
        // }
        $input['user_id'] = Auth::user()->id;
        // $urb_req = UrbRequest::create($input);
           // Decode base64 files and store them
    // $topographiqueFile = $this->storeBase64File($input['topographiqueFile']);
    // $proprityFile = $this->storeBase64File($input['proprietyFile']);
    // $arFile = $this->storeBase64File($input['architectFile']);
    // $puFile = $this->storeBase64File($input['procurationFile']);

    // Save to database or handle as needed
    $urb_req = UrbRequest::create($input);
        return $this->sendResponse($urb_req, 'Created successfully.');
    }


    public function show($id)
    {
        $urb_request = UrbRequest::where('id', $id)->first();

        if (is_null($urb_request)) {
            return $this->sendError('not found.');
        }

        return $this->sendResponse($urb_request, 'retrieved successfully.');
    }


    public function update(Request $request, $id)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'topographiqueFile' => 'required',
            'proprietyFile' => 'required',
            'architectFile' => 'required',
            'procurationFile' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }


        $urb_Request = UrbRequest::find($id);
        if (!$urb_Request) {
            return $this->sendError('UrbRequest not found.');
        }

        $urb_Request->topographiqueFile = $input['topographiqueFile'];
        $urb_Request->proprietyFile = $input['proprietyFile'];
        $urb_Request->architectFile = $input['architectFile'];
        $urb_Request->procurationFile = $input['procurationFile'];
        $urb_Request->save();

        return $this->sendResponse($urb_Request, 'Updated successfully.');
    }



    public function destroy(UrbRequest $traite)
    {
        // $traite->update(array('is_deleted' => true));

        // // update statue and payment method in table order
        // $order = Order::find($traite->order_id);
        // $order->payment_status = "unpaid";
        // $order->payment_type = "";
        // $order->save();

        // return $this->sendResponse([], 'Traite deleted successfully.');
    }

    private function storeBase64File($base64File)
    {
        try {

            if (preg_match('/^data:([^;]+);base64,(.+)$/', $base64File, $matches)) {
                $decodedFile = base64_decode($matches[2]);


                $fileName = 'file_' . time() . '.png';
                Storage::disk('public')->put($fileName, $decodedFile);

                return $fileName;
            } else {
                throw new \Exception('Invalid base64 data');
            }
        } catch (\Exception $e) {

            return null;
        }
    }

    public function updateStatus(Request $request)
    {
        $input = $request->all();
        $urb_request = UrbRequest::find($input['id']);

        if (is_null($urb_request)) {
            return $this->sendError('not found.');
        }
        $urb_request->status = $input['status'];
        $urb_request->save();

        $urb_request = UrbRequest::where('file_type', $input['file_type'])->get();
        $urb_request = $urb_request->present(UrbRequestPresenter::class);
        return $this->sendResponse($urb_request, 'retrieved successfully.');

    }

    public function uploadImage(Request $request)
    {

        if ($request->hasFile('imageFile')) {
            // $filename = $request->file('imageFile')->getClientOriginalName();
            $filename = $request->name;
            $extenstion = $request->file('imageFile')->getClientOriginalExtension();
            $autolink = $filename . rand() . '_' . time() . '.' . $extenstion;
            // $path = $request->file('imageFile')->storeAs('public/categories', $autolink);
            $path_2 = $request->file('imageFile')->move(public_path('storage/urb_requests'), $autolink);
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
