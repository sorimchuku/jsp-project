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
  <title>자유 게시판</title>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="css/styles.css" rel="stylesheet" />
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
<div class="container text-center">
  <div class="p-5">
    <table class="table table-hover">
      <thead>
      <tr>
        <th scope="col" class="list-group-numbered"><a>#</a></th>
        <th  scope="col" class="title col-6"><a>제목</a></th>
        <th scope="col" class="user-id"><a>작성자</a></th>
        <th scope="col" class="created-at"><a>작성일</a></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="board" items="${boardList}">
        <tr>
          <td>${board.post_id}</td>
          <td >
            <a href="/freeboard/view?id=${board.post_id}" class="text-decoration-none">
              <div class="fs-5 text-black mb-1">
                  ${board.title}
              </div>
            </a>
          </td>
          <td>${board.nickname}</td>
          <td>${board.date}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="row m-4">
      <div class="d-flex justify-content-center">
        <nav id="pagination" aria-label="Page navigation" class="col-auto ms-auto">
          <ul class="pagination justify-content-center">
            <li class="page-item"${pageHandler.currentPage == 1 ?  "disabled" : ""}">
            <a class="page-link" href="/freeboard?currentPage=1">Prev</a>
            </li>
            <c:if test="${pageHandler.showPrev}">
              <li class="page-item">
                <a class="page-link" href="/freeboard?currentPage=${pageHandler.beginPage - 1}">back</a>
              </li>
            </c:if>
            <c:forEach var="i" begin="${pageHandler.beginPage}"
                       end="${pageHandler.endPage}">
              <li class="page-item ${pageHandler.currentPage == i ? "active" : ""}">
                <a class="page-link"
                   href="/freeboard?currentPage=${i}">${i}</a>
              </li>
            </c:forEach>
            <c:if test="${pageHandler.showNext}">
              <li class="page-item">
                <a class="page-link" href="/freeboard?currentPage=${pageHandler.endPage + 1}">next</a>
              </li>
            </c:if>
            <li class="page-item ${pageHandler.currentPage == pageHandler.totalPages ?  "disabled" : ""}">
              <a class="page-link" href="/freeboard?currentPage=${pageHandler.totalPages}">End</a>
            </li>
          </ul>
        </nav>
        <div class="col-auto ms-auto">
          <a class="btn btn-primary " role="button" id="write-article" href="/freeboard/write">글쓰기</a>
        </div>
      </div>
    </div>
  </div>
</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
