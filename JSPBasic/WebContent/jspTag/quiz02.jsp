<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 정수를 저장하는 List를 선언합니다.
	2. 1~45까지 로또번호를 생성하고 리스트에 추가.
	3. 중복되지 않은 숫자의 6개의 로또번호를 저장하면 됩니다.
	4. 화면에 출력
	5. 같은방법으로 Set을 이용해서도 처리
	*/
	Random ran = new Random();
	ArrayList<Integer> list = new ArrayList<>();
	HashSet<Integer> set = new HashSet<>();
	
	//리스트
	while(list.size() < 6) {
		
		int num = ran.nextInt(45) + 1; //랜덤수
		
		if(! list.contains(num) ) {
			list.add(num);
		}
	}
	//set
	while(set.size() < 6) {
		set.add(ran.nextInt(45) + 1);
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	랜덤번호:<%=set.toString() %><br>
	랜덤번호:<%=list.toString() %><br>
	
</body>
</html>