<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.xinu.Receiver"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send</title>
</head>
<body>
	
	Send<br/>
	<% Receiver.sendMsgToXinu("192.168.0.101", 5954, "0");
	%>
	
</body>
</html>