<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')
  <!-- Your html goes here -->
  <a href="{{CRUDBooster::mainpath()}}" class="btn btn-sm btn-primary">back to menu</a>
  <div class='panel panel-default'>
    <div class='panel-heading'>Detail Request</div>
    <div class='panel-body'>      
    <form>
        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Waspang</label>
            <div class="col-sm-10">
             <p>: {{$row->name}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Suplier</label>
            <div class="col-sm-10">
             <p>: {{$suplier->name}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Tanggal Request</label>
            <div class="col-sm-10">
             <p>: {{$row->tanggal}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Site</label>
            <div class="col-sm-10">
             <p>: {{$row->site}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Aktivitas</label>
            <div class="col-sm-10">
             <p>: {{$row->activity}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Remark / Catatan</label>
            <div class="col-sm-10">
             <p>: {{$row->remark}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Harga Total</label>
            <div class="col-sm-10">
             <p>: Rp.{{number_format($price)}}</p>
            </div>
        </div>
        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Status</label>
            <div class="col-sm-10">
             <p>: {{$row->status}}</p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Bukti Transfer Admin</label>
            <div class="col-sm-10">
             @if($row->bukti_tf_admin==null)
             <p>: bukti tf belum di upload</p>
             @else
             <img width="200px" height="200px" src="{{url($row->bukti_tf_admin)}}">
             @endif
            </div>
        </div>
        
      </form>
      <hr>
        <div>
            <h4><b>Detail Material Yang Di Pesan</b></h4>
        </div>
      <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Material</th>
            <th scope="col">Harga</th>
            <th scope="col">Satuan</th>
            <th scope="col">Qty</th>
            <th scope="col">Harga Total</th>
            </tr>
        </thead>
        <tbody>
            <?php $i=1;?>
            @foreach($material as $key)
                <tr>
                <th scope="row">{{$i++}}</th>
                <td>{{$key->material}}</td>
                <td>{{number_format($key->harga)}}</td>
                <td>{{$key->satuan}}</td>
                <td>{{$key->qty}}</td>
                <td>{{number_format($key->harga_total)}}</td>
                </tr>
                <?php $total+=$key->harga_total; ?>
            @endforeach
                <tr>
                <td colspan="5"><b>Total Harga</b></td>
                <td><b>Rp.{{number_format($total)}}</b></td>
                </tr>
        </tbody>
        </table>

        <hr>
        <div>
            <h4><b>Detail Ongkos Kirim</b></h4>
        </div>
      <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Jenis Kendaraan</th>
            <th scope="col">Harga</th>
            </tr>
        </thead>
        <tbody>
            <?php $n=1;?>
            @foreach($ongkir as $val)
                <tr>
                <th scope="row">{{$n++}}</th>
                <td>{{$val->kendaraan}}</td>
                <td>{{number_format($val->harga)}}</td>
                </tr>
                <?php $total_ongkir+=$val->harga; ?>
            @endforeach
                <tr>
                <td colspan="2"><b>Total Harga</b></td>
                <td><b>Rp.{{number_format($total_ongkir)}}</b></td>
                </tr>
        </tbody>
        </table>


    </div>
  </div>
@endsection