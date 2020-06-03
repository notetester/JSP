<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. id, pw을 받아서 처리합니다.
	2. id가 abc1234이고 비밀번호가 asd123이라면 로그인 성공으로 간주하고 res_ex02_welcome 리다이렉트
	3. id가 틀린경우 res_ex02_id_fail페이지로 리다이렉트, pw가 틀린경우 res_ex02_pw_fail페이지로 리다이렉트
	*/

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	
	if(id.equals("abc1234") && pw.equals("asd123")) {
		response.sendRedirect("res_ex02_welcome.jsp"); //성공 페이지
	} else if( !id.equals("abc1234") ) {
		
		response.sendRedirect("res_ex02_id_fail.jsp"); //아이디가 틀린경우
		
	} else if( !pw.equals("asd123") ) {
		
		response.sendRedirect("res_ex02_pw_fail.jsp"); //비밀번호 틀린경우
	}
		
	
%>