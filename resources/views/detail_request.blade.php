<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')
  <!-- Your html goes here -->
  <?php 
  $foto_material=DB::table('cme_foto_material')
  ->join('cms_users','cme_foto_material.id_cms_users','=','cms_users.id')
  ->where('cme_foto_material.id_cme_request',$row->id)
  ->select('cms_users.name','cme_foto_material.*')
  ->get();
  ?>
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
             <img width="200px" src="{{url($row->bukti_tf_admin)}}">
             @endif
            </div>
        </div>
        
        
        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Nota</label>
            <div class="col-sm-10">
             @if($row->nota==null)
             <p>: nota belum di upload</p>
             @else
             <img width="200px" src="{{url($row->nota)}}">
             @endif
            </div>
        </div>

      </form>
      <hr>
        <div>
            <h4><b>Detail Material Yang Di Pesan</b></h4>
        </div>
        <div class="table-responsive">
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
</div>

        <hr>
        <div>
            <h4><b>Detail Ongkos Kirim</b></h4>
        </div>
        <div class="table-responsive">
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

        <div>
            <p><b>Foto Material</b></p>
        </div>
        <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Upload By</th>
            <th scope="col">Foto Material</th>
            <th scope="col">Remark</th>
            </tr>
        </thead>
        <tbody>
            <?php $f=1;?>
            @foreach($foto_material as $foto)
                <tr>
                <th scope="row">{{$f++}}</th>
                <td>{{$foto->name}}</td>
                <td><img src="{{asset($foto->foto)}}" width="200px"></td>
                <td>{{$foto->remark}}</td>
                </tr>
            @endforeach
        </tbody>
        </table>
</div>


<div>
            <p><b>Penyewaan Alat</b></p>
        </div>
        <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Request By</th>
            <th scope="col">Alat</th>
            <th scope="col">Tanggal</th>
            </tr>
        </thead>
        <tbody>
            <?php $v=1;?>
            @foreach($sewa as $w)
                <tr>
                <th scope="row">{{$v++}}</th>
                <td>{{$w->alat}}</td>
                <td>{{number_format($w->harga)}}</td>
                <td>{{$w->tanggal}}</td>
                </tr>
            @endforeach
        </tbody>
        </table>
</div>


    </div>
  </div>
@endsection