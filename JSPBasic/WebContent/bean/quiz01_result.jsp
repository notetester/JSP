<%@page import="com.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	아이디:<%=m.getId() %><br>
	이름:<%=m.getName() %><br>
	주소:<%=m.getAddress() %><br>
	점수합계:<%=m.getSum() %><br>
	점수평균:<%=m.getAvg() %><br>


</body>
</html>