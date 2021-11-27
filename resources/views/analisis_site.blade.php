<!-- First you need to extend the CB layout -->
@extends('crudbooster::admin_template')
@section('content')
<!-- Your custom  HTML goes here -->

<?php $minT=DB::table('cme_progres_site')
                              ->where('id_cme_site',$site->id)->min('tanggal');

                              $maxT=DB::table('cme_progres_site')
                              ->where('id_cme_site',$site->id)->max('tanggal');

                              $start = strtotime($minT);
                                $end   = strtotime($maxT);
                                $diff  = $end - $start;
                                $perbedaan=$diff/(60*60*24);

                               ?>

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

        <div class="form-group row">
            <label for="" class="col-sm-2 col-form-label">Lama Pengerjaan</label>
            <div class="col-sm-10">
             <p>: {{$perbedaan}}</p>
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
                    <h3 class="box-title">List Material</h3>
                </div>
                <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Request By</th>
                            <th scope="col">Material</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Satuan</th>
                            <th scope="col">Remark</th>
                            <th scope="col">Tgl Request</th>
                            <th scope="col">Harga Satuan</th>
                            <th scope="col">Harga Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($material as $row)
                            <tr>
                                <th scope="row">#</th>
                                <td>{{$row->name}}</td>
                                <td>{{$row->material}}</td>
                                <td>{{$row->qty}}</td>
                                <td>{{$row->satuan}}</td>
                                <td>{{$row->remark}}</td>
                                <td>{{$row->tanggal}}</td>
                                <td>{{number_format($row->harga)}}</td>
                                <td>{{number_format($row->harga_total)}}</td>
                                <?php $total+=$row->harga_total; ?>
                            </tr>
                            @endforeach
                            <tr>
                                <th scope="row">#</th>
                                <td colspan="7"><b>Total Pengeluaran</b></td>
                                <td><b>{{number_format($total)}}</b></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
            </div>
        </div>


    <div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-dashboard"></i>
                    <h3 class="box-title">Ringkasan Material Total</h3>
                </div>
                <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Material</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Satuan</th>
                            <th scope="col">Harga Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($bahan as $r)
                            <tr>
                                <th scope="row">#</th>
                                <td>{{$r['nama']}}</td>
                                <td>{{$r['qty']}}</td>
                                <td>{{$r['satuan']}}</td>
                                <td>{{number_format($r['harga'])}}</td>
                            </tr>
                            <?php $total_p+=$r['harga'];?>
                            @endforeach
                            <tr>
                                <th scope="row">#</th>
                                <td colspan="3"><b>Total Pengeluaran</b></td>
                                <td><b>{{number_format($total_p)}}</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
            </div>
            </div>

            <div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-dashboard"></i>
                    <h3 class="box-title">List Ongkos Kirim</h3>
                </div>
                <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Request By</th>
                            <th scope="col">Kendaraan</th>
                            <th scope="col">Remark</th>
                            <th scope="col">Tgl Request</th>
                            <th scope="col">Harga Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($ongkir as $val)
                            <tr>
                                <th scope="row">#</th>
                                <td>{{$val->name}}</td>
                                <td>{{$val->kendaraan}}</td>
                                <td>{{$val->remark}}</td>
                                <td>{{$val->tanggal}}</td>
                                <td>{{number_format($val->harga)}}</td>
                                <?php $total_o+=$val->harga; ?>
                            </tr>
                            @endforeach
                            <tr>
                                <th scope="row">#</th>
                                <td colspan="4"><b>Total Pengeluaran</b></td>
                                <td><b>{{number_format($total_o)}}</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
</div>
            </div>
            </div>
        </div>

            </div>

    
</section>

@endsection
