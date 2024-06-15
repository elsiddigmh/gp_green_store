@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h4 class="header-title">{{ _lang('Manage Cache Opreation') }}</h4>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>{{ _lang('Command') }}</th>
							<th>{{ _lang('Subject') }}</th>
							<th class="text-center">{{ _lang('Action') }}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class='name'>Add Category Cache</td>
							<td class='subject'>This Command looping in all categories row and add it in caching</td>
							<td class="text-center">
								<a href="#" class="btn btn-primary btn-sm">{{ _lang('Add') }}</a>
							</td>
						</tr>
						<tr>
							<td class='name'>Empty Category Cache</td>
							<td class='subject'>This Command looping in all categories row in redis and deleted it</td>
							<td class="text-center">
								<a href="#" class="btn btn-danger btn-sm">{{ _lang('Delete') }}</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@endsection