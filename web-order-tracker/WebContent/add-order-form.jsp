<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Packaudio package sending service with audio deliver</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-order-style.css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Welcome</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Add order</h3>
		
		<!-- form here -->
		<form action="OrderControllerServlet" method="GET">
			<input type="hidden" name="command" value="ADD"/>
			<!-- senderName, senderAddress, senderPostalCode, senderPhoneNumber;
						recipientName, recipientAddress;, recipientPostalCode, recipientPhoneNumber;
						typeOfPackage, sendingTime, packageThings; -->
			<table border="1">
				<tbody>
					<tr>
						<td><label>Sender name</label></td>
						<td><input type="text" name="senderName"/></td>					
					</tr>			
					<tr>
						<td><label>Sender Address</label></td>
						<td><input type="text" name="senderAddress"/></td>					
					</tr>
					<tr>
						<td><label>Sender PostalCode</label></td>
						<td><input type="text" name="senderPostalCode"/></td>					
					</tr>
					<tr>
						<td><label>Sender Phone Number</label></td>
						<td><input type="text" name="senderPhoneNumber"/></td>					
					</tr>
					
					<tr>
						<td><label>Recipient Name</label></td>
						<td><input type="text" name="recipientName"/></td>					
					</tr>			
					<tr>
						<td><label>Recipient Address</label></td>
						<td><input type="text" name="recipientAddress"/></td>					
					</tr>
					<tr>
						<td><label>Recipient PostalCode</label></td>
						<td><input type="text" name="recipientPostalCode"/></td>					
					</tr>
					<tr>
						<td><label>Recipient Phone Number</label></td>
						<td><input type="text" name="recipientPhoneNumber"/></td>					
					</tr>
					
					<tr>
						<td><label>Type Of Package</label></td>
						<td><input type="text" name="typeOfPackage"/></td>					
					</tr>
					<tr>
						<td><label>Sending Time</label></td>
						<td><input type="text" name="sendingTime"/></td>					
					</tr>
					<tr>
						<td><label>Things in the Package</label></td>
						<td><input type="text" name="packageThings"/></td>					
					</tr>					
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>					
					</tr>
				
				</tbody>
			</table>
		</form>
		
		<!-- line break here -->
		<div style="clear : both;"></div>
		
		<p>
			<a href="OrderControllerServlet">Back to the list</a>
		</p>
		
	</div>
	
</body>

</html>