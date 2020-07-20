<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <title>로그인</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <!--login만 적용되는 css-->   
    <style>
        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }

        .join-form {
            margin: 100px auto;
            padding: 20px;
            width: 50%;
            float: none;
            background-color: white;
        }
    </style>
</head>

<body>
<%@ include file="/include/header.jsp" %>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <h2>로그인</h2>
                    
                    
                    <form action="loginForm.user" method="post" name="login_form" id="login_form">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 ">
                        </div>
                        
                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-success btn-block" onclick="location.href='join.user'">회원가입</button>
                        </div>

                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-info btn-block" onclick="check()">로그인</button>
                        </div>
                    </form>
                    <div id="naver_id_login"></div>
                </div>
            </div>
        </div>


    </section>
<%@ include file="/include/footer.jsp" %>
	<script>
		function check() {
			if(document.login_form.id.value == 0) {
				alert('아이디를 적어주세요');
				document.login_form.id.focus();
				return;
			} else if(document.login_form.password.value == 0) {
				alert('비밀번호를 적어주세요');
				document.login_form.password.focus();
				return;
			} else {
				document.login_form.submit();
			}
		}
	
	</script>
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("tJrgytD7CI8ruecZJb6h", "http://118.130.22.161:8181/TEST/callback.html");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://118.130.22.161:8181");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  </script>
</body>

</html>