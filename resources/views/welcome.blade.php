<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Letter - Simple Sign Up Form</title>
<!-- 

Letter Template 

https://templatemo.com/tm-510-letter



Template Re-distribution is NOT allowed.

-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
  <link rel="stylesheet" href="{{asset('welcome/css/font-awesome.min.css')}}">
  <link rel="stylesheet" href="{{asset('welcome/css/bootstrap.min.css')}}">
  
  <link rel="stylesheet" href="{{asset('welcome/css/demo.css')}}" />
  <link rel="stylesheet" href="{{asset('welcome/css/templatemo-style.css')}}">
  
  <script type="text/javascript" src="{{asset('welcome/js/modernizr.custom.86080.js')}}"></script>
		
	</head>

	<body>

			<div id="particles-js"></div>
		
			<ul class="cb-slideshow">
	            <li></li>
	            <li></li>
	            <li></li>
	            <li></li>
	            <li></li>
	            <li></li>
	        </ul>

			<div class="container-fluid">
				<div class="row cb-slideshow-text-container ">
					<div class= "tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
					<header class="mb-5"><h1>Patigeni CME</h1></header>
					<P class="mb-5">A sign-in Patigeni CME Management System, Thank you for visiting our site!</P>
					
                    <form action="#" method="get" class="subscribe-form">
               	    	<div class="row form-section">
							<div class="col-md-5 col-sm-5 col-xs-5">
								<a href="{{url('admin/login')}}" class="tm-btn-subscribe">Login Member</a>
							</div>
						
						</div>
                    </form>
                    
					<div class="tm-social-icons-container text-xs-center">
	                    <a href="#" class="tm-social-link"><i class="fa fa-facebook"></i></a>
	                    <a href="#" class="tm-social-link"><i class="fa fa-google-plus"></i></a>
	                    <a href="#" class="tm-social-link"><i class="fa fa-twitter"></i></a>
	                    <a href="#" class="tm-social-link"><i class="fa fa-linkedin"></i></a>
	                </div>

					</div>
				</div>	
				<div class="footer-link">
					<p>Copyright ?? 2021 Patigeni Teknologi Indonesia 
                    </p>
				</div>
			</div>	
	</body>

	<script type="text/javascript" src="{{asset('welcome/js/particles.js')}}"></script>
	<script type="text/javascript" src="{{asset('welcome/js/app.js')}}"></script>
</html>