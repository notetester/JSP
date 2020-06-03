<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리중</title>
</head>
<body>
<%
	/*
	1. DAO 연동 후에 login()메서드로 아이디, 비밀번호가 맞는지 검증합니다.
	2. login() 메서드가 0을 반환하면 "현재 비밀번호를 확인하세요"를 출력하고 뒤로가기
	3. login() 메서드가 1을 반환하면 delete() 메서드를 호출해서 삭제를 진행하면 됩니다.
		삭제 성공시 세션을 전부 지우고 index 페이지로 리다이렉트
		삭제 실패시 마이 페이지로 리다이렉트
	*/
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	UserDAO dao=UserDAO.getInstance();
	int result = dao.login(id, pw);
	if(result == 1) {
		int result2 = dao.delete(id);
		if(result2==1){
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			response.sendRedirect("user_mypage.jsp");
		}
	} else {
		
%>
	<script>
		alert("현재 비밀번호를 확인하세요");	
		history.go(-1);
	</script>
<%		
		
	}

%>
회원 탈퇴 처리중
</body>
</html>