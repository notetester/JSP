<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] arr = request.getCookies();

	String s = "";
	if(arr !=null) {
		
		for(Cookie c : arr) {
			if(c.getName().equals("show") ) {
				s = c.getValue();
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
	show쿠키생성시간:<%=s %>
</body>
</html>