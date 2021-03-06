<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use PDF;

	class AdminCmeRequestMaterialAdminApproveController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "cme_request";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Waspang","name"=>"id_cms_users","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Suplier","name"=>"id_suplier","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Tanggal","name"=>"tanggal"];
			$this->col[] = ["label"=>"Site / Tower","name"=>"id_cme_site","join"=>"cme_site,nama"];
			$this->col[] = ["label"=>"Harg Material & Ongkir","name"=>"id","callback"=>function($row) {
				$material=DB::table('cme_material')->where('id_cme_request',$row->id)->sum('harga_total');
				$ongkir=DB::table('cme_ongkir')->where('id_cme_request',$row->id)->sum('harga');
				$sewa=DB::table('cme_sewa')->where('id_cme_request',$row->id)->sum('harga');
				return number_format($material+$ongkir+$sewa);
				}];
				$this->col[] = ["label"=>"Status","name"=>"status","callback"=>function($row){
					if ($row->status=='approve') 
					{
						return '<div class="btn-group">
						<button type="button" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
							approve <span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a onclick="approve('.$row->id.')" style="cursor:pointer;color:blue">approve</a>
							</li>
							<li>
								<a onclick="reject('.$row->id.')" style="cursor:pointer;color:red">reject</a>
							</li>
							<li>
								<a onclick="waiting('.$row->id.')" style="cursor:pointer;color:yellow">waiting</a>
							</li>
						</ul>
						</div>';
					}elseif($row->status=='reject'){
						return '<div class="btn-group">
						<button type="button" class="btn btn-danger btn-xs dropdown-toggle" data-toggle="dropdown">
							reject <span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a onclick="approve('.$row->id.')" style="cursor:pointer;color:blue">approve</a>
							</li>
							<li>
								<a onclick="reject('.$row->id.')" style="cursor:pointer;color:red">reject</a>
							</li>
							<li>
								<a onclick="waiting('.$row->id.')" style="cursor:pointer;color:yellow">waiting</a>
							</li>
						</ul>
						</div>';
					}elseif($row->status=='waiting'){
						return '<div class="btn-group">
						<button type="button" class="btn btn-warning btn-xs dropdown-toggle" data-toggle="dropdown">
							waiting <span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a onclick="approve('.$row->id.')" style="cursor:pointer;color:blue">approve</a>
							</li>
							<li>
								<a onclick="reject('.$row->id.')" style="cursor:pointer;color:red">reject</a>
							</li>
							<li>
								<a onclick="waiting('.$row->id.')" style="cursor:pointer;color:yellow">waiting</a>
							</li>
						</ul>
						</div>';
					}
				}];
			$this->col[] = ["label"=>"Bukti TF","name"=>"bukti_tf_admin","image"=>true];
			$this->col[] = ["label"=>"Nota","name"=>"nota","image"=>true];
			$this->col[] = ["label"=>"Admin Review","name"=>"check_by","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Tanggal Review","name"=>"tanggal_check"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Waspang','name'=>'id_cms_users','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cms_users,name','datatable_where'=>'id_cms_privileges = 6'];
			$this->form[] = ['label'=>'Suplier','name'=>'id_suplier','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cms_users,name','datatable_where'=>'id_cms_privileges = 4'];
			$this->form[] = ['label'=>'Tanggal','name'=>'tanggal','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Activity','name'=>'activity','type'=>'text','validation'=>'required|string|min:1|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Site / Tower','name'=>'id_cme_site','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cme_site,nama'];
			$this->form[] = ['label'=>'Remark','name'=>'remark','type'=>'textarea','validation'=>'required|string|min:1|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Rekening','name'=>'rekening','type'=>'text','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Status','name'=>'status','type'=>'select','validation'=>'required|string|min:1|max:5000','width'=>'col-sm-10','dataenum'=>'approve;reject;waiting'];
			$this->form[] = ['label'=>'Bukti Transfer','name'=>'bukti_tf_admin','type'=>'upload','validation'=>'image','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Nota','name'=>'nota','type'=>'upload','validation'=>'image','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Cms Users","name"=>"id_cms_users","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"cms_users,name"];
			//$this->form[] = ["label"=>"Suplier","name"=>"id_suplier","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"suplier,id"];
			//$this->form[] = ["label"=>"Tanggal","name"=>"tanggal","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Activity","name"=>"activity","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Site","name"=>"site","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Remark","name"=>"remark","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Price","name"=>"price","type"=>"money","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Rekening","name"=>"rekening","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Status","name"=>"status","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Bukti Tf Admin","name"=>"bukti_tf_admin","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			# OLD END FORM

			/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
	        $this->sub_module = array();
			$this->sub_module[] = ['label'=>'Cek Material','path'=>'cme_material','parent_columns'=>'site','foreign_key'=>'id_cme_request','button_color'=>'success','button_icon'=>'fa fa-bars'];
			$this->sub_module[] = ['label'=>'Cek Ongkir','path'=>'cme_ongkir','parent_columns'=>'site','foreign_key'=>'id_cme_request','button_color'=>'primary','button_icon'=>'fa fa-bars'];
			$this->sub_module[] = ['label'=>'Isikan Foto Material','path'=>'cme_foto_material','parent_columns'=>'nama','foreign_key'=>'id_cme_request','button_color'=>'warning','button_icon'=>'fa fa-image'];
			$this->sub_module[] = ['label'=>'Penyewaan Alat','path'=>'cme_sewa','parent_columns'=>'site','foreign_key'=>'id_cme_request','button_color'=>'primary','button_icon'=>'fa fa-bars'];
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */
	        $this->addaction = array();
			$this->addaction[]=['label'=>'Print Invoice','color'=>'danger','icon'=>'fa fa-print',
			'url'=>CRUDBooster::mainpath('pdfexport/[id]'),'confirmation' => true];


	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Button Selected
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button 
	        | Then about the action, you should code at actionButtonSelected method 
	        | 
	        */
	        $this->button_selected = array();

	                
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------     
	        | @message = Text of message 
	        | @type    = warning,success,danger,info        
	        | 
	        */
	        $this->alert        = array();
	                

	        
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
	        $this->index_button = array();



	        /* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
	        $this->table_row_color = array();     	          

	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
	        $this->index_statistic = array();
			$this->index_statistic[] = ['label'=>'Material Total','count'=>number_format(DB::table('cme_material')
			->join('cme_request','cme_material.id_cme_request','=','cme_request.id')
			  ->where('cme_request.status','approve')
	         ->sum('cme_material.harga_total')),'icon'=>'fa fa-check','color'=>'success'];

			 $this->index_statistic[] = ['label'=>'Ongkir Total','count'=>number_format(DB::table('cme_ongkir')
			 ->join('cme_request','cme_ongkir.id_cme_request','=','cme_request.id')
			 ->where('cme_request.status','approve')
			->sum('cme_ongkir.harga')),'icon'=>'fa fa-check','color'=>'success'];



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = NULL;
			$this->script_js = "
			function approve(id){
				swal({
					title: 'Change Status Approve ?',
					type:'info',
					showCancelButton:true,
					allowOutsideClick:true,
					confirmButtonColor: '#DD6B55',
					confirmButtonText: 'Yes',
					cancelButtonText: 'No',
					closeOnConfirm: false
				}, function(){
					location.href = '".CRUDBooster::mainpath("approve/")."'+id;

				});
			};

			function reject(id){
				swal({
					title: 'Change Status Reject ?',
					type:'info',
					showCancelButton:true,
					allowOutsideClick:true,
					confirmButtonColor: '#DD6B55',
					confirmButtonText: 'Yes',
					cancelButtonText: 'No',
					closeOnConfirm: false
				}, function(){
					location.href = '".CRUDBooster::mainpath("reject/")."'+id;
				});
			};
			
			function waiting(id){
				swal({
					title: 'Change Status Waiting ?',
					type:'info',
					showCancelButton:true,
					allowOutsideClick:true,
					confirmButtonColor: '#DD6B55',
					confirmButtonText: 'Yes',
					cancelButtonText: 'No',
					closeOnConfirm: false
				}, function(){
					location.href = '".CRUDBooster::mainpath("waiting/")."'+id;
				});
			};
			";


            /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code before index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
	        $this->pre_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code after index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
	        $this->post_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
	        $this->load_js = array();
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Add css style at body 
	        | ---------------------------------------------------------------------- 
	        | css code in the variable 
	        | $this->style_css = ".style{....}";
	        |
	        */
	        $this->style_css = NULL;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
	        $this->load_css = array();
	        
	        
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here
	            
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	    public function hook_query_index(&$query) {
	        //Your code here
			$query->where('cme_request.status','approve');
	            
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */    
	    public function hook_row_index($column_index,&$column_value) {	        
	    	//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	    public function hook_after_add($id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_edit(&$postdata,$id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_edit($id) {
	        //Your code here 

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_delete($id) {
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }

		public function getDetail($id) {
			//Create an Auth
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_edit==FALSE) {    
			  CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			}
			
			$data = [];
			$data['page_title'] = 'Detail Request Material';

			$data['row'] = DB::table('cme_request')
			->join('cms_users','cme_request.id_cms_users','=','cms_users.id')
			->join('cme_site','cme_request.id_cme_site','=','cme_site.id')
			->where('cme_request.id',$id)
			->select('cms_users.name','cme_request.*','cme_site.nama as site')
			->first();

			$data['suplier'] = DB::table('cme_request')
			->join('cms_users','cme_request.id_suplier','=','cms_users.id')
			->where('cme_request.id',$id)
			->select('cms_users.name','cme_request.*')
			->first();

			$data['material']=DB::table('cme_material')
			->join('cme_bahan_baku','cme_material.id_cme_bahan_baku','=','cme_bahan_baku.id')
			->where('cme_material.id_cme_request',$id)
			->select('cme_material.*','cme_bahan_baku.nama as material')
			->get();
			
			$material=DB::table('cme_material')->where('id_cme_request',$id)->sum('harga_total');
			$ongkir=DB::table('cme_ongkir')->where('id_cme_request',$id)->sum('harga');
			$sewa=DB::table('cme_sewa')->where('id_cme_request',$id)->sum('harga');
			$data['price']=$material+$ongkir+$sewa;

			$data['material']=DB::table('cme_material')->where('id_cme_request',$id)->get();
			$data['ongkir']=DB::table('cme_ongkir')->where('id_cme_request',$id)->get();
			$data['sewa']=DB::table('cme_sewa')->where('id_cme_request',$id)->get();
			
			//Please use view method instead view method from laravel
			return $this->view('detail_request',$data);
		  }

		  public function getPdfexport($id){

			$row = DB::table('cme_request')
			->join('cms_users','cme_request.id_cms_users','=','cms_users.id')
			->join('cme_site','cme_request.id_cme_site','=','cme_site.id')
			->where('cme_request.id',$id)
			->select('cms_users.name','cme_request.*','cme_site.nama as site')
			->first();

			 $pdf = PDF::setOptions(['isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true])->loadView('template_print_request',compact('row'))
			 ->setPaper('a4','potret');
			 return $pdf->stream($row->tanggal.'.pdf');
			 
		   }


		  public function getApprove($id){

	    	$status['status']="approve";
			$status['check_by']=CRUDBooster::myId();
			$status['tanggal_check']=date('Y-m-d H:i:s');

	    	$cek=DB::table('cme_request')->where('id',$id)->update($status);

	    	 if($cek !=null) {				
		    $res = redirect()->back()->with(["message"=>"Succesfully change status",'message_type'=>'success'])->withInput();
		    }else{
		    $res = redirect()->back()->with(["message"=>"Error change status",'message_type'=>'warning'])->withInput();
		    	}
		    		\Session::driver()->save();
		    	$res->send();
		    	exit();

	    }

		public function getReject($id){

	    	$status['status']="reject";
			$status['check_by']=CRUDBooster::myId();
			$status['tanggal_check']=date('Y-m-d H:i:s');

	    	$cek=DB::table('cme_request')->where('id',$id)->update($status);

	    	 if($cek !=null) {				
		    $res = redirect()->back()->with(["message"=>"Succesfully change status",'message_type'=>'success'])->withInput();
		    }else{
		    $res = redirect()->back()->with(["message"=>"Error change status",'message_type'=>'warning'])->withInput();
		    	}
		    		\Session::driver()->save();
		    	$res->send();
		    	exit();

	    }

		public function getWaiting($id){

	    	$status['status']="waiting";
			$status['check_by']=CRUDBooster::myId();
			$status['tanggal_check']=date('Y-m-d H:i:s');

	    	$cek=DB::table('cme_request')->where('id',$id)->update($status);

	    	 if($cek !=null) {				
		    $res = redirect()->back()->with(["message"=>"Succesfully change status",'message_type'=>'success'])->withInput();
		    }else{
		    $res = redirect()->back()->with(["message"=>"Error change status",'message_type'=>'warning'])->withInput();
		    	}
		    		\Session::driver()->save();
		    	$res->send();
		    	exit();

	    }



	    //By the way, you can still create your own method in here... :) 


	}