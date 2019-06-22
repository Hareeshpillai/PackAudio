<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
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
            #order {
              font-family: sans-serif;
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
                font-family:corbel,Noto Sans TC;
                /*border: 1px solid #666;*/ 
                border-radius: 5px; 
                padding: 4px; 
                font-size: 16px;
            }
            
            #hint {
            	text-shadow: 2px 2px 5px #99dcff;
            	
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
				<h2 class="margin-top white"><font face="corbel, Noto Sans TC">Your Order｜您的訂單</h2>
				<h4 class="light white">
					Check your order anytime and anywhere <br/><br/>
				</h4>
				<h3 id="hint">
					<font color="white" face="corbel, Noto Sans TC">
						Remember to upload your video at the bottom!<br/>
						請記得上傳您的影片
					</font>
				</h3>

            </div>
            <div align="center" style="text-align:center" >
            	<h4 class="light white" >Your Order ID is ${THE_ORDER.id}</h4>
            	
<%
	//for image reading
	BufferedImage bImage = ImageIO.read(new File("D:\\desktop\\java practice\\web-order-tracker\\WebContent\\img\\customerQR.png"));//give the path of an image
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	ImageIO.write( bImage, "jpg", baos );
	baos.flush();
	byte[] imageInByteArray = baos.toByteArray();
	baos.close();
	String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
%>
            	<img src="data:image/jpg;base64, <%=b64%>" alt="QRcode" width="250" height="250" style="display:block; margin:auto;">
            	
				<h3 class="light-white">Detail of your order</h3>   
                
                <form action = "OrderControllerServlet" method="post" enctype="multipart/form-data">
	                <table id="order" align="center">
	                    <tbody>
	                        <tr >
	                            <td colspan="2" align = "center" ><label>Sender<br/>寄件人</label></td>			
	                        </tr>
	                        <tr>
	                            <td width="20%"><label>Name<br/>姓名</label></td>
	                            <td>${THE_ORDER.senderName}</td>					
	                        </tr>			
	                        <tr>
	                            <td><label>Address<br/>地址</label></td>
	                            <td>${THE_ORDER.senderAddress}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Postal Code<br/>郵遞區號</label></td>
	                            <td>${THE_ORDER.senderPostalCode}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Phone Number<br/>電話號碼</label></td>
	                            <td>${THE_ORDER.senderPhoneNumber}</td>					
	                        </tr>
	
	                        <tr>
	                                <td colspan="2" align = "center"><label>Recipient<br/>收件人 </label></td>			
	                            </tr>
	                        <tr>
	                            <td><label>Name<br/>姓名</label></td>
	                            <td>${THE_ORDER.recipientName}</td>					
	                        </tr>			
	                        <tr>
	                            <td><label>Address<br/>地址</label></td>
	                            <td>${THE_ORDER.recipientAddress}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Postal Code<br/>郵遞區號</label></td>
	                            <td>${THE_ORDER.recipientPostalCode}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Phone Number<br/>電話號碼</label></td>
	                            <td>${THE_ORDER.recipientPhoneNumber}</td>					
	                        </tr>
	                        
	                        <tr>
	                            <td colspan="2" align = "center"><label>Package Detail<br/>訂單詳細資訊 </label></td>		
	                        </tr>
	                        <tr>
	                            <td><label>Type Of Package<br/>包裹種類</label></td>
	                            <td>${THE_ORDER.typeOfPackage}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Sending Time<br/>欲送達時間</label></td>
	                            <td>${THE_ORDER.sendingTime}</td>					
	                        </tr>
	                        <tr>
	                            <td><label>Things in the Package<br/>包裹內物品</label></td>
	                            <td>${THE_ORDER.packageThings}</td>					
	                        </tr>
	                        
	                        <tr>
	                        	<td colspan="2" align = "center"><label>The Video to share<br/>欲分享的影片</label></td>
	                        </tr>
	                        
	                        <tr>
	                        
	                        	<td colspan="2" align="center">
	                        			<input type="file" name="customerVideo" value=""/>
	                        			<br/>
										<input type="submit" value="Submit｜送出" name="Upload"
											onclick = "if(!(confirm('Please double check the video is correct, thank you.\n 請確認上傳的影片正確無誤，謝謝。'))) return false"/>	
	                        	</td>
						
					
	                        </tr>					
	                        
	                    </tbody>
	                </table>
	               
               </form> 
                
				
            </div>
			
		</div>
    </section>

<!-- **************************************************************************************************** -->
     <!--update form section-->
    <section id="services" class="section section-padded">
        <div class="container">
            <div class="row title text-center">
                <h2 class="margin-top">Update</h2>
                <h4 class="light muted">update here</h4>
                <form action="OrderControllerServlet" method="GET">
                    <input type="hidden" name="command" value="LOAD_CUSTOMER"/>
                    <h4>Input your order ID   <input type="text" name="orderId"/></h4>
                    <input type="submit" value="Submit" class="save"/>
                </form>
            </div>
        </div>
    </section>
    
<!-- **************************************************************************************************** -->
    <!-- delete order section -->
    <section id="delete" class="section section-padded">
        <div class="container">
            <div class="row title text-center">
                <h2 class="margin-top">Delete</h2>
                <h4 class="light muted">delete here</h4>
                <form action="OrderControllerServlet" method="GET">
                    <input type="hidden" name="command" value="DELETE_CUSTOMER"/>
                    <h4>Input your order ID   <input type="text" name="orderId"/></h4>
                    <input type="submit" value="Submit" class="save"/>
                </form>
            </div>
        </div>
    </section>
    
    
    
    
   
    

	<!-- BIG PROBLEMS-->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Try Our New Service Packaudio!</h3>
					<h5 class="light regular light-white">A Brand New form of Sending Packages.</h5>
					<a href="add-order-form-2.jsp" class="btn btn-blue ripple trial-button">Try Packaudio</a>
				</div>
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Opening Hours <span class="open-blink"></span></h3>
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
