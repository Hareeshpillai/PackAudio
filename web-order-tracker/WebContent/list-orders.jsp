<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.*, order.*" %>
<!DOCTYPE html>

<html>

<head>
	<title>PackAudio Website</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	
</head>

<body>

	<div id = "wrapper">
		<div id = "header">
			<h2>PackAudio Maintenance</h2>
		</div>	
	</div>
	<br/><br/>
	
	<!-- put a new button: add order -->
				<input type="button" value="add-order-button"
						onclick="window.location.href = 'add-order-form.jsp'" class = "add-order-button"/><!-- add css here  class="" -->
	<div id="content">
		<div id="content">
			<table>
				<tr>
				<!-- senderName, senderAddress, senderPostalCode, senderPhoneNumber;
						recipientName, recipientAddress;, recipientPostalCode, recipientPhoneNumber;
						typeOfPackage, sendingTime, packageThings; -->
					<th>sender Name</th>
					<th>sender Address</th>
					<th>sender PostalCode</th>		
					<th>sender PhoneNumber</th>		
					
					<th>recipient Name</th>
					<th>recipient Address</th>
					<th>recipient PostalCode</th>
					<th>recipient PhoneNumber</th>
					
					<th>type Of Package</th>
					<th>sending Time</th>
					<th>package Things</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tmpOrder" items="${ORDER_LIST}">	<!-- ${ORDER_LIST}: ATTRIBUTE NAME by the servlet -->
				
				<!-- set a link for updating each order -->
				<c:url var="tmpLink" value="OrderControllerServlet">
					<c:param name="command" value="LOAD"/> <!-- LOAD to get the specific orderId -->
					<c:param name="orderId" value="${tmpOrder.id}"/> <!-- save the ID -->
				</c:url>			
				<!-- link ends here -->
				
				<!-- set a link to delete each order -->
				<c:url var="deleteLink" value="OrderControllerServlet">
					<c:param name="command" value="DELETE"/> <!-- LOAD to get the specific orderId -->
					<c:param name="orderId" value="${tmpOrder.id}"/> <!-- save the ID -->
				</c:url>			
				<!-- link ends here -->
				
					<tr>
						<td>${tmpOrder.senderName}</td>
						<td>${tmpOrder.senderAddress}</td>
						<td>${tmpOrder.senderPostalCode}</td>
						<td>${tmpOrder.senderPhoneNumber}</td>
						
						<td>${tmpOrder.recipientName}</td>
						<td>${tmpOrder.recipientAddress}</td>
						<td>${tmpOrder.recipientPostalCode}</td>
						<td>${tmpOrder.recipientPhoneNumber}</td>
						
						<td>${tmpOrder.typeOfPackage}</td>
						<td>${tmpOrder.sendingTime}</td>
						<td>${tmpOrder.packageThings}</td>
						<td>
							<a href="${tmpLink}">Update</a>||
							<a href="${deleteLink}"
								onclick = "if(!(confirm('Are you sure to delete this order'))) return false">Delete</a>
								<!-- javascript onclick handler -->
						</td> 
						<!-- ${tmpLink} == tmpLink in c:url var="tmpLink" value="OrderControllerServlet"-->
						<!-- the tmpLink looks like http://localhost:8080/web-order-tracker/OrderControllerServlet?command=LOAD&orderId=6 -->
					 
					</tr>					
				
				</c:forEach>
				
			</table>
			
			<p>
				<a href="index.jsp">Back to the home page</a>
			</p>
		</div>
	
	</div>



</body>

</html>