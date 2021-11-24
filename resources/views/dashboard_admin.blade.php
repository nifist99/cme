@extends('crudbooster::admin_template')
@section('content')
@push('head')

<style>
    .bg-hijau{
        background-color:#28a745!important

    }
    
    .bg-biru{
        background-color:#17a2b8!important
    }
    
    .bg-kuning{
        background-color:#ffc107!important
    }
    .bg-merah{
        background-color:#dc3545!important
    }
    .text-w{
        color :white!important;
        font-weight: 700;
    margin: 0 0 10px;
    padding: 0;
    white-space: nowrap;
    }
    
        .text-h{
        color :black!important;
        font-weight: 700;
    margin: 0 0 10px;
    padding: 0;
    white-space: nowrap;
    }
</style>
@endpush
<section class="content">
      <div class="container-fluid">
        <!--<h2 id="demo"></h2>-->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-biru">
              <div class="inner">
                <h4 class="text-w"><b></b>RP. {{number_format($material_approve)}}</b></h4>

                <p class="text-w">Material Approve</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info</a>
            </div>
          </div>
          
                   <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-kuning">
              <div class="inner">
                <h4 class="text-w">RP. {{number_format($ongkir_approve)}}</h4>

                <p class="text-w">Ongkir Approve</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info</a>
            </div>
          </div>
           
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-hijau">
              <div class="inner">
                <h4 class="text-w">RP. {{number_format($material_waiting)}}</h4>

                <p class="text-w" style="width :100%">Material Waiting</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info</a>
            </div>
          </div>
          <!-- ./col -->
 
          <div class="col-lg-3 col-6">
            <div class="small-box bg-merah">
              <div class="inner">
                <h4 class="text-w">RP. {{number_format($ongkir_waiting)}}</h4>

                <p class="text-w">Ongkir Waiting</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info</a>
            </div>
          </div> 
           
        </div>

        <div class="row">

<div class="col-lg-3 col-6">
  <!-- small box -->
  <div class="small-box bg-biru">
    <div class="inner">
      <h4 class="text-w"><b></b>{{$approveRequest}}</b></h4>

      <p class="text-w">Approve Request</p>
    </div>
    <div class="icon">
      <i class="ion-stats-bars"></i>
    </div>
    <a href="#" class="small-box-footer">More info</a>
  </div>
</div>

<div class="col-lg-3 col-6">
  <!-- small box -->
  <div class="small-box bg-biru">
    <div class="inner">
      <h4 class="text-w"><b></b>{{$waitingRequest}}</b></h4>

      <p class="text-w">Waiting Request</p>
    </div>
    <div class="icon">
      <i class="ion-stats-bars"></i>
    </div>
    <a href="#" class="small-box-footer">More info</a>
  </div>
</div>

<div class="col-lg-3 col-6">
  <!-- small box -->
  <div class="small-box bg-biru">
    <div class="inner">
      <h4 class="text-w"><b></b>{{$rejectRequest}}</b></h4>

      <p class="text-w">Reject Request</p>
    </div>
    <div class="icon">
      <i class="ion-stats-bars"></i>
    </div>
    <a href="#" class="small-box-footer">More info</a>
  </div>
</div>

</div>

        <div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-dashboard"></i>
                    <h3 class="box-title">Analisa Pengerjaan Site</h3>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Site</th>
                            <th scope="col">Pengeluaran Material</th>
                            <th scope="col">Pengeluaran Ongkir</th>
                            <th scope="col">Lama Pengerjaan</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($site as $n)
                            <tr>
                              <?php $minT=DB::table('cme_progres_site')
                              ->where('id_cme_site',$n->id)->min('tanggal');

                              $maxT=DB::table('cme_progres_site')
                              ->where('id_cme_site',$n->id)->max('tanggal');

                              $start = strtotime($minT);
                                $end   = strtotime($maxT);
                                $diff  = $end - $start;
                                $perbedaan=$diff/(60*60*24);

                               ?>
                                <th scope="row">#</th>
                                <td>{{$n->nama}}</td>
                                <td><?php $materialSum=DB::table('cme_request')
                                ->where('status','approve')
                                ->where('id_cme_site',$n->id)->get();

                                $reqId=[];
                                foreach($materialSum as $keyId){
                                    $list['id']=$keyId->id;
                                    array_push($reqId,$list);
                                }

                                $totalMaterial=DB::table('cme_material')->whereIn('id_cme_request',$reqId)->sum('harga_total');
                                echo number_format($totalMaterial);
                                ?></td>

                                <td><?php $totalOngkir=DB::table('cme_ongkir')->whereIn('id_cme_request',$reqId)->sum('harga');
                                          echo number_format($totalOngkir);
                                ?></td>
                                <td>{{$perbedaan}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>
            
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-dashboard"></i>
                    <h3 class="box-title">Analisa Keungan Waspang</h3>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Waspang</th>
                            <th scope="col">Pengeluaran Material</th>
                            <th scope="col">Pengeluaran Ongkir</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach($usersWaspang as $w)
                            <tr>
                                <th scope="row">#</th>
                                <td>{{$w->name}}</td>
                                <td><?php $materialSum=DB::table('cme_request')
                                ->where('status','approve')
                                ->where('id_cms_users',$w->id)->get();

                                $reqId=[];
                                foreach($materialSum as $keyId){
                                    $list['id']=$keyId->id;
                                    array_push($reqId,$list);
                                }

                                $totalMaterial=DB::table('cme_material')->whereIn('id_cme_request',$reqId)->sum('harga_total');
                                echo number_format($totalMaterial);
                                ?></td>

                                <td><?php $totalOngkir=DB::table('cme_ongkir')->whereIn('id_cme_request',$reqId)->sum('harga');
                                          echo number_format($totalOngkir);
                                ?></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>

        

        <div class="row">
                 <div class="col-sm-12">
           <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-bar-chart"></i>

              <h3 class="box-title">Analisis Pengeluaran Approve</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                      <div class="btn-group">
                  <button type="button" class="btn btn-info">
                      @if($tahun !=null)
                      {{$tahun}}
                      @else
                      {{date('Y')}}
                      @endif
                      
                      </button>
                  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  
                  <ul class="dropdown-menu" role="menu">
                      <li><a href="{{CRUDBooster::mainpath('/')}}">Tampilkan Tahun Sekarang</a></li>
                    <li class="divider"></li>
                    @foreach($listtahun as $r)
                    <li><a href="{{CRUDBooster::mainpath('/?tahun='.$r['id'])}}">{{$r['id']}}</a></li>
                    @endforeach
                  </ul>
                </div>
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body">
                <canvas id="myChart" width="100%"></canvas>
                </div>
                </div>
                </div>
</div>
</div>
</div>

@push('bottom')
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.0/dist/chart.min.js"></script>
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Januari', 'Ferbuari', 'Maret', 'April', 'Mei', 'Juni','Juli','Agustus','September','Oktober','November','Desember'],
        datasets: [{
            label: '# Pengeluaran Material',
            data: [{{$m_approve}}],
            backgroundColor:
                'rgba(255, 99, 132, 0.2)',
            borderColor:
                'rgba(255, 99, 132, 1)',
            borderWidth: 1
        },{
            label: '# Pengeluaran Ongkir',
            data: [{{$o_approve}}],
            backgroundColor:
                'rgba(54, 162, 235, 0.2)',
            borderColor:
                'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }
        
        ],
        
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
@endpush
</section>
@endsection