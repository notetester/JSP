<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 어떤 내용을 선택하냐에 따라 결과페이지에서는 알맞은 동영상을 보여주도록 처리 -->
	
	<div align="center">
		<table border="1">
			<tr>
				<td>이미지</td>
				<td>강의명</td>
				<td>내용</td>
				<td>일자</td>
			</tr>
			<tr>
				<td>
					<a href="req_video_ok.jsp?course=java">
						<img src="img/java.png" width="100px" alt="자바">
					</a>
				</td>
				<td>자바</td>
				<td>
					<a href="req_video_ok.jsp?course=java">자바의 기본내용을 학습</a></td>
				<td>2020.01.02</td>
			</tr>
			<tr>
				<td>
					<a href="req_video_ok.jsp?course=script">
						<img src="img/javascript.png" width="100px" alt="스크립트">
					</a>		
				</td>
				<td>자바스크립트</td>
				<td><a href="req_video_ok.jsp?course=script">자바스크립트 Basic</a></td>
				<td>2020.02.12</td>
			</tr>
			<tr>
				<td>
					<a href="req_video_ok.jsp?course=oracle">
						<img src="img/oracle.png" width="100px" alt="자바">
					</a>
				</td>
				<td>오라클</td>
				<td><a href="req_video_ok.jsp?course=oracle">오라클문법 학습</a></td>
				<td>2020.03.14</td>
			</tr>
		</table>
	</div>
	

	
</body>
</html>