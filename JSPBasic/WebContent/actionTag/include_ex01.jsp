<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>1번 페이지</h2>
	
	<%@ include file="include_ex02.jsp" %>
	<%-- 
	<jsp:include page="include_ex02.jsp"/>
	 --%>
	합계:<%=total %>
	
	
	<%--
		디렉티브태그의 include는 단순 html영역만 가져올 수 있습니다.
		지시자의 include는 페이지에서 공유할 변수도 가져올 수 있습니다.
	
	 --%>
	
	
	
	
	
	
	
	
</body>
</html>