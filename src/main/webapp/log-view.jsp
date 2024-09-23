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
  <title>Blog</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
  <script>
    window.onload = function () {
        let start_time = "${board.start_time}";
        let end_time = "${board.end_time}";
        if(start_time != null && end_time != null) {
            let timestr = getRunningTime(start_time, end_time);
            document.querySelector("#running_time").value = timestr;
        }
    }
  </script>
</head>
<body>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">개인 기록</h1>
      </div>
    </div>
  </div>
</header>
<main>
  <div class="container px-5 my-5">
    <div class="border-bottom px-4 mb-4 d-flex justify-content-between align-items-center">
      <span class="h4 fw-bold">개인 기록</span>
      <div class="d-flex justify-content-center gap-3 my-4">
        <button class="btn btn-light px-3" onclick="location.href='/blog/edit?id=${board.post_id}'">수정</button>
        <button class="btn btn-primary px-3" onclick="location.href='/blog/write'">글쓰기</button>
      </div>
    </div>
    <c:if test="${board != null}">
      <div class="d-flex justify-content-between mb-4 px-4">
        <h4 class="">${board.title}
          <c:if test="${board.is_private == true}">
            <i class="bi bi-lock-fill text-secondary h5"></i>
          </c:if>
          </h4>
        <span>${board.date}</span>
      </div>
      <div class="border rounded-2 p-5 mb-4">
        <h5 class="mb-4">오늘의 기록</h5>
        <div class="row">
          <div class="col-auto">
            <div class="input-group">
              <span class="input-group-text">달린 거리</span>
              <input type="text" readonly class="form-control text-end" value="${board.running_distance}">
              <span class="input-group-text">km</span>
            </div>
          </div>
          <div class="col-auto">
            <div class="input-group col col-auto">
              <span class="input-group-text">달린 시간</span>
              <input type="text" readonly class="form-control" id="running_time" value="">
            </div>
          </div>
        </div>
      </div>
      <div class="h-25 w-100 p-4 border-bottom">${board.content}</div>
      <div class="d-flex justify-content-center m-4">
        <div class="btn-group" role="group" aria-label="Basic outlined example">
          <button type="button" class="btn btn-outline-primary">이전글</button>
          <button type="button" class="btn btn-primary" onclick="location.href='/blog'">목록</button>
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
