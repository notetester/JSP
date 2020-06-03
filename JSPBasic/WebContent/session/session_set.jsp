<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
	세션은 서버와 정보를 유지하기 위해 사용하는 내장객체
	setAttribute("이름", 값) 으로 저장합니다.
	*/

	session.setAttribute("user_id", "xxx123");
	session.setAttribute("user_name", "홍길순");
	//세션유지시간을 변경
	session.setMaxInactiveInterval(3600); //1시간 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="session_get.jsp">세션값 확인하기</a>



</body>
</html>