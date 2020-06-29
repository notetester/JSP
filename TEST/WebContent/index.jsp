<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/custom.css">
        <title>메인 페이지</title>
        
           
        <!--메인만 적용되는 css영역-->   
        <style>
            body {
                background-image: url(images/main.jpg);
                background-repeat: no-repeat;
                background-size: cover
            }
        </style>
    </head>

    <body>
<%@ include file="/include/header.jsp" %>
    <section>
    
    <div class="container" id="mainCon">
        <div class="jumbotron" id="jbDiv">
            <div class="container" id="introArea">
                <h1>게시판 사이트</h1>
                <p>누구나 자유롭게 글을 적으셔도 됩니다.</p>

            </div>

        </div>
        
        <div class="col-md-6 col-xs-12" style="padding: 0px 0px;">
            <h2 style="color:black">최근 게시물</h2>
            <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                <thead>
                    <tr>
                        <th style="background-color: #9DCAFF; text-align: center;">번호</th>
                        <th style="background-color: #9DCAFF; text-align: center;">제목</th>
                        <th style="background-color: #9DCAFF; text-align: center;">작성자</th>
                        <th style="background-color: #9DCAFF; text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vo" items="${list}">
                    <tr>
                        <td>${vo.bno}</td>
                        <td><a href="content.board?bno=${vo.bno}">${vo.title}</a></td>
                        <td>${vo.writer}</td>
                        <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd hh:mm"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
    </div>
    </section>
<%@ include file="/include/footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    </body>
    
    

</html>
