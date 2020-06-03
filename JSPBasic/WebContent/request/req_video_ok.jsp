<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String course = request.getParameter("course");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% if(course == null) { %>
		잘못들어왔는데요?
		
	<% } else if(course.equals("java")) { %>
	<div align="center">
		<h2>강의영상</h2>
		<hr>
		<p>자바 수업소개</p>		
		
		<iframe width="560" height="315" src="https://www.youtube.com/embed/SXX2cnmL0Ng" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } else if(course.equals("script")) {%>
	<div align="center">
		<h2>강의영상</h2>
		<hr>
		<p>자바스크립트 수업 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/nOTpuof2YG8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		
	</div>
	<% } else if(course.equals("oracle")) { %>
	<div align="center">
		<h2>강의영상</h2>
		<hr>
		<p>오라클 설치과정</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/DEVR_R2Hva0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } %>	
	
	
	
</body>
</html>