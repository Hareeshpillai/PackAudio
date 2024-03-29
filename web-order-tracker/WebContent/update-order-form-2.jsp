<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Packaudio</title>
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
           #order {
              font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
              width: 80%;
              align-items: center;
              overflow: hidden;
              /*border-radius: 10px;*/
            }
                    
            #order td {
              /*border: 1px solid #2d1007;*/
              padding: 1%;
            }
            
            #order tr{
                background-color: #f7f7f7; 
            }
            
           
            #order label{
            	font-family:corbel,Noto Sans TC;
                font-size: 16px; 
                width: 100%; 
                display: block; 
                text-align: center;
                margin-right: 10px;
                margin-top: 8px;
                margin-bottom: 8px;
            }
            
            #order input {
                width: 100%;
                /*border: 1px solid #666;*/ 
                border-radius: 5px; 
                padding: 4px; 
                font-size: 16px;
                font-family:corbel,Noto Sans TC;
            }
            
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
                    <li><a href="#update">Update Order｜更新訂單</a></li>
					<li><a href="#delete">Delete Order｜刪除訂單</a></li>
					<li><a href="index.jsp">Back to Home Page｜返回首頁</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
    
     <!--update order form section-->
	<section id="pricing" class="section section-padded">
		<div class="container" data-img="img/pricing1.jpg">
			<div class="row title text-center">
				<h2 class="margin-top white"><font face="corbel, Noto Sans TC">Update Order｜更新訂單</h2>
				<h4 class="light white">Check your order anytime and anywhere</h4>
			</div>
			<div align="center">
				<!-- form here -->
                <form action="OrderControllerServlet" method="GET">
                    <input type="hidden" name="command" value="UPDATE_CUSTOMER"/>
                    <input type="hidden" name="orderId" value="${THE_ORDER.id}"/> <!-- for tracking the id so as to update db -->

                    <table id="order">
                        <tbody>
                            <tr>
                                <td colspan="2" align = "center" ><label>Sender<br/>寄件人</label></td>			
                            </tr>
                            <tr>
                                <td width="30%"><label>Name<br/>姓名</label></td>
                                <td><input type="text" name="senderName" value="${THE_ORDER.senderName}"/></td>					
                            </tr>			
                            <tr>
                                <td><label>Address<br/>地址</label></td>
                                <td><input type="text" name="senderAddress" value="${THE_ORDER.senderAddress}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Postal Code<br/>郵遞區號</label></td>
                                <td><input type="text" name="senderPostalCode" value="${THE_ORDER.senderPostalCode}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Phone Number<br/>電話號碼</label></td>
                                <td><input type="text" name="senderPhoneNumber" value="${THE_ORDER.senderPhoneNumber}"/></td>					
                            </tr>

                            <tr>
                                    <td colspan="2" align = "center"><label>Recipient<br/>收件人</label></td>			
                                </tr>
                            <tr>
                                <td><label>Name<br/>姓名</label></td>
                                <td><input type="text" name="recipientName" value="${THE_ORDER.recipientName}"/></td>					
                            </tr>			
                            <tr>
                                <td><label>Address<br/>地址</label></td>
                                <td><input type="text" name="recipientAddress" value="${THE_ORDER.recipientAddress}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Postal Code<br/>郵遞區號</label></td>
                                <td><input type="text" name="recipientPostalCode" value="${THE_ORDER.recipientPostalCode}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Phone Number<br/>電話號碼</label></td>
                                <td><input type="text" name="recipientPhoneNumber" value="${THE_ORDER.recipientPhoneNumber}"/></td>					
                            </tr>
                            
                            <tr>
                                <td colspan="2" align = "center"><label>Package Detail<br/>訂單詳細資訊 </label></td>		
                            </tr>
                            <tr>
                                <td><label>Type Of Package<br/>包裹種類</label></td>
                                <td><input type="text" name="typeOfPackage" value="${THE_ORDER.typeOfPackage}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Sending Time<br/>欲送達時間</label></td>
                                <td><input type="text" name="sendingTime" value="${THE_ORDER.sendingTime}"/></td>					
                            </tr>
                            <tr>
                                <td><label>Things in the Package<br/>包裹內物品</label></td>
                                <td><input type="text" name="packageThings" value="${THE_ORDER.packageThings}"/></td>					
                            </tr>					
                            
                            <tr>
                                <td colspan="2" align="center"><input type="submit" value="Update｜更新" class="save"/></td>					
                            </tr>                        
                          	
                        
                        </tbody>
                    </table>
                </form>
            
            <!-- line break here -->
                <div style="clear : both;"></div>
                
                <br/><br/>
                <p>
                    <a href="index.jsp">Back to the Home Page｜返回首頁</a>
                </p>
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
