<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-19
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Blog</title>
</head>
<body>
<%@include file="layout/header.jsp"%>
<main>
    <div class="row p-5">
        <c:if test="${sessionScope.user == null}">
        <div class="border rounded-3 w-75 p-4 py-5 mx-auto d-flex flex-column justify-content-center align-items-center">
            <h5 class="text-center mb-4">로그인이 필요합니다.</h5>
            <button type="button" class="btn btn-primary" onclick="location.href='/'">메인으로</button>
        </div>
        </c:if>

        <div id="wrap" align="center">
            <h1>자유 게시판 글쓰기</h1>
            <form action="../webapp/freeBoardWrite" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" size="70" name="title"> * 필수</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea cols="70" rows="15" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td><input type="file" name="img"><input type="submit" value="upload"></td>
                    </tr>
                </table>
                <br><br>
                <input type="submit" value="등록" onclick="return boardCheck()">
                <input type="reset" value="다시 작성">
                <input type="button" value="목록" onclick="location.href='/board/list'">
            </form>
        </div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
