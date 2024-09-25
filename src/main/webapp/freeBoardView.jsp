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
        <button class="btn btn-primary px-3" onclick="location.href='/freeboard/write'">글쓰기</button>
        <button class="btn btn-light px-3" onclick="location.href='/freeboard/edit?id=${board.post_id}'">수정</button>
        <button class="btn btn-light px-3" onclick="location.href='/freeboard/delete?id=${board.post_id}'">삭제</button>
      </div>
    </div>

    <c:if test="${board != null}">

      <div class="d-flex justify-content-between mb-4 px-4">
        <h4 class="">${board.title}</h4>
        <span>${board.date}</span>
      </div>
      <div>
          ${board.title}
      </div>
      <div class="h-25 w-100 p-4 border-bottom">${board.content}</div>
      <div class="d-flex justify-content-center m-4">
        <div class="btn-group" role="group" aria-label="Basic outlined example">
          <button type="button" class="btn btn-outline-primary">이전글</button>
          <button type="button" class="btn btn-primary" onclick="location.href='/freeboard'">목록</button>
          <button type="button" class="btn btn-outline-primary">다음글</button>
        </div>
      </div>
    </c:if>

  </div>
</main>
<%@include file="layout/footer.jsp"%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
