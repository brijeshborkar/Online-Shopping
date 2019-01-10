<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="ty.html">
Press confirm to confirm your order


<input type="submit" value="Confirm">
</form>

<%
int totalvalue = (int) request.getAttribute("totalvalue");

out.println("Your total bill is "+totalvalue);
%> 
			
</body>
</html>