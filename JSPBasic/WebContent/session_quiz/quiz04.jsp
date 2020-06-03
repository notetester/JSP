<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//장바구니 결과
	
	ArrayList<HashMap<String, String>> list = null;
	int money = 0; //장바구니 합계
	if(session.getAttribute("items") != null ) { //세션에 items가 있다면
		list = (ArrayList<HashMap<String, String>>)session.getAttribute("items");
	
		for(HashMap<String, String> map  : list) {
			
			 money  += Integer.parseInt( map.get("count") )  * Integer.parseInt( map.get("price"));   
			
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

	<div class="center">
		<table border = "1">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>가격</td>
				<td>수량</td>
			</tr>
			
			<% if(session.getAttribute("items") != null) { %>
			
			<% for(int i = 0; i < list.size(); i++) { %>
			<tr>
				<td><%=list.get(i).get("num") %></td>
				<td><%=list.get(i).get("item") %></td>
				<td><%=list.get(i).get("price") %></td>
				<td><%=list.get(i).get("count") %></td>
			</tr>
			<% }%>
			<tr>	
				<td colspan="4">총금액:<%=money %></td>
			<tr>
			<% } else { %>
			<tr>	
				<td colspan="4">장바구니가 비었습니다</td>
			<tr>	
			<% } %>
		</table>
		
		<a href="quiz02.jsp">계속 쇼핑하기</a>
		
		
		
	</div>








</body>
</html>