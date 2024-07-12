<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Setting extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'appName' => $this->appName,
            'appTitle' => $this->appTitle,
            'appLogoImage' => $this->appLogoImage,
            'appBgLoginImage' => $this->appBgLoginImage,
            'appAdresse' => $this->appAdresse,
            'appPhone1' => $this->appPhone1,
            'appPhone2' => $this->appPhone2,
            'appFixe' => $this->appFixe,
            'created_at' => $this->created_at === null ? '' : $this->created_at->format('d/m/Y'),
            'updated_at' => $this->updated_at === null ? '' : $this->updated_at->format('H:i:s')
        ];;
    }
}
