<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		User user = (User)request.getAttribute("user");
	%>
	이름:<%=user.getName() %><br>
	이메일:<%=user.getEmail() %><br>
	
	
	
</body>
</html>