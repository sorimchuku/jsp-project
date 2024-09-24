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
</head>
<body>
<%@include file="layout/header.jsp"%>
<main>
<div class="row p-5">
  <div class="row p5">
    <h2 align="center">자유 게시판</h2>

    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th scope="col" class="list-group-numbered"><a>#</a></th>
        <th scope="col" class="title col-6"><a>제목</a></th>
        <th scope="col" class="user-id"><a>작성자</a></th>
        <th scope="col" class="created-at"><a>작성일</a></th>
      </tr>
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
            </a>
          </td>
          <td>${board.nickname}</td>
          <td>${board.date}</td>
        </tr>
      </c:forEach>
      </tbody>

    </table>
  </div>
  <div class="row">
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
      <a class="btn btn-primary me-md-2" role="button" id="write-article" href="/freeboard/write">글쓰기</a>
    </div>
  </div>

  <div class="row">
    <nav id="pagination" aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
      </ul>
    </nav>
  </div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
