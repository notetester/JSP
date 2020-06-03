<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//한글처리	

	String name = request.getParameter("name");
	String strCm = request.getParameter("cm");
	String strKg = request.getParameter("kg");
	//문자열->double형 변환
	double cm = Double.parseDouble(strCm);
	double kg = Double.parseDouble(strKg);
	double bmi = kg / (cm /100 * cm/100); 
	
	String BMI = String.format("%.2f", bmi);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>결과</h2>
	이름:<%=name %><br>
	신장:<%=cm %><br>
	몸무게:<%=kg %><br>
	BMI:<%=bmi %><br>
	
	<% if(bmi >= 25) { %>
		<b>과체중 입니다</b>
	<% } else if(bmi <= 18) { %>
		<b>저체중 입니다</b>	
	<% } else { %>
		<b>정상 입니다</b>			
	<% } %>
	





</body>
</html>