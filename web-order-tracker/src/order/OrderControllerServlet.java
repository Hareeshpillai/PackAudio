package order;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;




@MultipartConfig(location = "D:/desktop/java practice/web-order-tracker/customer-video")
@WebServlet("/OrderControllerServlet")
public class OrderControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OrderDbUtil orderDbUtil;
	
	@Resource(name="jdbc/web_order_tracker")
	private DataSource dataSource;
	

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			orderDbUtil = new OrderDbUtil(dataSource);
		}catch(Exception e) {
			System.out.println(e.toString());
			System.out.println("Servlet init()");
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Part part = request.getPart("customerVideo");
		String filename = getFilename(part);
				
		//writeTo function output file by myself
		writeTo(filename, part);
		
		//add customerRequest to request
		String[] customerRequest = new String[2];
		customerRequest[0] = "Your video has been uploaded successfully!";
		customerRequest[1] = "您的影片已成功上傳！";
		request.setAttribute("CUSTOMER_REQUEST", customerRequest);
		
		//request.setAttribute("THE_ORDER", theOrder);
		
		//send to jsp page
		RequestDispatcher dis = request.getRequestDispatcher("/result.jsp");
		dis.forward(request, response);
		
	}
	
	private String getFilename(Part part) {
		String header = part.getHeader("Content-Disposition");
		String filepath = header.substring(
				header.indexOf("filename=\"")+10, 
				header.lastIndexOf("\"")
				);
		String filename = filepath.substring(filepath.lastIndexOf("\\")+1);
		
		return filename;
	}
	
	private void writeTo(String filename, Part part) throws IOException, FileNotFoundException{
		InputStream in = part.getInputStream();
		OutputStream out = new FileOutputStream("D:/desktop/java practice/web-order-tracker/customer-video/"+filename);
		
		byte[] buffer = new byte[1024];
		int len = -1;
		while((len = in.read(buffer))!=-1) {
			out.write(buffer, 0, len);
		}
		in.close();
		out.close();
	}

	//fulfill the get request from the each jsp page 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// read the command param from add-order-form-2.jsp
			String theCommand = request.getParameter("command");
			
			//if the command is missing, then default to list all the orders
			if(theCommand==null) {
				theCommand="LIST";  //in order to avoid the null pointer on theCommand			
			}
			
			//route to the appropriate method
			switch(theCommand) {
				case "LIST":
					// list the order in the MVC fashion
					listOrders(request, response);
					break;
				case "ADD":
					addOrder(request, response, "staff"); 
					break;
				case "LOAD":
					loadOrder(request, response, "/update-order-form.jsp");
					break;
				case "UPDATE":	
					updateOrder(request, response, "staff"); 
					break;
				case "DELETE":	//delete by staff
					deleteOrder(request, response, "staff");
					break;
				case "ADD_CUSTOMER":
					addOrder(request, response, "customer");
					break;
				case "LOAD_CUSTOMER":
					loadOrder(request, response, "/update-order-form-2.jsp"); 
					break;
				case "UPDATE_CUSTOMER":
					updateOrder(request, response, "customer");  
					break;
				case "DELETE_CUSTOMER":
					deleteOrder(request, response, "customer");  
					break;
				case "VERIFICATION":
					verification(request, response);				
					break;
				default :
					//send to home page
					RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
					dispatcher.forward(request, response);
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("Servlet doGet()");
		}
	}

	//for verifying to go into the back end
	private void verification(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read the password and verify it
		if(request.getParameter("psw").equals("staff")) {
			//send all the order info. back to maintenance page
			listOrders(request, response);
		}
		else {
			//send to home page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}	
		
	}


	//for dleleting the order in the DB
	private void deleteOrder(HttpServletRequest request, HttpServletResponse response, String identity) throws Exception{
		//set the token to show the order exist or not
		boolean exist = true;
		
		// read order id from the data
		String theOrderId = request.getParameter("orderId"); 
		
		//check the order exist or not

		//get order from DB (StudentDbUtil)
		Order theOrder = null;
		try {
			theOrder = orderDbUtil.getOrder(theOrderId);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("the order id doesn't exist"); 
			exist = false;
		}
		if(exist == false) {
			String[] customerRequest = new String[2] ; 
			customerRequest[0] = "The order id doesn't exist!";
			customerRequest[1] = "訂單編號不存在！";
			
			request.setAttribute("CUSTOMER_REQUEST", customerRequest);
						
			//sent to jsp page: update-order-form-2.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
		}
		else {
			int id = Integer.parseInt(theOrderId);  //convert it to integer
			//delete order from db
			orderDbUtil.deleteOrder(id);
			
			if(identity=="staff") {
				//send them back to the list page
				listOrders(request, response);
			}else {				
				//add customerRequest to request
				String[] customerRequest = new String[2] ; 
				customerRequest[0] = "Your order has been deleted successfully!";
				customerRequest[1] = "您的訂單已成功刪除！";					
						
				request.setAttribute("CUSTOMER_REQUEST", customerRequest);
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	//for updating the order in the DB
	private void updateOrder(HttpServletRequest request, HttpServletResponse response, String identity) throws SQLException, ServletException, IOException {
		//read the order info from form data 
		String idString = request.getParameter("orderId"); 
		
		//set the new info of order
		int id = Integer.parseInt(idString);
		String senderName = request.getParameter("senderName");
		String senderAddress = request.getParameter("senderAddress");
		String senderPostalCode = request.getParameter("senderPostalCode");
		String senderPhoneNumber = request.getParameter("senderPhoneNumber");
		
		String recipientName = request.getParameter("recipientName");
		String recipientAddress = request.getParameter("recipientAddress");
		String recipientPostalCode = request.getParameter("recipientPostalCode");
		String recipientPhoneNumber = request.getParameter("recipientPhoneNumber");
		
		String typeOfPackage = request.getParameter("typeOfPackage");
		String sendingTime = request.getParameter("sendingTime");
		String packageThings = request.getParameter("packageThings");
		
		//create a new Order object
		Order theOrder = new Order(id, senderName, senderAddress, senderPostalCode, senderPhoneNumber,
						recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber,	typeOfPackage, sendingTime, packageThings);
		
		//perform update on DB (orderDbUtil)
		orderDbUtil.updateOrder(theOrder);
		
		
		if(identity == "staff") {
			try {
				//send all the order info. back to maintenance page
				listOrders(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Servlet updateOrder()");
			}
		}else {
			//add customerRequest to request
			String[] customerRequest = new String[2] ; 
			customerRequest[0] = "Your order information has been updated successfully!";
			customerRequest[1] = "您的訂單已成功更新！";
			request.setAttribute("CUSTOMER_REQUEST", customerRequest);	
			
			//send the request to result page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
			
		}		
		
	}
	
	//for loading order info
	private void loadOrder(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		//read order id from form data
		String theOrderId = request.getParameter("orderId");
		
		//get order from DB (StudentDbUtil)
		Order theOrder = null;
		try {
			theOrder = orderDbUtil.getOrder(theOrderId);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("the order id doesn't exist");			
		}
		
		if(theOrder == null) {
			String[] customerRequest = new String[2] ; 
			customerRequest[0] = "The order id doesn't exist!";
			customerRequest[1] = "訂單編號不存在！";
			
			request.setAttribute("CUSTOMER_REQUEST", customerRequest);
						
			//sent to jsp page: update-order-form-2.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response); 
		}
		else {
			//place order in the request attribute
			request.setAttribute("THE_ORDER", theOrder);
			
			//sent to jsp page: update-order-form-2.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
	}
	

	//for adding new order into DB
	private void addOrder(HttpServletRequest request, HttpServletResponse response, String identity) throws Exception {
		/* The Attribute in each Order object
		 * senderName, senderAddress, senderPostalCode, senderPhoneNumber;
		 * recipientName, recipientAddress;, recipientPostalCode, recipientPhoneNumber;
		 * typeOfPackage, sendingTime, packageThings*/
		
		//read order info from form data
		String senderName = request.getParameter("senderName");
		String senderAddress = request.getParameter("senderAddress");
		String senderPostalCode = request.getParameter("senderPostalCode");
		String senderPhoneNumber = request.getParameter("senderPhoneNumber");
		
		String recipientName = request.getParameter("recipientName");
		String recipientAddress = request.getParameter("recipientAddress");
		String recipientPostalCode = request.getParameter("recipientPostalCode");
		String recipientPhoneNumber = request.getParameter("recipientPhoneNumber");
		
		String typeOfPackage = request.getParameter("typeOfPackage");
		String sendingTime = request.getParameter("sendingTime");
		String packageThings = request.getParameter("packageThings");
		
		//create a new Order object
		Order tmpOrder = new Order(senderName, senderAddress, senderPostalCode, senderPhoneNumber,
						recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber,	typeOfPackage, sendingTime, packageThings);
		
		//add the order to DB
		orderDbUtil.addOrder(tmpOrder);
		
		//get the order id
		int id = orderDbUtil.findID(tmpOrder);
		
		if (identity=="staff") {
			//send all the order info. back to maintenance page
			listOrders(request, response);
			//QRcodeGenerator.generator(id, senderName, recipientName);
		}else {			
			Order theOrder = new Order(id, senderName, senderAddress, senderPostalCode, senderPhoneNumber,
					recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber,	typeOfPackage, sendingTime, packageThings);
			
			//request set Attribute
			//place order in the request attribute
			request.setAttribute("THE_ORDER", theOrder);
			
			QRcodeGenerator.generator(id, senderName, recipientName);
			System.out.println(theOrder.getId());
			
			//send QR code page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/QRCode.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

	//send all the order info. back to maintenance page
	private void listOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//get the order from DB util
		List<Order> orders = orderDbUtil.getOrders();
		
		//add orders to the request
		request.setAttribute("ORDER_LIST", orders);  //ORDER_LIST is a name for jsp to use, orders is a list of order object
		
		//send to the JSP page(view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-orders.jsp");
		dispatcher.forward(request, response);

	}

}
