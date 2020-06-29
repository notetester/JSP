<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/custom.css">
		<script src="js/kakao.js"></script>
        <title>게시글 상세보기</title>

</head>
<body>
<%@ include file="/include/header.jsp" %>
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 상세보기</h2>

                    <form action="">
                        <div class="form-group">
                            <label>등록일</label>
                            <input type="text" class="form-control" id="regdate" name="regdate" value="${vo.regdate}" readonly disabled>
                        </div>
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" class="form-control" id="bno" name="bno" value="${vo.bno}" readonly disabled>
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" class="form-control" id="writer" name="writer" placeholder="자유" value="${vo.writer}" readonly disabled>
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="자유" value="${vo.title}" readonly disabled>
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="5" id="content" name="content" readonly disabled>${vo.content}</textarea>
                        </div>
                        
                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href='list.board'">목록</button>
                            <button type="button" class="btn btn-info" onclick="location.href='modify.board?bno=${vo.bno}'">수정</button>
                        </div>

                    </form>
                    <div style="text-align: center;">
                    	<strong>공유하기</strong><br>
                    	<a id="kakao-link-btn" href="javascript:kakaoLink()"><img src="images/kakao.png" alt="카카오톡 공유" width="30px" height="30px"></a>
				        <a id="kakao-story-btn" href="javascript:kakaostoryLink()"><img src="images/kakaostory.png" alt="카카오스토리 공유" width="30px" height="30px"></a>
				        <a id="facebook-btn" href="javascript:facebookLink()"><img src="images/facebook.jpg" alt="페이스북 공유" width="30px" height="30px"></a>
				        <a id="twitter-btn" href="javascript:twitterLink()"><img src="images/twitter.jpg" alt="트위터 공유" width="30px" height="30px"></a>
				        <a id="URL-btn" href="javascript:URLLink()"><img src="images/URL.png" alt="URL 공유" width="30px" height="30px"></a>
                    </div>
                </div>
            </div>
        </div>


        </section>
<%@ include file="/include/footer.jsp" %>
	<script>
        Kakao.init('03e93abfc5eb0def6a90ac6ee266241a');
        function kakaoLink() {
          Kakao.Link.sendDefault({
            objectType: 'feed',
            content: {
              title: "${vo.title}",
              description: "${vo.content}",
              imageUrl: document.images[0].src,
              link: {
                mobileWebUrl: document.location.href,
                webUrl: document.location.href,
              },
            },
            buttons: [
              {
                title: '웹으로 보기',
                link: {
                  mobileWebUrl: document.location.href,
                  webUrl: document.location.href,
                }
              }
            ]
          });
        }
        function kakaostoryLink(){
            Kakao.Story.share({
                url: document.location.href,
                text: "${vo.content}",
            });
        }
        function facebookLink(){
            var sharer = "https://www.facebook.com/sharer/sharer.php?u=";
			var content_url = encodeURIComponent(document.location.href);
            window.open(sharer + content_url, 'facebook_share_dialog', 'width=626,height=436');
        }
        function twitterLink(){
            window.open("https://twitter.com/intent/tweet?text="+"${vo.content}"+"&url="+document.location.href);
        }
        function URLLink(){
            alert_content = "해당 글의 주소입니다.\nCtrl+C를 눌러 클립보드로 복사하세요.";
			temp = prompt(alert_content, document.location.href);
        }
    </script>
</body>
</html>