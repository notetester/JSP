<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String now = sdf.format(date);
	
	//리스트
	List<String> list = new ArrayList<>();
	list.add("홍길동");
	list.add("이순신");
	list.add("신사임당");
	
	//맵
	Map<Integer, String> map = new HashMap<>();
	map.put(1, "홍길동");
	map.put(2, "이순신");
	
	//셋
	Set<Integer> set = new HashSet<>();
	set.add(1);
	set.add(2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	지금:<%=now %><br>	
	리스트:<%=list.toString() %><br>
	맵:<%=map.toString() %><br>
	셋:<%=set.toString() %>
	
	<h2>리스트 맵 셋 요소 출력</h2>
	<% for(String s : list) { %>
		<%=s %>
	<% }%>
	
	<hr>
	<% Set<Entry<Integer, String>> iter = map.entrySet(); %>
	<% for(Entry<Integer, String> i : iter ) { %>
		<%=i.getKey() %>
		<%=i.getValue() %>
	<% } %>	
	<hr>
	
		
	
	
	
</body>
</html>