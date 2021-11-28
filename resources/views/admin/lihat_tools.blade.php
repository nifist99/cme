@extends('crudbooster::admin_template')
@section('content')
@push('head')

@endpush

  <p><a title="Return" href="{{CRUDBooster::mainpath('tools/'.$id_bulan)}}"><i class="fa fa-chevron-circle-left "></i>
  &nbsp; Back To Halaman</a></p>


 <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">{{$page_title}}</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm hidden-xs" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>Nama</th>
                  <th>Jumlah</th>
                  <th>Catatan</th>
                  <th>Konsisi</th>
                 <th>Foto</th>
                </tr>
                @foreach($result as $row)
                <tr>
                  <td>{{$row->nama}}</td>
                  <td>{{$row->jumlah}}</td>
                  <td>{{$row->catatan}}</td>
                  <td>
                  	@if($row->kondisi=="baik")
                  	<span class="label label-success">Baik</span>
                  	@else
                  	<span class="label label-danger">Rusak</span>
                  	@endif
                  </td>
                  <td>
                  	<img src="{{url($row->foto)}}" width="400px">
                  </td>
                </tr>
                @endforeach
                </table>
            </div>
        </div>
    </div>
</div>

@push('bottom')

@endpush

@endsection