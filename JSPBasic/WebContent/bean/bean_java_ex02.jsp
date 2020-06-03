<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	//빈을 사용한다는 것은 객체를 하용하는것과 동일한 의미
	User user = new User();
	user.setName(name);
	user.setEmail(email);
	//사용할 값을 저장
	request.setAttribute("user", user);
	
	//자바의 포워드 이동
	request.getRequestDispatcher("bean_java_ex03.jsp").forward(request, response);
	
	
	
	
%>