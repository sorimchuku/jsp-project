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
<main class="container">
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


        <header class="py-5 text-center">
            <h1>댓글</h1>
        </header>


        <div class="row g-5">
            <section class="col-md-3 col-lg-4 order-md-last">
                <aside>
                    <p>Jyc</p>
                    <p><a href="mailto:jyc4648@gmail.com">작성자 이메일 주소</a></p>
                    <p>
                        <time datetime="2022-01-01T00:00:00">2022-01-01</time>
                    </p>
                    <p>#java</p>
                </aside>
            </section>

            <article id="article-content" class="col-md-9 col-lg-8">
                <pre>본문</pre>
            </article>


        </div>
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
    <div class="row g-5">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">이전글</span>
                    </a>
                </li>

                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo; </span>
                        <span class="sr-only">다음글</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
