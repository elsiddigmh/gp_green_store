<?php

namespace App\Http\Controllers\Install;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Artisan;

class UpdateController extends Controller
{	
	public function update_migration(){
		 Artisan::call('migrate', ['--force' => true]);
		 echo "Migration Updated Sucessfully";
	} 
}
