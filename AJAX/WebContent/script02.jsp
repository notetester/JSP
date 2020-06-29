<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" onclick="ajax()">ajax요청</button>
	<script type="text/javascript">
		function ajax() {
			fetch("list.ajax",{
				method:"POST",
				headers:{'Content-Type': 'application/x-www-form-urlencoded'},
				body:"num=1"//문자열형식
			}).then(function(response) {
				return response.json();
			}).then(function(jsonData) {
				console.log(jsonData);
			});
		}
	</script>
</body>
</html>