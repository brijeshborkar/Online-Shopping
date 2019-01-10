<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.PreparedStatement,java.io.IOException,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet" %>
<%@ page import="javax.servlet.RequestDispatcher,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
PreparedStatement pstmt1;
PreparedStatement pstmt2;
PreparedStatement pstmt3;
PreparedStatement pstmt4;
static String username;
String password;
int mobilequantity;
int clothesquantity;
String clothes;
String mobile;
ResultSet clothValueRS;
ResultSet mobileValueRS;
static int clothValue;
static int mobileValue;
int totalClothValue;
int totalMobileValue;
String sex;
String email;
static int totalValue;
String contact;
int result;

%>


<%
String registerqry = "insert into jejw16.account VALUES (?,?,?,?,?)";
String loginqry = "select * from jejw16.account where username=? and password=?";
String fetchqry = "select price from jejw16.stock where product=?";


Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=dinga");
pstmt1 = con.prepareStatement(loginqry);
pstmt2 = con.prepareStatement(registerqry);
String hiddenValue = request.getParameter("hiddenValue");


if(hiddenValue.equalsIgnoreCase("login")) {
	username = request.getParameter("username");
	password = request.getParameter("password");
	pstmt1.setString(1, username);
	pstmt1.setString(2, password);
	ResultSet result = pstmt1.executeQuery();
	if(result.next()) {
		response.sendRedirect("./order.html");
	}else {
		RequestDispatcher rd = request.getRequestDispatcher("./login.html");
		rd.include(request, response);
		out.println("<br><p align='center' style='color:red;'>Login failed,incorrect username or password.<br> Please try Again!!!</p>");
	}
}
if(hiddenValue.equalsIgnoreCase("register")) {
	username = request.getParameter("username");
	password = request.getParameter("password");
	sex = request.getParameter("sex");
	email = request.getParameter("email");
	contact = request.getParameter("contact");
	pstmt2.setString(1, username);
	pstmt2.setString(2, password);
	pstmt2.setString(3, sex);
	pstmt2.setString(4, email);
	pstmt2.setString(5, contact);
	try{
	result = pstmt2.executeUpdate();
	}
	catch(Exception e){
		RequestDispatcher rd = request.getRequestDispatcher("./register.html");
		rd.include(request, response);
		out.println("<p align='center' style='color:red;''>You cannot leave any field empty</p>");
	}
	if(result >= 1) {
		response.sendRedirect("./login.html");
		
	}
}
if(hiddenValue.equalsIgnoreCase("order")) {
	mobilequantity = Integer.parseInt(request.getParameter("mobilequantity"));
	clothesquantity = Integer.parseInt(request.getParameter("clothesquantity"));
	clothes = request.getParameter("clothes");
	mobile = request.getParameter("mobile");
	pstmt3 = con.prepareStatement(fetchqry);
	pstmt4 = con.prepareStatement(fetchqry);
	pstmt3.setString(1, clothes);
	pstmt4.setString(1, mobile);
	System.out.println(clothes);
	System.out.println(mobile);
	clothValueRS = pstmt3.executeQuery();
	mobileValueRS = pstmt4.executeQuery();

	
	if(clothValueRS.next()) {
		clothValue = clothValueRS.getInt("price");
	}
	if(mobileValueRS.next()) {
		mobileValue = mobileValueRS.getInt("price");
	}
	request.setAttribute("username", username);
	request.setAttribute("mobilevalue", mobileValue);

	request.setAttribute("clothvalue", clothValue);

	totalClothValue = clothesquantity*clothValue;
	totalMobileValue = mobilequantity*mobileValue;
	totalValue = totalClothValue + totalMobileValue;
	
	
	
	RequestDispatcher rd = request.getRequestDispatcher("./price.jsp");
	rd.include(request, response);
	
}
if(hiddenValue.equalsIgnoreCase("confirm")) {
	
	request.setAttribute("totalvalue",totalValue); 
	RequestDispatcher rd = request.getRequestDispatcher("./confirm.jsp");
	rd.forward(request, response);
	
}



%>
</body>
</html>