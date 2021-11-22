<!-- First you need to extend the CB layout -->
@extends('crudbooster::admin_template')
@section('content')
<!-- Your custom  HTML goes here -->

<section class="content">
      <div class="container-fluid">

      <div class="row">
      <div class='panel panel-default'>
    <div class='panel-heading'>Informasi Site</div>
    <div class='panel-body'>      
    <form>
        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Site / Tower</label>
            <div class="col-sm-10">
             <p>: {{$site->nama}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Type Site</label>
            <div class="col-sm-10">
             <p>: {{$site->type_tower}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Alamat</label>
            <div class="col-sm-10">
             <p>: {{$site->alamat}}</p>
            </div>
        </div>

    </form>
    </div>
    </div>
    </div>
      </div>
<div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-dashboard"></i>
                    <h3 class="box-title">Ringkasan Mateial</h3>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Material</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Satuan</th>
                            <th scope="col">Harga Satuan</th>
                            <th scope="col">Harga Total</th>
                            <th scope="col">Remark</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($material as $row)
                            <tr>
                                <th scope="row">#</th>
                                <td>{{$row->material}}</td>
                                <td>{{$row->qty}}</td>
                                <td>{{$row->satuan}}</td>
                                <td>{{number_format($row->harga)}}</td>
                                <td>{{number_format($row->harga_total)}}</td>
                                <td>{{$row->remark}}</td>
                              
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>

    </div>
</section>

@endsection
