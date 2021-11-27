<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{crudbooster::getSetting('appname')}} : INVOICE</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
        @page {
            margin: 0px;
        }
        body {
            margin: 0px;
        }
        * {
            font-family: Verdana, Arial, sans-serif;
        }
        a {
            color: #fff;
            text-decoration: none;
        }
        table {
            font-size:  x-small;
        }
        .information table tr td{
          margin:0px;
          padding: 0px!important;
        }
        .information table{
        
  border-collapse: collapse;
  border-spacing: 0;

        }
        tfoot tr td {
            font-weight: bold;
            font-size: x-small;
        }
        .invoice table {
            margin: 15px;
        }
        .invoice h3 {
            margin-left: 15px;
        }
        .information {
         /*   background-color:#00a6ff;*/
            color: #FFF;
            padding: 0px;
        }
        .information .logo {
            margin: 5px;
        }
        .information table {
            padding: 0px;
            margin:0px;
        }
        .container {
            margin-left: 30px;
        }
    /*    .titel-konten{
            margin-left: 5px;
        }*/
    .information .va{
    background-color: #fff !important;
    border-bottom-right-radius: 100px;
    height:100%;
  top:0px;
  padding-left: 10px;
  padding-right: 100px;
  padding-top: 20px;
  padding-bottom: 20px;
    width: 200px;
    position: relative;
        }

        .information .ok{
      background-color: #fff !important;
    border-bottom-right-radius: 100px;
/*    border-radius: 20px!important*/
    height:70px;
  padding-left: 10px;
  padding-right: 100px;
  padding-top: 20px;
  padding-bottom: 20px;
    width: 220px;
        }

    </style>

</head>
<body>

<div class="information">
    <table width="100%"  style="background-color: #00a6ff">
        <tr>
            <td align="left" style="background-color: #00a6ff">
              <div class="ok">
                <img src="{{public_path('vendor/crudbooster/ngarit.jpg')}}" width="200px" alt="Logo" />
              </div>
            </td>
            <td align="right" style="width: 40%;background-color: #00a6ff">
        <p style="padding-right: 5px">
        <b>DATA REQUEST MATERIAL</b>
      </p>
      <p style="padding-right: 5px">
         <b>{{date('Y-m-d H:i:s')}}</b>
      </p> 
            </td>
        </tr>

    </table>
</div>
<?php
$suplier = DB::table('cme_request')
->join('cms_users','cme_request.id_suplier','=','cms_users.id')
->where('cme_request.id',$row->id)
->select('cms_users.name','cme_request.*')
->first();

$material=DB::table('cme_material')->where('id_cme_request',$row->id)->sum('harga_total');
$ongkir=DB::table('cme_ongkir')->where('id_cme_request',$row->id)->sum('harga');
$sewa=DB::table('cme_sewa')->where('id_cme_request',$row->id)->sum('harga');
$price=$material+$ongkir+$sewa;

$admin=DB::table('cms_users')
->where('id',$row->check_by)
->first();

$foto_material=DB::table('cme_foto_material')
->join('cms_users','cme_foto_material.id_cms_users','=','cms_users.id')
->where('cme_foto_material.id_cme_request',$row->id)
->select('cms_users.name','cme_foto_material.*')
->get();

?>
 
	<div class="page">
    <div>
            <p><b>Informasi Umum</b></p>
        </div>
      <table id="customers" class="table" border="0.5px">
        <tbody>
          <tr>
            <td><b>Waspang</b></td>
            <td>{{$row->name}}</td>
          </tr>
          <tr>
            <td><b>Suplier</b></td>
            <td>{{$suplier->name}}</td>
          </tr>
          <tr>
            <td><b>Site</b></td>
            <td>{{$row->site}}</td>
          </tr>
          <tr>
            <td><b>Tgl Request</b></td>
            <td>{{$row->tanggal}}</td>
          </tr>
          <tr>
            <td><b>Activity</b></td>
            <td>{{$row->activity}}</td>
          </tr>
          <tr>
            <td><b>Remark</b></td>
            <td>{{$row->remark}}</td>
          </tr>
          <tr>
            <td><b>Status</b></td>
            <td>{{$row->status}}</td>
          </tr>
        
          <tr>
            <td><b>Rekening</b></td>
            <td>{{$row->rekening}}</td>
          </tr>

          <tr>
            <td><b>Total Transfer</b></td>
            <td>Rp.{{number_format($price)}}</td>
          </tr>
          
           @if($row->bukti_tf_admin!=null)
           <tr>
            <td><b>Bukti Tf Admin</b></td>
            <td><img src="data:image/png;base64,{{ base64_encode(file_get_contents(storage_path('app/'.$row->bukti_tf_admin))) }}" width="200px"></td>
          </tr>
          @else
          <tr>
            <td><b>Bukti Tf Admin</b></td>
            <td><i>belum di upload</i></td>
          </tr>
          @endif

          @if($row->nota!=null)
           <tr>
            <td><b>Nota</b></td>
            <td><img src="data:image/png;base64,{{ base64_encode(file_get_contents(storage_path('app/'.$row->nota))) }}" width="200px"></td>
          </tr>
          @else
          <tr>
            <td><b>Nota</b></td>
            <td><i>belum di upload</i></td>
          </tr>
          @endif

          @if($row->check_by!=null)
           <tr>
            <td><b>Admin Review</b></td>
            <td>{{$admin->name}}</td>
          </tr>
          <tr>
            <td><b>Tanggal Admin Review</b></td>
            <td>{{$row->tanggal_check}}</td>
          </tr>
          @else
          <tr>
            <td><b>Admin Review</b></td>
            <td><i>Belum di Cek Admin</i></td>
          </tr>
          <tr>
            <td><b>Tanggal Admin Review</b></td>
            <td><i>Belum di Cek Admin</i></td>
          </tr>
          @endif
            
       

        </tbody>
      </table>   
      </div>

      <?php 
      $material=DB::table('cme_material')
			->join('cme_bahan_baku','cme_material.id_cme_bahan_baku','=','cme_bahan_baku.id')
			->where('cme_material.id_cme_request',$row->id)
			->select('cme_material.*','cme_bahan_baku.nama as material')
			->get();
      $ongkir=DB::table('cme_ongkir')->where('id_cme_request',$row->id)->get();
      $sewa=DB::table('cme_sewa')->where('id_cme_request',$row->id)->get();
      ?>

      <div>
            <p><b>Detail Material Yang Di Pesan</b></p>
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

        <div>
            <p><b>Detail Ongkos Kirim</b></p>
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

        <div>
            <p><b>Foto Material</b></p>
        </div>
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
                <td><img src="data:image/png;base64,{{ base64_encode(file_get_contents(storage_path('app/'.$foto->foto))) }}" width="200px"></td>
                <td>{{$foto->remark}}</td>
                </tr>
            @endforeach
        </tbody>
        </table>


        <div>
            <p><b>Penyewaan Alat</b></p>
        </div>
      <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Alat</th>
            <th scope="col">Tanggal</th>
            <th scope="col">Harga</th>
            </tr>
        </thead>
        <tbody>
            <?php $k=1;?>
            @foreach($sewa as $w)
                <tr>
                <th scope="row">{{$k++}}</th>
                <td>{{$w->alat}}</td>
                <td>{{$w->tanggal}}</td>
                <td>{{number_format($w->harga)}}</td>
                </tr>
                <?php $t+=$w->harga; ?>
            @endforeach
                <tr>
                <td colspan="3"><b>Total Harga</b></td>
                <td><b>Rp.{{number_format($t)}}</b></td>
                </tr>
        </tbody>
        </table>

   
</body>
</html>
