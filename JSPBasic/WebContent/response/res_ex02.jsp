<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		 .wrap {
		 	display: flex;
		 	align-content: center; /*세로 가운데정렬 */
		 	justify-content: center; /* 가로 가운데 정렬 */
		 }
		 .item {
		 	max-width: 50%;
		 }
		 
		 .btn {
		 	background-color:aqua;
		 	width: 60px;
		 	height: 50px;
		 }
	</style>
		
</head>
<body>
	
	<!-- 
	1.css를 사용하는 대표적인 방법으로 인라인시트, 내부스타일시트, 외부스타일시트 방법이 있습니다.
	2.내부스타일 시트방법은 head태그에 style태그를 써서 css를 작성하고 태그에서 선택자를 통해서 css를 지정
	 -->
	
	<div class="wrap">
		<div class="item">
		<h2>리다이렉트 로그인</h2>
		<form action="res_ex02_result.jsp" method="post">
			<table border="1">
				<tr>
					<td><input type="text" name="id" placeholder="아이디"></td>
					<td rowspan="2"><input type="submit" value="로그인" class="btn"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" placeholder="비밀번호"></td>

				</tr>						
			</table>
		</form>
		</div>	
	</div>

	
	
</body>
</html>