<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키검사
	Cookie[] cookies = request.getCookies();
	
	String id = "";
	if(cookies != null) {
		
		for(Cookie c : cookies) {
			
			if(c.getName().equals("user_id")) {
				id = c.getValue();
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
	
	<h2><%=id %>님이 로그인 중입니다</h2>
	
</body>
</html>