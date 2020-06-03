<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 폼값을 받아서 평균을 구합니다.
	평균이 60점 이상이면 score_quiz03으로 이동해서
		~~님 평균은 xx점 합격입니다 를 출력
	평균이 60점 이하라면 score_quiz04으로 이동해서
		~~님 평균은 xx점 불합격입니다 를 출력
		
	조건: 세션을 사용하지 않습니다.		
	*/
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String sKor = request.getParameter("kor");
	String sEng = request.getParameter("eng");
	String sMath = request.getParameter("math");
	
	//형변환
	int kor = Integer.parseInt(sKor);
	int eng = Integer.parseInt(sEng);
	int math = Integer.parseInt(sMath);
	double avg = (kor + eng + math) / 3.0;
	
	//request에 강제로 저장
	request.setAttribute("name", name);
	request.setAttribute("avg", avg);
	if(avg >= 60) {
		
		request.getRequestDispatcher("score_quiz03.jsp").forward(request, response);
	} else {
		request.getRequestDispatcher("score_quiz04.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
%>
