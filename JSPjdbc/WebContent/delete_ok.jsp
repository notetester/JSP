<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 필요한 값을(id)를 얻습니다.
	2. executeUpdate() 구문으로 실행을 시킨 후 탈퇴성공시, 세션을 삭제하고, login페이지로 리다이렉트
	 탈퇴실패시에는 login_welcome페이지로 리다이렉트
	*/
	
	//아이디는 세션에서
	String id = (String)session.getAttribute("user_id");
	
	//DB에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "delete from members where id = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1) { //삭제 성공
			//세션을 삭제.
			session.invalidate();
			response.sendRedirect("login.jsp");
			
		} else { //삭제 실패
			response.sendRedirect("login_welcome.jsp");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	


%>