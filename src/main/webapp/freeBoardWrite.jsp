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
<!-- Header-->
<header class="bg-dark py-4">
    <div class="container px-5">
        <div class=" align-items-center justify-content-start">
            <div class="text-xl-start">
                <h1 class="display-8 fw-bolder text-white mb-2">자유 게시판 글쓰기</h1>
            </div>
        </div>
    </div>
</header>
<main class="container">
    <div class="row p-5">
        <c:if test="${sessionScope.user == null}">
        <div class="border rounded-3 w-75 p-4 py-5 mx-auto d-flex flex-column justify-content-center align-items-center">
            <h5 class="text-center mb-4">로그인이 필요합니다.</h5>
            <button type="button" class="btn btn-primary" onclick="location.href='/'">메인으로</button>
        </div>
        </c:if>

        <c:if test="${sessionScope.user != null}">
            <div id="wrap" align="center">
                <form action="/freeboard/write" method="post" >
                    <div class="input-group input-group-lg mb-4">
                        <input type="text" class="form-control rounded-2" placeholder="제목" aria-label="title" name="title" required>
                        <span class="input-group-text bg-transparent border-0">*필수</span>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">이미지</span>
                        <input type="file" class="form-control" name="img">
                        <input type="submit" class="btn btn-outline-secondary" value="업로드">
                    </div>
                    <textarea class="form-control" rows="15" name="content" placeholder="내용"></textarea>
                    <div class="d-flex justify-content-center gap-3 my-4">
                        <button type="submit" class="btn btn-primary px-3">등록</button>
                        <input type="reset" class="btn btn-secondary px-3" value="다시 작성">
                        <input type="button" value="목록" class="btn btn-secondary px-3" onclick="location.href='/freeboard'">
                    </div>
                </form>
            </div>
        </c:if>

    </div>

    <div class="row 9-5">
        <sectoin>
            <form class="row g-3">

                <div class="col-md-9 col-lg-8">
                    <label for="articleComment" hidden>댓글</label>
                    <textarea class="form-control" id="articleComment" placeholder="댓글 쓰기.." rows="3"
                              required></textarea>
                </div>
                <div class="col-md-3 col-lg-4">
                    <label for="comment-submit" hidden>댓글 쓰기</label>
                    <button class="btn btn-primary" id="comment-submit" type="submit">쓰기</button>
                </div>

            </form>

            <ul id="article-comments" class="row col-md-10 col-lg-8 pt-3">
                <li>
                    <form>
                        <input hidden class="article-id">
                        <div class="row">
                            <div class="row col-md-10 col-lg-9">
                                <strong>Jyc</strong>
                                <small>
                                    <time>2022-01-01</time>
                                </small>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                    Lorem ipsum dolor sit amet
                                </p>
                            </div>
                        </div>
                    </form>
                </li>
                <li>
                    <form>
                        <input hidden class="article-id">
                        <div class="row">
                            <div class="row col-md-10 col-lg-9">
                                <strong>Jyc</strong>
                                <small>
                                    <time>2022-01-01</time>
                                </small>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                    Lorem ipsum dolor sit amet
                                </p>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>

        </sectoin>
    </div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
