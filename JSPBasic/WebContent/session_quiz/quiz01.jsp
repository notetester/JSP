<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		.center {
			border: 1px solid #777;
			width:172px;
			margin: 0 auto;
		}
		
		h2 {
			text-align: center;
		}
		
	</style>

</head>
<body>

	<div class="center">
		<h2>로그인</h2>
		<form action="quiz01_ok.jsp" method="post">
			<input type="text" name="id" placeholder="아이디"><br>
			<input type="password" name="pw" placeholder="비밀번호"><br>
			<input type="submit" value="로그인" class="center"><br>
		</form>
	</div>

</body>
</html>