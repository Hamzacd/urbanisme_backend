<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Role extends JsonResource
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
            'user_id' => $this->user_id,
            'role' => $this->role,
            'created_at' => $this->created_at === null ? '' : $this->created_at->format('d/m/Y'),
            'updated_at' => $this->updated_at === null ? '' : $this->updated_at->format('H:i:s')
        ];
    }
}
