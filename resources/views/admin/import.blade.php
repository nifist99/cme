@extends('crudbooster::admin_template')
@section('content')
@push('head')

@endpush

  <p><a title="Return" href="{{CRUDBooster::mainpath('/')}}"><i class="fa fa-chevron-circle-left "></i>
  &nbsp; Back To Halaman</a></p>

  <section class="content">


  <!-- Default box -->
  <div class="box">
    <div class="box-header with-border">
      <center>
      <h3 class="box-title"><b>Menu Import Excel</b></h3>
    </center>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                title="Collapse">
          <i class="fa fa-minus"></i></button>
        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
          <i class="fa fa-times"></i></button>
      </div>
    </div>

    <div class="box-body">
      <div class="row">
        <div class="col-xs-12 text-center">
          <button class="btn btn-success" data-toggle="modal" data-target="#import">
            <i class="fa fa-download"></i>&nbsp;IMPORT
        </button>
        </div>
      </div>
      <div class="ajax-content">
      </div>
    </div>
    

    <div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">IMPORT DATA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{CRUDBooster::mainpath('import')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>PILIH FILE</label>
                        <input type="file" name="file" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">TUTUP</button>
                    <button type="submit" class="btn btn-success">IMPORT</button>
                </div>
            </form>
        </div>
    </div>
</div>


  </div>
  <!-- /.box -->
</section>
  @push('bottom')
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#table').DataTable();
    } );
</script>
@endpush

@endsection