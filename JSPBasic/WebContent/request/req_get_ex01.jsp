<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 사용자에게 값을 입력받을 때 form태그를 이용합니다 -->
	<!-- 받은 데이터를 지정된페이지로 전송할 때 form태그에 action속성을 사용합니다 -->
	
	<form action="req_get_ex02.jsp"> 
		
		<h3>회원가입 양식</h3>
		<hr>
		아이디<input type="text" size="10" name="id"  placeholder="8글자"   ><br>
		비밀번호<input type="password" size="10" name="pw" ><br>
		
		<!-- checkbox, radio속성은 반드시 name속성을 통일 시켜서 하나의 그룹으로 묶습니다 -->
		관심분야
		<input type="checkbox" name="inter" value="자바">JAVA
		<input type="checkbox" name="inter" value="JSP">JSP
		<input type="checkbox" name="inter" value="스프링">SPRING
		<input type="checkbox" name="inter" value="스크립트">JavaScript
		
		<br/>
		전공분야
		<input type="radio" name="major" value="경영">경영
		<input type="radio" name="major" value="컴공">컴퓨터공학
		<input type="radio" name="major" value="수학">수학
		<input type="radio" name="major" value="기계공학">기계공학
		
		<br/>
		지역
		<select name="region">
			<option value="서울">서울시</option>
			<option value="경기">경기도</option>
			<option value="인천">인천시</option>
			<option value="부산">부산시</option>
		</select>

		<br/>
		자기소개<br/>
		<textarea rows="5" cols="50" name="intro"></textarea>
		
		<!-- 이름, 닉네임을 추가해서 ex02에서 받아서 출력. -->
		<br>
		이름<input type="text" name="name"><br>
		닉네임<input type="text" name="nick"><br>
		
		
		<br>
		<input type="submit" value="확인">
	
	
	</form>
	
	
</body>
</html>