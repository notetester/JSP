<%@page import="com.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼태그를 처리할 수 있는 빈을 선언합니다.
	2. 폼값을 받아서 평균과 총점을 구합니다.
	3. quiz01_result페이지로 이동해서 
		학생정보와 평균, 총점을 모두 출력하세요.
	
	조건: session (x)
	*/
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String address =request.getParameter("address");
	String kor = request.getParameter("kor");
	String math = request.getParameter("math");
	//숫자로 형변환
	int k = Integer.parseInt(kor);
	int m = Integer.parseInt(math);
	
	int sum = k + m; //합계
	double avg = sum / 2.0; //평균
	
	//객체(빈) 생성
	Member member = new Member(id, pw, name, address, kor, math, sum, avg);
	//request에 강제저장
	request.setAttribute("member", member);
	//포워드 이동
	request.getRequestDispatcher("quiz01_result.jsp").forward(request, response);
	
	
	
	
	

%>