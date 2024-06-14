<?php

namespace App\Models;

use App\Traits\Translatable;
use Illuminate\Database\Eloquent\Model;

class Product extends Model {
	use Translatable;

	/**
	 * The table associated with the model.
	 *
	 * @var string
	 */
	protected $table = 'products';

	public function category() {
		return $this->belongsTo('App\Models\Category', 'category_id')->withDefault();
	}

	public function unit() {
		return $this->belongsTo('App\Models\Unit', 'unit_id')->withDefault();
	}

	public function setSlugAttribute($value) {
		$this->attributes['slug'] = $this->generateSlug($value);
	}

	private function generateSlug($value) {
		$slug = mb_strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $value)));
		$count = Product::where('slug', 'LIKE', $slug . '%')->count();
		$suffix = $count ? $count + 1 : "";
		$slug .= $suffix;
		return $slug;
	}
}