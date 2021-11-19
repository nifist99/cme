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
                 <div class="col-sm-12">
           <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-list"></i>

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