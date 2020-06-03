<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String number = request.getParameter("number");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	주소에 강제로 넘겨준값:<%=name %><br>
	주소에 강제로 넘겨준값:<%=number %>
	
</body>
</html>