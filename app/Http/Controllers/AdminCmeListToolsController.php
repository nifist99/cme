<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminCmeListToolsController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->table = "cme_list_tools";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Users","name"=>"id_cms_users","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Cme Site","name"=>"id_cme_site","join"=>"cme_site,nama"];
			$this->col[] = ["label"=>"Tanggal","name"=>"tanggal"];
			$this->col[] = ["label"=>"Status","name"=>"status","callback"=>function($row){
				if ($row->status=='approve') 
				{
					return '<div class="btn-group">
					  <button type="button" class="btn btn-info btn-xs">
						approve
					  </button>
					</div>';
				}elseif($row->status=='reject'){
					return '<div class="btn-group">
					  <button type="button" class="btn btn-danger btn-xs">
						reject
					  </button>
					</div>';
				}elseif($row->status=='waiting'){
					return '<div class="btn-group">
					  <button type="button" class="btn btn-warning btn-xs">
						waiting
					  </button>
					</div>';
				}}];;
				$this->col[] = ["label"=>"penyetuju","name"=>"penyetuju","join"=>"cms_users,name"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			// $this->form[] = ['label'=>'Cms Users','name'=>'id_cms_users','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cms_users,name'];
			$this->form[] = ['label'=>'Cme Site','name'=>'id_cme_site','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cme_site,nama'];
			// $this->form[] = ['label'=>'Penyetuju','name'=>'penyetuju','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Tanggal','name'=>'tanggal','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Cms Users","name"=>"id_cms_users","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"cms_users,name"];
			//$this->form[] = ["label"=>"Cme Site","name"=>"id_cme_site","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"cme_site,nama"];
			//$this->form[] = ["label"=>"Penyetuju","name"=>"penyetuju","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Tanggal","name"=>"tanggal","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Status","name"=>"status","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
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
			$this->addaction[]=['label'=>'Isikan Foto Tools di Sini','color'=>'success','icon'=>'fa fa-image',
	          'url'=>CRUDBooster::mainpath('tools/[id]'),'confirmation' => true];


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



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = NULL;


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
			$query->where('id_cms_users',CRUDBooster::myId());
	            
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
			$postdata['id_cms_users']=CRUDBooster::myId();
	        $postdata['status']="waiting";

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

		public function getTools($id){

			//First, Add an auth
 if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
 
 //Create your own query 
 $data = [];
 $data['page_title'] = 'Welcome';
 $data['id_bulan']=$id;
 $data['row']=DB::table('cme_list_tools')
 ->join('cms_users','cme_list_tools.id_cms_users','=','cms_users.id')
 ->where('cme_list_tools.id',$id)
 ->select('cme_list_tools.*','cms_users.name')
 ->first();

  
 //Create a view. Please use `view` method instead of view method from laravel.
 return $this->view('admin.start_insert_tools',$data);

 }

 public function getChecktools($id_bulan){
 $data = [];
 $data['page_title'] = 'Tools Yang Telah di Isi';
 $data['id_bulan']=$id_bulan;
 
  $data['result']=DB::table('cme_update_tools')
 ->where('id_list_tools_bulanan',$id_bulan)
 ->get();

 return view('admin.lihat_tools',$data);

 }


 public function getStep($id_bulan,$step){
  
 $data = [];
 $data['page_title'] = 'Add Foto';
 $data['id_bulan']=$id_bulan;
  
 // menu tombol
 $data['apd']=DB::table('cme_daftar_tools')
 ->where('kategori','apd')
 ->get();

 $data['tools_semua']=DB::table('cme_daftar_tools')
 ->where('kategori','tools')
 ->get();

 $data['alat_berat']=DB::table('cme_daftar_tools')
 ->where('kategori','alat berat')
 ->get();



 $max=DB::table('cme_daftar_tools')->max('blade_view');

 // list tools yang harus di isi
 $data['tools']=DB::table('cme_daftar_tools')
 ->where('blade_view',$step)
 ->first();

 $data['cek_pengisian']=DB::table('cme_update_tools')
 ->where('blade_view',$step)
 ->where('id_list_tools_bulanan',$id_bulan)
 ->first();

 $next=$step+1;
 $back=$step-1;

 if($next>$max){
	 $data['next']=$max;
 }else{
	 $data['next']=$next;
 }

 if($back==0){
  $data['back']=1;
 }else{
	 $data['back']=$back;
 }

	 return $this->view('admin.step_foto',$data);
 }


 public function postSimpan(){
	 $data['id_cms_users']=CRUDBooster::myId();
	 $data['id_list_tools_bulanan']=g('id_tools_bulanan');
	 $data['nama']=g('nama');

	 $data['kondisi']=g('kondisi');
	 $data['catatan']=g('catatan');
	 $data['jumlah']=g('jumlah');
	 $data['blade_view']=g('blade_view');
		 $foto=Request::file('foto');
		 if($foto){
		 $data['foto']=CRUDBooster::uploadFoto($foto);
		 }

		 $success=DB::table('cme_update_tools')->insert($data);
		 
			 if($success) {				
		  $res = redirect()->back()->with(["message"=>"Succesfully Add Data",'message_type'=>'success'])->withInput();
		  }else{
		  $res = redirect()->back()->with(["message"=>"Error Add Data",'message_type'=>'warning'])->withInput();
			  }
				  \Session::driver()->save();
			  $res->send();
			  exit();  	



 }

 public function postEdit(){
	 $data['id_cms_users']=CRUDBooster::myId();
	 $data['id_list_tools_bulanan']=g('id_tools_bulanan');
	 $data['nama']=g('nama');
	 $data['kondisi']=g('kondisi');
	 $data['catatan']=g('catatan');
	 $data['jumlah']=g('jumlah');
	 $data['blade_view']=g('blade_view');
		 $foto=Request::file('foto');
		 if($foto){
		 $data['foto']=CRUDBooster::uploadFoto($foto);
		 }

		 $success=DB::table('cme_update_tools')->where('id',g('id'))->update($data);
		 
			 if($success) {				
		  $res = redirect()->back()->with(["message"=>"Succesfully update Data",'message_type'=>'success'])->withInput();
		  }else{
		  $res = redirect()->back()->with(["message"=>"Error update Data",'message_type'=>'warning'])->withInput();
			  }
				  \Session::driver()->save();
			  $res->send();
			  exit();  	



 }

 public function getDelete_image($id){
  
	 $gambar =DB::table('cme_update_tools')->where('id',$id)->first();
		  if($gambar->foto!=null){
		  File::delete($gambar->foto);
	 }
	$data['foto']=null;
	$success=DB::table('cme_update_tools')->where('id',$id)->update($data);
	 
	 if($success) {				
		  $res = redirect()->back()->with(["message"=>"Succesfully delete Image",'message_type'=>'success'])->withInput();
		  }else{
		  $res = redirect()->back()->with(["message"=>"Error Delete Image",'message_type'=>'warning'])->withInput();
			  }
				  \Session::driver()->save();
			  $res->send();
			  exit();
	 
  
}



	    //By the way, you can still create your own method in here... :) 


	}