<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <title>개인 기록 - 수정</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
<script>
    window.onload = function () {
        if ("${board.is_private}" === "true") {
            document.querySelector("#is_private").checked = true;
            privateCheck();
        }
    }

    function privateCheck() {
        if( document.querySelector("#is_private").checked === true ) {
            document.querySelector("#hiddenCheck").value = "true"
        }
        else
        {
            document.querySelector("#hiddenCheck").value = "false";
        }
    }
</script>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">개인 기록 수정</h1>
      </div>
    </div>
  </div>
</header>
<main>
  <div class="container px-5 my-5">
    <div class="border-bottom p-4 mb-4">
      <span class="h4 fw-bold">개인 기록 :: </span>
    </div>
    <form action="/blog/edit" method="post">
      <div class="input-group input-group-lg mb-4">
        <input type="text" class="form-control" placeholder="제목" aria-label="title" name="title" value="${board.title}">
        <input type="hidden" value="${board.post_id}" name="id">
        <div class="input-group-text">
          비밀글
          <input class="form-check-input mt-0 ms-2" type="checkbox" name="" id="is_private" onchange="privateCheck()">
          <input type="hidden" name="is_private" id="hiddenCheck" value="false">
        </div>
      </div>

      <div class="border rounded-2 p-5 mb-4">
        <h5 class="mb-4">오늘의 기록</h5>
        <div class="input-group  mb-3">
          <span class="input-group-text">달린 거리</span>
          <input type="number" class="form-control" value="${board.running_distance}" name="distance">
          <span class="input-group-text">km</span>
        </div>
        <div class="input-group">
          <span class="input-group-text">달린 시간</span>
          <input type="datetime-local" class="form-control" value="${board.start_time}" name="start_time">
          <span class="input-group-text">~</span>
          <input type="datetime-local" class="form-control" value="${board.end_time}" name="end_time">
        </div>
      </div>
      <textarea class="form-control h-25" name="content" placeholder="메모">${board.content}</textarea>
      <div class="d-flex justify-content-center gap-3 my-4">
        <button type="submit" class="btn btn-primary px-3 btn" onclick="return checkLogWrite()">등록</button>
        <input type="reset" class="btn btn-secondary px-3" value="다시 작성">
        <a class="btn btn-secondary px-3 btn" href="/blog">목록</a>
      </div>
    </form>
  </div>
</main>
<%@include file="layout/footer.jsp"%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
