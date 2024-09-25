<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
  <title>freeboard</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />

</head>
<body>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">자유 게시판</h1>
      </div>
    </div>
  </div>
</header>
<main>
  <div class="container px-5 my-5">
    <div class="border-bottom px-4 mb-4 d-flex justify-content-between align-items-center">
      <span class="h4 fw-bold">상세페이지</span>
      <div class="d-flex justify-content-center gap-3 my-4">
        <div class="btn-group">
          <button class="btn btn-outline-secondary" onclick="location.href='/freeboard/edit?id=${board.post_id}'">수정</button>
          <button class="btn btn-outline-danger" onclick="openModal('delete')">삭제</button>
        </div>
      </div>
    </div>

    <c:if test="${board != null}">
      <div class="d-flex justify-content-between mb-4 px-4">
        <h4 class="">${board.title}</h4>
        <div>
          <span>${board.nickname}</span>
          <span> · </span>
          <span>${board.date}</span>
        </div>

      </div>
      <div class="h-25 w-100 p-4 border-bottom">${board.content}</div>
      <div class="row m-4">
        <div class="d-flex justify-content-center">
          <div class="btn-group col-auto ms-auto" role="group" aria-label="Basic outlined example">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/freeboard'">목록</button>
          </div>
          <button class="btn btn-primary col-auto ms-auto" onclick="location.href='/freeboard/write'">글쓰기</button>
        </div>

      </div>
    </c:if>


<%-- 댓글 --%>
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
  </div>
</main>
<%@include file="layout/footer.jsp"%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
