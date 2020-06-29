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
			fetch("test.ajax",{
		        method: 'POST',
		        headers: {
		        	'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: "id=kkk&pw=1234"
		    }).then(function(response) {
				console.log(response);
				return response.text();
			}).then(function(text){
				console.log(text);
			});
		}
	</script>
</body>
</html>