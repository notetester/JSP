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

        <title>BBS Test</title>

</head>
<body>
<%@ include file="/include/header.jsp" %>
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 상세보기<small>(디자인이궁금하세요?)</small></h2>

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
                </div>
            </div>
        </div>


        </section>
<%@ include file="/include/footer.jsp" %>
</body>
</html>