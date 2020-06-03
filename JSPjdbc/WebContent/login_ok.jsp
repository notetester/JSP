<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id"); //id
	String pw = request.getParameter("pw"); //pw
	
	/*
	1. DAO에 login메서드를 만들고 필요한값을 전달합니다.
	2. login메서드 안에서는 DB연결작업을 처리하고 결과를 반환합니다.
	3. 결과에 따라서 성공시 세션을 생성하고 login_welcome페이지로 리다이렉트 처리
	4. 실패시에는 login_fail 페이지로 리다이렉트 처리.
	*/
	
	//1.DAO객체생성
	MemberDAO dao = MemberDAO.getInstance();
	
	int result = dao.login(id, pw);
	
	if(result == 1) { //로그인 성공
		session.setAttribute("user_id", id);
		response.sendRedirect("login_welcome.jsp");
	} else {
		response.sendRedirect("login_fail.jsp");
	}
	
	
	/* 
	//DB연결정보 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "select * from members where id = ? and pw = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. 데이터베이스에서 쿼리문을 전송하고 rs.next()가 있다면, 세션에 아이디 정보를 저장하고 login_welcome으로 리다이렉트
		//2. rs.next()가 없다면, login_fail페이지로 리다이렉트 .
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn = DriverManager.getConnection(url, uid, upw);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		//sql문실행
		rs = pstmt.executeQuery();
		
		//결과에 대한 검사
		if(rs.next()) { //로그인 성공
			session.setAttribute("user_id", id); //로그인 성공의 인증수단
			
			response.sendRedirect("login_welcome.jsp");
		} else { //로그인 실패
			response.sendRedirect("login_fail.jsp");	
		}

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	 */
	
	
	
	
	
	
	
	
%>