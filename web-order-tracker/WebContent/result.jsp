<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Packaudio: package sending service with audio deliver</title>
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
	<!-- Favicons (created with http://realfavicongenerator.net/)-->
	<link rel="apple-touch-icon" sizes="57x57" href="img/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="img/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="img/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="img/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="img/favicons/manifest.json">
	<link rel="shortcut icon" href="img/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<!-- Normalize -->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="css/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="fonts/eleganticons/et-icons.css">
	<!-- Main style -->
    <link rel="stylesheet" type="text/css" href="css/cardio.css">
    
    <style>
			
			.button {
				  background-color: #00a7ff;
				  border: none;
				  color: white;
				  padding: 15px 32px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-size: 16px;
				  margin: 4px 2px;
				  cursor: pointer;
			}
            /*#order tr:hover {background-color: #efa11c;}*/
            </style>

</head>

<body>
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="img/logo.png" data-active-url="img/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"><font face="corbel, Noto Sans TC">
				<ul class="nav navbar-nav navbar-right main-nav">
                    <li><a href="#services">Update Order｜更新訂單</a></li>
					<li><a href="#delete">Delete Order｜刪除訂單</a></li>
					<li><a href="index.jsp">Back to Home Page｜返回首頁</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
    
     <!--show order form section-->
	<section id="pricing" class="section section-padded">
		<div class="container" data-img="img/pricing1.jpg">
			<div class="row title text-center">
				
				<h3 style="color:#99dcff; font-family: corbel, Noto Sans TC">
					<strong>
					${CUSTOMER_REQUEST[0]}<br/>
					${CUSTOMER_REQUEST[1]}
					</strong>
				</h3>
				<br/>
				<p >
                    <a href="index.jsp" >
	                    <button data-toggle="modal" data-target="#modal1" class="button"><!-- class="btn btn-blue-fill ripple"-->
	                    	Back to home page ｜ 返回首頁
	                    </button>
                    </a>
                    
                </p>
            </div>
            
			
		</div>
    </section>

<!-- **************************************************************************************************** -->

     
     <!--update form section-->
    <section id="services" class="section section-padded">
        <div class="container">
            <div class="row title text-center">
                <h2 class="margin-top"><font face="corbel, Noto Sans TC">Update｜更新訂單</h2>
                <h4 class="light muted">update here</h4>
                <form action="OrderControllerServlet" method="GET">
                    <input type="hidden" name="command" value="LOAD_CUSTOMER"/>
                    <h4><font face="corbel, Noto Sans TC">Input your order ID｜輸入您的訂單編號    <input type="text" name="orderId"/></h4>
                    <input type="submit" value="Submit｜送出" class="submit"/>
                </form>
            </div>
        </div>
    </section>
    
<!-- **************************************************************************************************** -->
    <!-- delete order section -->
    <section id="delete" class="section section-padded">
        <div class="container">
            <div class="row title text-center">
                <h2 class="margin-top"><font face="corbel, Noto Sans TC">Delete｜刪除訂單</h2>
                <h4 class="light muted">delete here</h4>
                <form action="OrderControllerServlet" method="GET">
                    <input type="hidden" name="command" value="DELETE_CUSTOMER"/>
                    <h4><font face="corbel, Noto Sans TC">Input your order ID｜輸入您的訂單編號    <input type="text" name="orderId"/></h4>
                    <input type="submit" value="Submit｜送出" class="submit"
                    	onclick = "if(!(confirm('Are you sure to delete this order? \n您確定要刪除此筆訂單嗎？'))) return false"/>
                </form>
            </div>
        </div>
    </section>
    
<!-- **************************************************************************************************** -->
   
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white"><font face="Noto Sans TC">Try Our New Service Packaudio!<br/> 試試我們的新服務吧！</h3>
					<h5 class="light regular light-white">A Brand New Form of Sending Packages.</h5>
					<a href="add-order-form-2.jsp" class="btn btn-blue ripple trial-button">Try Packaudio｜試一下</a>
				</div>
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white"><font face="Noto Sans TC">Opening Hours ｜營業時間<span class="open-blink"></span></h3>
					<div class="row opening-hours">
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Mon - Fri</h5>
							<h3 class="regular white">08:30 - 17:30</h3>
						</div>
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Sat</h5>
							<h3 class="regular white">09:00 - 12:00</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/typewriter.js"></script>
	<script src="js/jquery.onepagenav.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
