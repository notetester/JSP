<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인증이 없는 사람은 접근하지 못하도록 처리
	if(session.getAttribute("authYN") == null) {
		response.sendRedirect("auth.jsp");
	}
	
	//화면에 들어왔을 때 app좌석정보가 있다면, 정보를 얻어옵니다.
	List<String> list = new ArrayList<>();
	if(application.getAttribute("list") != null) {
		list = (List<String>)application.getAttribute("list");
	}
	
	System.out.println(request.getRemoteAddr());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 태그를 사용하지 못하도록 처리하는 옵션 disabled -->
	<div align="center">
		<h2>영화 좌석 예약</h2>
		<h4>예약할 좌석을 체크한 후 예약 버튼을 클릭하세요.</h4>
		<hr>


		<form action="reserve_ok.jsp" method="post">
			<b>좌석배치도</b>
			
			<br>&nbsp;&nbsp;
			<% for(char c = 'A'; c <= 'Z'; c++) { %>
				<small><%=c %></small>&nbsp;&nbsp;
			<% } %>
			<br>
			
			<% for(int i = 1; i <= 6; i++) { %>
				<%=i %>
				<% for(char c= 'A'; c <= 'Z'; c++) { %>
					
					<% if(list.contains(c + "-" + i) ) { %>
					<input type="checkbox" name="seat" value="<%=c %>-<%=i %>" disabled>
					<% } else { %>
					<input type="checkbox" name="seat" value="<%=c %>-<%=i %>">
					<% } %>
					
				<% } %>
				
				
				<%= i == 3 ? "<br>": "" %>
				<br>	
			<% } %>
			
			<br>
			<input type="submit" value="예약">
			<input type="reset" value="초기화">
			
		</form>
	</div>
	
	
	
</body>
</html>