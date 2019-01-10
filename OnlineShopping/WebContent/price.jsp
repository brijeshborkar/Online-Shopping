<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<form action="./servlet.jsp"> 
Please check the following details. If everything is fine then press next to continue with your order 
<input type="submit" name="submit" value="next"> 
<input type="text" value="confirm" name="hiddenValue" hidden="true">
</form>  
<%!
String username;
String  mobilequantity;
String clothesquantity;
int  mobilevalue;
int clothvalue;
String mobile;
String clothes;
%>				
<%


username = (String)request.getAttribute("username");

mobilequantity = request.getParameter("mobilequantity");
clothesquantity = request.getParameter("clothesquantity");
mobilevalue = (int)request.getAttribute("mobilevalue");
clothvalue = (int)request.getAttribute("clothvalue");
mobile = request.getParameter("mobile");
clothes = request.getParameter("clothes");
out.println("Hello "+ username);
out.println(".You have ordered "+mobilequantity+" "+mobile);
out.println(".You have ordered "+clothesquantity+" "+clothes+"(s)");
out.println(".Price of 1 "+mobile+" is "+mobilevalue);
out.println(".Price of 1 "+clothes+" is "+clothvalue);

%>


</body>
</html>