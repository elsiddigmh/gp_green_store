<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource {
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request) {
        //return parent::toArray($request);
        return [
            'id'             => $this->id,
            'slug'           => $this->slug,
            'icon'           => $this->icon,
            'image'          => '/uploads/media/' . $this->image,
            'banner'         => $this->banner != '' ? '/uploads/media/' . $this->banner : '',
            'name'           => $this->name,
            'sub_categories' => $this->sub_categories,
            'parent_id'      => $this->parent_id,
        ];
    }
}
