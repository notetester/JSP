<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//특정 쿠키 확인하기
	Cookie[] cookies = request.getCookies();
	
	String id = "";
	if(cookies != null) {
		
		for(Cookie c : cookies) {
			
			if(c.getName().equals("user_id") ) {
				id = c.getValue(); //쿠키값을 꺼냄
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	user_id쿠키값:<%=id %>


</body>
</html>