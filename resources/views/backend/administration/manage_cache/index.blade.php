@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h4 class="header-title">{{ _lang('Cache Management Console') }}</h4>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th class='name'>Description</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class='name'>Cache products data</td>
							<td>
								<a href="{{route('cache.products.add')}}" class="btn btn-primary btn-sm">{{ _lang('Cache Products') }}</a>
							</td>
						</tr>
						<tr>
							<td class='name'>Clear cached products data</td>
							<td>
								<a href="{{route('cache.products.clear')}}" class="btn btn-danger btn-sm">{{ _lang('Clear Product Cache') }}</a>
							</td>
						</tr>
						<tr>
							<td class='name'>Cache categories data</td>
							<td>
								<a href="{{route('cache.categories.add')}}" class="btn btn-primary btn-sm">{{ _lang('Cache Category') }}</a>
							</td>
						</tr>
						<tr>
							<td class='name'>Clear cached categories data</td>
							<td>
								<a href="{{route('cache.categories.clear')}}" class="btn btn-danger btn-sm">{{ _lang('Clear Category Cache') }}</a>
							</td>
						</tr>


						<tr>
							<td class='name'>
								<h4 class="header-title text-muted">{{ _lang('Manage All Application Data') }}</h4>
							</td>
							<td></td>
						</tr>
						
						<tr>
							<td class='name'>Cache all application data</td>
							<td>
								<a href="{{route('cache.all')}}" class="btn btn-primary btn-sm">{{ _lang('Cache All') }}</a>
							</td>
						</tr>
						<tr>
							<td class='name'>Clear all cached application data</td>
							<td>
								<a href="{{route('cache.clear')}}" class="btn btn-danger btn-sm">{{ _lang('Clear All') }}</a>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@endsection