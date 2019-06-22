package order;

public class Order {
	/* all the attribute
	 * senderName, senderAddress, senderPostalCode, senderPhoneNumber;
	 * recipientName, recipientAddress;, recipientPostalCode, recipientPhoneNumber;
	 * typeOfPackage, sendingTime, packageThings*/
	int id;
	String senderName;
	String senderAddress;
	String senderPostalCode;
	String senderPhoneNumber;

	String recipientName;
	String recipientAddress;
	String recipientPostalCode;
	String recipientPhoneNumber;
	
	String typeOfPackage;
    String sendingTime;
    String packageThings;
    
    //constructor
	public Order(int id, String senderName, String senderAddress, String senderPostalCode, String senderPhoneNumber,
			String recipientName, String recipientAddress, String recipientPostalCode, String recipientPhoneNumber,
			String typeOfPackage, String sendingTime, String packageThings) {
		super();
		this.id = id;
		this.senderName = senderName;
		this.senderAddress = senderAddress;
		this.senderPostalCode = senderPostalCode;
		this.senderPhoneNumber = senderPhoneNumber;
		this.recipientName = recipientName;
		this.recipientAddress = recipientAddress;
		this.recipientPostalCode = recipientPostalCode;
		this.recipientPhoneNumber = recipientPhoneNumber;
		this.typeOfPackage = typeOfPackage;
		this.sendingTime = sendingTime;
		this.packageThings = packageThings;
	}
	
	//constructor
	public Order(String senderName, String senderAddress, String senderPostalCode, String senderPhoneNumber,
			String recipientName, String recipientAddress, String recipientPostalCode, String recipientPhoneNumber,
			String typeOfPackage, String sendingTime, String packageThings) {
		super();
		this.senderName = senderName;
		this.senderAddress = senderAddress;
		this.senderPostalCode = senderPostalCode;
		this.senderPhoneNumber = senderPhoneNumber;
		this.recipientName = recipientName;
		this.recipientAddress = recipientAddress;
		this.recipientPostalCode = recipientPostalCode;
		this.recipientPhoneNumber = recipientPhoneNumber;
		this.typeOfPackage = typeOfPackage;
		this.sendingTime = sendingTime;
		this.packageThings = packageThings;
	}
	
	//getter and setter below
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getSenderPostalCode() {
		return senderPostalCode;
	}

	public void setSenderPostalCode(String senderPostalCode) {
		this.senderPostalCode = senderPostalCode;
	}

	public String getSenderPhoneNumber() {
		return senderPhoneNumber;
	}

	public void setSenderPhoneNumber(String senderPhoneNumber) {
		this.senderPhoneNumber = senderPhoneNumber;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}

	public String getRecipientPostalCode() {
		return recipientPostalCode;
	}

	public void setRecipientPostalCode(String recipientPostalCode) {
		this.recipientPostalCode = recipientPostalCode;
	}

	public String getRecipientPhoneNumber() {
		return recipientPhoneNumber;
	}

	public void setRecipientPhoneNumber(String recipientPhoneNumber) {
		this.recipientPhoneNumber = recipientPhoneNumber;
	}

	public String getTypeOfPackage() {
		return typeOfPackage;
	}

	public void setTypeOfPackage(String typeOfPackage) {
		this.typeOfPackage = typeOfPackage;
	}

	public String getSendingTime() {
		return sendingTime;
	}

	public void setSendingTime(String sendingTime) {
		this.sendingTime = sendingTime;
	}

	public String getPackageThings() {
		return packageThings;
	}

	public void setPackageThings(String packageThings) {
		this.packageThings = packageThings;
	}  
    
    
}
