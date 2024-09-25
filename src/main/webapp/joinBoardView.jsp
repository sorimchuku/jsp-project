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
  <title>team</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
<script>
    function openModal(mode) {
        document.querySelector("#hidden_modal_mode").value = mode;
        const myModal = new bootstrap.Modal('#staticBackdrop');
        myModal.show();
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
        <h1 class="display-8 fw-bolder text-white mb-2">모집 게시판</h1>
      </div>
    </div>
  </div>
</header>
<main>
  <div class="container px-5 my-5">
    <div class="border-bottom px-4 mb-4 d-flex justify-content-between align-items-center">
      <span class="h4 fw-bold">모집 게시판 상세페이지</span>
      <div class="d-flex justify-content-center gap-3 my-4">
        <div class="btn-group">
          <button class="btn btn-outline-primary" onclick="location.href='/team/write'">글쓰기</button>
          <button class="btn btn-outline-secondary" onclick="location.href='/team/edit?id=${board.post_id}'">수정</button>
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

      <div class="border rounded-2 p-5 mb-4">
        <h5 class="mb-4">모집 조건</h5>
        <div class="row">
          <div class="col my-1">
            <div class="input-group flex-nowrap">
              <span class="input-group-text">모집 지역</span>
              <span class="form-control text-nowrap">${board.location}</span>
            </div>
          </div>
          <div class="col  my-1">
            <div class="input-group flex-nowrap">
              <span class="input-group-text">모집 인원</span>
              <span class="form-control text-nowrap">${board.member_num}</span>
              <span class="input-group-text">명</span>
            </div>
          </div>
        </div>
      </div>

      <div class="h-25 w-100 p-4 border-bottom">${board.content}</div>
      <div class="row m-4">
        <div class="d-flex justify-content-center">
          <div class="btn-group col-auto ms-auto" role="group" aria-label="Basic outlined example">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/team'">목록</button>
          </div>
          <button class="btn btn-primary col-auto ms-auto" onclick="location.href='/team/write'">글쓰기</button>
        </div>

      </div>
    </c:if>

  </div>
</main>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-6" id="staticBackdropLabel">개인 기록 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-4">
        <input type="hidden" id="hidden_modal_mode">
        <h5>게시글을 삭제하시겠습니까?</h5>
        <span id="modal_result"></span>
      </div>
      <div class="modal-footer justify-content-center">
        <button class="btn btn-danger" onclick="location.href='/team/delete?id=${board.post_id}'">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<%@include file="layout/footer.jsp"%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
