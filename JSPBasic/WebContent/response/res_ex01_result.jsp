<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//한글처리
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	//age에 따라 다른 페이지를 보여주고 싶다면?
	int result = Integer.parseInt(age);		
	
	if(result >= 20) {
		response.sendRedirect("res_ex01_ok.jsp");
	} else {
		response.sendRedirect("res_ex01_no.jsp");		
	}
%>
