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
  <title>모집 게시판</title>
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
        <h1 class="display-8 fw-bolder text-white mb-2">모집 게시판</h1>
      </div>
    </div>
  </div>
</header>
<main>
<div class="container text-center">
  <div class="p-5">
    <table class="table table-hover">
      <thead>
        <th scope="col">#</th>
        <th colspan="2" scope="col">제목</th>
        <th scope="col">작성자</th>
        <th scope="col">작성일</th>
      </thead>

      <tbody>
      <c:forEach var="board" items="${boardList}">
            <tr>
              <td>${board.post_id}</td>
              <td colspan="2">
                <a href="/team/view?id=${board.post_id}" class="text-decoration-none">
                  <div class="fs-5 text-black mb-1">
                      ${board.title}
                  </div>
                  <div class="text-secondary mb-1">
                    <span>${board.location}</span>
                    <span> | </span>
                    <span>${board.member_num}명</span>
                  </div>
                </a>
              </td>
              <td>${board.nickname}</td>
              <td>${board.date}</td>
            </tr>
      </c:forEach>
      </tbody>

    </table>

    <button type="button" class="btn btn-primary mx-auto" onclick="location.href='/team/write'">글쓰기</button>
  </div>


</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
