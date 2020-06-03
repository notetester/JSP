<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	Random ran = new Random();
	String[] jobs = {"어피치", "라이언", "제이지", "무지", "프로도", "튜브"};
	List<String> list = new ArrayList<>();
%>
<%
	int r = ran.nextInt(6); //0-5랜덤수
	String choose = jobs[r]; //선택된 케릭터
	list.add(choose); //추가

	int count = 0; //중복인원 확인
	for(String e : list) {
		if(e.equals(choose)) {
			count++;
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<p>
		<b>[<%=choose %>]</b> 님이 입장<br>
		현재 같은 카카오 프렌즈는 <%=count %>명입니다.
	</p>
	
	<h2>현재 구성정보</h2>
	<p>
		<%=list.toString() %>(<%=list.size()%>명 참가중)
	</p>
	
	<%
		//리스트의 크기가 10개가 되면 리스트내부의 객체를 전체삭제
		if(list.size() == 10) {
			list.clear();
		}
	%>
	
</body>
</html>
