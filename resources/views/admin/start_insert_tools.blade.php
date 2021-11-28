@extends('crudbooster::admin_template')
@section('content')
@push('head')

@endpush





<section class="content">

    <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Informasi Report Tools Bulanan</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>Name</th>
                  <th>{{$row->name}}</th>
                </tr>
                <tr>
                  <td>Tanggal</td>
                  <td>{{$row->tanggal}}</td>
                </tr>
                <tr>
                  <td>Status</td>
                  <td>
                    @if($row->status=="waiting")
                    <span class="label label-md label-warning">{{$row->status}}</span>
                    @elseif($row->status=="reject")
                    <span class="label label-md label-danger">{{$row->status}}</span>
                    @else
                    <span class="label label-md label-primary">{{$row->status}}</span>
                    @endif
                  </td>
                </tr>

              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- /.box -->
        </div>
        </div>

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <center>
          <h3 class="box-title"><b>Pengisian List Tools Tanggal {{$row->tanggal}}</b></h3>
        </center>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>

        @if($row->status=="waiting" || $row->status=="reject")
        <div class="box-body">
          <div class="row">
            <div class="col-xs-12 text-center">
              <a href="{{CRUDBooster::mainpath('step/'.$id_bulan.'/'.$i=1)}}" class="btn btn-primary btn-lg ajax">
                <i class="fa fa-spin fa-refresh"></i>&nbsp; Mulai Untuk Mengisi Tools team
              </a>
            </div>
          </div>
          <div class="ajax-content">
          </div>
        </div>
        @endif

        <div class="box-body">
          <div class="row">
                     <div class="col-xs-12 text-center">
              <a href="{{CRUDBooster::mainpath('checktools/'.$id_bulan)}}" class="btn btn-success btn-lg">
                <i class="fa fa-eye"></i>&nbsp; Lihat Tools Yang Telah Di isi
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.box -->
    </section>

@push('bottom')
<script type="text/javascript">
  // To make Pace works on Ajax calls
  $(document).ajaxStart(function () {
    Pace.restart()
  })
</script>
@endpush
@endsection