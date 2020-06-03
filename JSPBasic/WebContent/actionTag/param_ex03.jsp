<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String name = request.getParameter("name"); 
	String nick = request.getParameter("nick");
	String age = request.getParameter("age");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	폼값:<%=name %><br>
	포워드로넘어온값:<%=nick %><br>
	포워드로넘어온값:<%=age %><br>
</body>
</html>