<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	body {font-family: Arial, Helvetica, sans-serif;}
	/*form {border: 3px solid #f1f1f1;}*/
	
	input[type=text], input[type=password] {
	  width: 50%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	
	button {
	  background-color: #00a7ff;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 55%;
	}
	
	button:hover {
	  opacity: 0.8;
	}
	
	.cancelbtn {
	  width: auto;
	  padding: 10px 18px;
	  background-color: #f44336;
	}	
	
	img.avatar {
	  width: 40%;
	  border-radius: 50%;
	}
	
	.container {
	  padding: 16px;
	}
	
	span.psw {
	  float: right;
	  padding-top: 16px;
	}
</style>
</head>
<body>

	<h2>Back End Login</h2>

	<form action="OrderControllerServlet" method="GET">
	
	  <div class="container">
	    <label for="psw"><b>Password</b></label>
	    <input type="hidden" name="command" value="VERIFICATION"/> 
	    <input type="password" placeholder="Enter Password" name="psw">
	    <button type="submit">Login</button>
	  </div>
	
	  <div class="container" >
	    
	    <a href="index.jsp" >
	    	<button type="button" class="cancelbtn">Back to home page</button>
	    </a>
	  </div>
	  
	</form>

</body>
</html>
