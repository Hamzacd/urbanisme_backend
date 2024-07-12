<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'email_verified_at' => $this->email_verified_at,
            'password' => $this->password,
            'remember_token' => $this->remember_token,
            'phone' => $this->phone,
            'adresse' => $this->adresse,
            'cin' => $this->cin,
            'avatare' => $this->avatare,
            'status' => $this->status,
            'is_deleted' => $this->is_deleted,
            'created_at' => $this->created_at === null ? '' : $this->created_at->format('d/m/Y'),
            'updated_at' => $this->updated_at === null ? '' : $this->updated_at->format('H:i:s')
        ];
    }
}
