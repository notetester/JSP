<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin") && pw.equals("1234")) {
		response.sendRedirect("quiz02.jsp");
	} else {
		response.sendRedirect("quiz01.jsp");
	}

%>