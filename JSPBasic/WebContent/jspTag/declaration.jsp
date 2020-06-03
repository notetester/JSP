<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언자는 전역의 의미로 사용되며, 메서드의 선언이 가능
	int i = 10;
	String str = "WEB APPLICATION";
	
	public int method(int a , int b) {
		return a + b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	i값:<%=i %><br>
	str값:<%=str %><br>
	메서드호출:<%= method(1,2) %>
	
	
	
		

</body>
</html>