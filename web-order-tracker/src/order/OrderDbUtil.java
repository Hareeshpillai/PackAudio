package order;
import javax.sql.DataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDbUtil {
	//attribute
	private DataSource dataSource;
	
	//constructor
	public OrderDbUtil(DataSource theDataSource) {
			dataSource = theDataSource;
	}
	
	//get all the orders from DB into a list
	public List<Order> getOrders() throws Exception{
		List<Order> orders = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			//get the connection
			myConn = dataSource.getConnection();
			
			//create sql stmt
			String sql = "select * from package_order";
			myStmt = myConn.createStatement();
			
			//execute query
			myRs = myStmt.executeQuery(sql);
			
			//process the result set
			while(myRs.next()) {
				//retrieve data from result set row
				int id  = myRs.getInt("id");  //"database column name"
				String senderName = myRs.getString("senderName");
				String senderAddress = myRs.getString("senderAddress");
				String senderPostalCode = myRs.getString("senderPostalCode");
				String senderPhoneNumber = myRs.getString("senderPhoneNumber");
				
				String recipientName = myRs.getString("recipientName");
				String recipientAddress = myRs.getString("recipientAddress");
				String recipientPostalCode = myRs.getString("recipientPostalCode");
				String recipientPhoneNumber = myRs.getString("recipientPhoneNumber");
				
				String typeOfPackage = myRs.getString("typeOfPackage");
			    String sendingTime = myRs.getString("sendingTime");
			    String packageThings = myRs.getString("packageThings");

			    //create new student object
				Order tempOrder = new Order(id, senderName, senderAddress, senderPostalCode, senderPhoneNumber,
						recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber, typeOfPackage, sendingTime, packageThings);
				
				//add it to the list of order
				orders.add(tempOrder);				
			}	
			 
			return orders;
			
		}finally {
			//close the jdbc objects
			close(myConn, myStmt, myRs);
		}
		
	}
	
	//close the DB connection
	private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if(myRs != null) {
				myRs.close();
			}
			if(myStmt != null) {
				myStmt.close();
			}
			if(myConn != null) {
				myConn.close();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	//execute the sql of adding order
	public void addOrder(Order theOrder) {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		String sql = "INSERT INTO package_order "
				+ "(senderName, senderAddress, senderPostalCode, senderPhoneNumber, recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber, typeOfPackage, sendingTime, packageThings) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";				
		try {
			//get connection
			myConn = dataSource.getConnection();
			
			//create sql stmt
			myStmt = myConn.prepareStatement(sql);
			
			//set the param values for order
			myStmt.setString(1, theOrder.getSenderName());
			myStmt.setString(2, theOrder.getSenderAddress());
			myStmt.setString(3, theOrder.getSenderPostalCode());
			myStmt.setString(4, theOrder.getSenderPhoneNumber());
			
			myStmt.setString(5, theOrder.getRecipientName());
			myStmt.setString(6, theOrder.getRecipientAddress());
			myStmt.setString(7, theOrder.getRecipientPostalCode());
			myStmt.setString(8, theOrder.getRecipientPhoneNumber());
			
			myStmt.setString(9, theOrder.getTypeOfPackage());
			myStmt.setString(10, theOrder.getSendingTime());
			myStmt.setString(11, theOrder.getPackageThings());
			
			
			//execute sql insert
			myStmt.executeUpdate();
			System.out.println("Record is inserted into web_order_tracker.order!");
			
		}catch(SQLException e) {
			System.out.println(e.toString());
			System.out.println("Error: in OrderDbUtil.java addOrder()");
		}finally {
			//clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}

	//execute the sql of getting specific order info.
	public Order getOrder(String theOrderId) throws Exception {

		Order theOrder = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet  myRs = null;
		int orderId;
		
		try {
			//convert student id to int because the html input is a text
			orderId = Integer.parseInt(theOrderId);

			//get connection to DB
			myConn = dataSource.getConnection();
			
			//create sql to get selected order
			String sql = "select * from package_order where id = ?";
			
			//create preparedStatement
			myStmt = myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, orderId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set 
			if(myRs.next()) {
				//read and construct a new order object
				String senderName = myRs.getString("senderName");
				String senderAddress = myRs.getString("senderAddress");
				String senderPostalCode = myRs.getString("senderPostalCode");
				String senderPhoneNumber = myRs.getString("senderPhoneNumber");
				
				String recipientName = myRs.getString("recipientName");
				String recipientAddress = myRs.getString("recipientAddress");
				String recipientPostalCode = myRs.getString("recipientPostalCode");
				String recipientPhoneNumber = myRs.getString("recipientPhoneNumber");
				
				String typeOfPackage = myRs.getString("typeOfPackage");
			    String sendingTime = myRs.getString("sendingTime");
			    String packageThings = myRs.getString("packageThings");

			    //create new order object
				theOrder = new Order(orderId, senderName, senderAddress, senderPostalCode, senderPhoneNumber,
						recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber, typeOfPackage, sendingTime, packageThings);
				
			}
			else {
				throw new Exception("Could not find order id: " +orderId);
			}
			
			return theOrder;
			
		}finally {
			//clean up the JDBC connection
			close(myConn, myStmt, myRs);
		}
		
		
	}

	//execute sql for updating order
	public void updateOrder(Order theOrder) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			//get connection to DB
			myConn = dataSource.getConnection();
			
			//create sql to get selected order
			String sql = "update web_order_tracker.package_order\r\n" + 
					"set senderName = ?, senderAddress = ?, senderPostalCode = ?, senderPhoneNumber = ?,"
					+ "recipientName = ?, recipientAddress = ?, recipientPostalCode = ?, recipientPhoneNumber = ?,"
					+ "typeOfPackage = ?, sendingTime = ?, packageThings = ? " + 
					"where id = ?";
			
			//create preparedStatement
			myStmt = myConn.prepareStatement(sql);
			
			//set the param values for order
			myStmt.setString(1, theOrder.getSenderName());
			myStmt.setString(2, theOrder.getSenderAddress());
			myStmt.setString(3, theOrder.getSenderPostalCode());
			myStmt.setString(4, theOrder.getSenderPhoneNumber());
			
			myStmt.setString(5, theOrder.getRecipientName());
			myStmt.setString(6, theOrder.getRecipientAddress());
			myStmt.setString(7, theOrder.getRecipientPostalCode());
			myStmt.setString(8, theOrder.getRecipientPhoneNumber());
			
			myStmt.setString(9, theOrder.getTypeOfPackage());
			myStmt.setString(10, theOrder.getSendingTime());
			myStmt.setString(11, theOrder.getPackageThings());
			
			
			myStmt.setInt(12, theOrder.getId());
			
			//execute statement
			myStmt.executeUpdate();
		}
		finally {			
			close(myConn, myStmt, null);
		}
		
	}

	//execute sql for deleting order
	public void deleteOrder(int id) {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			//get connection to db
			myConn = dataSource.getConnection();
			
			//create sql
			String sql = "delete from  web_order_tracker.package_order\r\n" + 
					"where id = ?";
			
			//pre-statement
			myStmt = myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, id);
			
			//execute
			myStmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e.toString());
			System.out.println("DbUtil deleteOrder()");
		}finally {
			close(myConn, myStmt, null);
		}
		
	}

	//execute sql for sending back the order id
	public int findID(Order theOrder) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet  myRs = null;
		int theOrderId =0;
		try {
			//get connection to DB
			myConn = dataSource.getConnection();
			
			//create sql to get selected order
			String sql = "select id\r\n" + 
					"from package_order\r\n" + 
					"where senderName = ? and senderAddress = ? and senderPostalCode = ? and senderPhoneNumber = ? and \r\n" + 
					"	recipientName= ? and recipientAddress= ? and recipientPostalCode= ? and recipientPhoneNumber= ? and "
					+ "typeOfPackage= ? and sendingTime= ? and packageThings = ?";
			
			//create preparedStatement
			myStmt = myConn.prepareStatement(sql);
			
			//set params
			//set the param values for order
			myStmt.setString(1, theOrder.getSenderName());
			myStmt.setString(2, theOrder.getSenderAddress());
			myStmt.setString(3, theOrder.getSenderPostalCode());
			myStmt.setString(4, theOrder.getSenderPhoneNumber());
			
			myStmt.setString(5, theOrder.getRecipientName());
			myStmt.setString(6, theOrder.getRecipientAddress());
			myStmt.setString(7, theOrder.getRecipientPostalCode());
			myStmt.setString(8, theOrder.getRecipientPhoneNumber());
			
			myStmt.setString(9, theOrder.getTypeOfPackage());
			myStmt.setString(10, theOrder.getSendingTime());
			myStmt.setString(11, theOrder.getPackageThings());
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set 
			if(myRs.next()) {
				//read and construct
				theOrderId = myRs.getInt("id");
				return theOrderId;
			}
			
			return theOrderId;
		}
		finally {
			//clean up JDBC connection
			close(myConn, myStmt, null);
		}
		
	}






}
