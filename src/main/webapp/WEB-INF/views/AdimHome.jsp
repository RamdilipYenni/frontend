<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN AUTHORITY</title>
</head>
<body>
<!-- Navigation -->
<%@include file="Header.jsp" %>

<h1>This is the AdminHome Page. </h1>
	<h3>Message: ${message}</h3>
	<h3>Username: ${username}</h3>
	
	<a href="<c:url value="/logout"/> ">Logout</a>

<!-- Footer	 -->
<%@include file="Footer.jsp" %>

</body>
</html>