<!-- First you need to extend the CB layout -->
@extends('crudbooster::admin_template')
@section('content')
@push('head')

@endpush

  <p><a title="Return" href="{{CRUDBooster::mainpath('tools/'.$id_bulan)}}"><i class="fa fa-chevron-circle-left "></i>
  &nbsp; Back To Halaman</a></p>


<div class="row">

	<div class="col-md-6">

		@if(Session::get('mesage'))

		       <div class="alert alert-{{Session::get('message_type')}} alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                {{Session::get('message')}}
              </div>
          @endif

		<!-- Horizontal Form -->
		<div class="box box-info" style="min-height: 300px">
			<div class="box-header with-border">
				<center>
				<h3 class="box-title"><b>{{$tools->nama}}</b></h3>
			    </center>
			</div>

			
   @if($cek_pengisian==null)
			<center>
				<div><img id="output" width="300" /></div>
			</center>

			 <center>
				<button class="btn btn-primary btn-sm" style="margin-top: 5px">
					<label for="file" style="cursor: pointer;">
					<span class="fa fa-upload">
					</span> Choose a file (Silahkan Pilih Foto)</label>
				</button>
			</center>

			<form class="form-horizontal" method="post" action="{{CRUDBooster::mainpath('simpan')}}" 
			enctype="multipart/form-data" >
				{{csrf_field()}}

				<input type="hidden" name="id_tools_bulanan" value="{{$id_bulan}}">
				<input type="hidden" name="nama" value="{{$tools->nama}}">
				<input type="hidden" name="blade_view" value="{{$tools->blade_view}}">
				<!-- <input type="hidden" name="nama_database" value="{{$tools->nama_database}}"> -->

				<div class="box-footer" style="margin-top: 30px">
					 <div class="box-body">

			<input type="file" class="inputfile" name="foto" id="file" 
				 onchange="previewImage();" style="display: none;">

				 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Jumlah Alat</label>

                  <div class="col-sm-10">
                    <input type="number" class="form-control" name="jumlah" id="inputEmail3" placeholder="jumlah">
                  </div>
                </div>


                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Catatan alat</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="catatan" id="inputEmail3" placeholder="catatan">
                  </div>
                </div>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Kondisi Alat</label>

                  <div class="col-sm-10">
                   <select class="form-control select" name="kondisi">
                  <option>baik</option>
                  <option>rusak</option>
                </select>
                  </div>
                </div>


            </div>

				</div>

				<div class="box-footer" style="margin-top: 30px">
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$back)}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Sebelumnya</a>

					<input type="submit" class="btn btn-success center" value="simpan" />

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$next)}}" class="btn btn-primary pull-right">Selanjutnya <i class="fa fa-chevron-circle-right"></i></a>
				</div>

			</form>

	@else
           
           @if($cek_pengisian->foto)
	        <center>
			<div><img src="{{url($cek_pengisian->foto)}}" width="300" /></div>
			</center>

			 <center>
				<a href="{{CRUDBooster::mainpath('delete_image/'.$cek_pengisian->id)}}" class="btn btn-danger btn-sm" style="margin-top: 5px">
					<label style="cursor: pointer;">
					<span class="fa fa-trash">
					</span>Ganti Foto</label>
				</a>
			</center>
			@else

		   <center>
				<div><img id="output" width="300" /></div>
			</center>

			 <center>
				<button class="btn btn-primary btn-sm" style="margin-top: 5px">
					<label for="file" style="cursor: pointer;">
					<span class="fa fa-upload">
					</span> Choose a file (Silahkan Pilih Foto)</label>
				</button>
			</center>

			@endif

			<form class="form-horizontal" method="post" action="{{CRUDBooster::mainpath('edit')}}" 
			enctype="multipart/form-data" >
				{{csrf_field()}}
                <input type="hidden" name="id" value="{{$cek_pengisian->id}}">
				<input type="hidden" name="id_tools_bulanan" value="{{$id_bulan}}">
				<input type="hidden" name="nama" value="{{$cek_pengisian->nama}}">
				<input type="hidden" name="blade_view" value="{{$cek_pengisian->blade_view}}">
				<!-- <input type="hidden" name="nama_database" value="{{$cek_pengisian->nama_database}}"> -->

				<div class="box-footer" style="margin-top: 30px">
					 <div class="box-body">

			<input type="file" class="inputfile" name="foto" id="file" 
				 onchange="previewImage();" style="display: none;">

				 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Jumlah Alat</label>

                  <div class="col-sm-10">
                    <input type="number" class="form-control" name="jumlah" value="{{$cek_pengisian->jumlah}}" placeholder="jumlah">
                  </div>
                </div>


                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Catatan alat</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="catatan" value="{{$cek_pengisian->catatan}}" placeholder="catatan">
                  </div>
                </div>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Kondisi Alat</label>

                  <div class="col-sm-10">
                   <select class="form-control select" name="kondisi">
                  <option selected="" value="{{$cek_pengisian->kondisi}}">{{$cek_pengisian->kondisi}}</option>
                  @if($cek_pengisian->kondisi=="baik")
                  <option>rusak</option>
                  @else
                   <option>baik</option>
                  @endif
                </select>
                  </div>
                </div>


            </div>

				</div>

				<div class="box-footer" style="margin-top: 30px">
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$back)}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Sebelumnya</a>

					<input type="submit" class="btn btn-warning center" value="Edit" />

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$next)}}" class="btn btn-primary pull-right">Selanjutnya <i class="fa fa-chevron-circle-right"></i></a>
				</div>

			</form>



	@endif


			</div>
		</div>



		<div class="col-md-3">
			<!-- Horizontal Form -->
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Alat Pelindung Diri</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($apd as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="background-color:#3c8dbc;color: white">
						<i class="fa fa-check" style="color:white"></i>{{$val->blade_view}}
					</a>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="color:black">
						<i class="fa fa-image"></i> {{$val->blade_view}}
					</a>

					@endif
					@endforeach
				</div>
			</div>

			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Tools</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($tools_semua as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="background-color:#3c8dbc;color: white">
						<i class="fa fa-check" style="color:white"></i>{{$val->blade_view}}
					</a>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="color:black">
						<i class="fa fa-image"></i> {{$val->blade_view}}
					</a>

					@endif
					@endforeach
				</div>
			</div>

			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Alat Berat</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($alat_berat as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="background-color:#3c8dbc;color: white">
						<i class="fa fa-check" style="color:white"></i>{{$val->blade_view}}
					</a>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" class="btn btn-app" style="color:black">
						<i class="fa fa-image"></i> {{$val->blade_view}}
					</a>

					@endif
					@endforeach
				</div>
			</div>
			

		</div>

		<div class="col-md-3">
			<!-- Horizontal Form -->
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Alat Pelindung Diri</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($apd as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" style="background-color:#3c8dbc;color: white">
						<i style="color:white"></i>{{$val->blade_view}} {{$val->nama}}
					</a>
					<br>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}"  style="color:black">
						<i></i> {{$val->blade_view}} {{$val->nama}}
					</a>
					<br>

					@endif
					@endforeach
				</div>
			</div>

			<!-- Horizontal Form -->
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Tools</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($tools_semua as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" style="background-color:#3c8dbc;color: white">
						<i style="color:white"></i>{{$val->blade_view}} {{$val->nama}}
					</a>
					<br>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}"  style="color:black">
						<i></i> {{$val->blade_view}} {{$val->nama}}
					</a>
					<br>

					@endif
					@endforeach
				</div>
			</div>

			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Alat Berat</h3>
				</div>
				<div class="box-body">
					<?php $i=1; ?>
					@foreach($alat_berat as $val)
					@if(CRUDBooster::cek_pengisian_tools_bulanan($id_bulan,$val->blade_view))
					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}" style="background-color:#3c8dbc;color: white">
						<i style="color:white"></i>{{$val->blade_view}} {{$val->nama}}
					</a>
					<br>
					@else

					<a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$val->blade_view)}}"  style="color:black">
						<i></i> {{$val->blade_view}} {{$val->nama}}
					</a>
					<br>

					@endif
					@endforeach
				</div>
			</div>

		</div>


		@push('bottom')
<!-- 		<script>
			var loadFile = function(event) {
				var image = document.getElementById('output');
				image.src = URL.createObjectURL(event.target.files[0]);
			};
		</script> -->

		<script type="text/javascript">
function previewImage() {
    document.getElementById("output").style.display = "block";
    var oFReader = new FileReader();
     oFReader.readAsDataURL(document.getElementById("file").files[0]);
 
    oFReader.onload = function(oFREvent) {
      document.getElementById("output").src = oFREvent.target.result;
    };
  };
		</script>


		@endpush
		@endsection