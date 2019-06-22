<!DOCTYPE html>
<html>
<head>
	<title>Update Order</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/update-order-style.css">

</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Update Order</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Order</h3>
		
		<!-- form here -->
		<form action="OrderControllerServlet" method="GET">
			<input type="hidden" name="command" value="UPDATE"/>
			<input type="hidden" name="orderId" value="${THE_ORDER.id}"/> <!-- for tracking the id so as to update db -->
			
			<!-- senderName, senderAddress, senderPostalCode, senderPhoneNumber;
						recipientName, recipientAddress;, recipientPostalCode, recipientPhoneNumber;
						typeOfPackage, sendingTime, packageThings; -->
			<table border="1">
				<tbody>
					<tr>
						<td><label>Sender name</label></td>
						<td><input type="text" name="senderName" value="${THE_ORDER.senderName}"/></td>					
					</tr>			
					<tr>
						<td><label>Sender Address</label></td>
						<td><input type="text" name="senderAddress" value="${THE_ORDER.senderAddress}"/></td>					
					</tr>
					<tr>
						<td><label>Sender PostalCode</label></td>
						<td><input type="text" name="senderPostalCode" value="${THE_ORDER.senderPostalCode}"/></td>					
					</tr>
					<tr>
						<td><label>Sender Phone Number</label></td>
						<td><input type="text" name="senderPhoneNumber" value="${THE_ORDER.senderPhoneNumber}"/></td>					
					</tr>
					
					<tr>
						<td><label>Recipient Name</label></td>
						<td><input type="text" name="recipientName" value="${THE_ORDER.recipientName}"/></td>					
					</tr>			
					<tr>
						<td><label>Recipient Address</label></td>
						<td><input type="text" name="recipientAddress" value="${THE_ORDER.recipientAddress}"/></td>					
					</tr>
					<tr>
						<td><label>Recipient PostalCode</label></td>
						<td><input type="text" name="recipientPostalCode" value="${THE_ORDER.recipientPostalCode}"/></td>					
					</tr>
					<tr>
						<td><label>Recipient Phone Number</label></td>
						<td><input type="text" name="recipientPhoneNumber" value="${THE_ORDER.recipientPhoneNumber}"/></td>					
					</tr>
					
					<tr>
						<td><label>Type Of Package</label></td>
						<td><input type="text" name="typeOfPackage" value="${THE_ORDER.typeOfPackage}"/></td>					
					</tr>
					<tr>
						<td><label>Sending Time</label></td>
						<td><input type="text" name="sendingTime" value="${THE_ORDER.sendingTime}"/></td>					
					</tr>
					<tr>
						<td><label>Things in the Package</label></td>
						<td><input type="text" name="packageThings" value="${THE_ORDER.packageThings}"/></td>					
					</tr>					
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save"/></td>					
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