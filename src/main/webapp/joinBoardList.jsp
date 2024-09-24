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
<main>
<div class="row p-5">
  <div class="row p5">
    <h2 align="center">모집 게시판</h2>
    <table class="table table-striped table-sm">
      <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">제목</th>
        <th scope="col">작성자</th>
        <th scope="col">작성일</th>
      </tr>
      </thead>

      <tbody>
      <c:forEach var="board" items="${boardList}">
            <tr>
              <td>${board.post_id}</td>
              <td>
                <a href="/team/view?id=${board.post_id}">
                    ${board.title}
                  <br>인원|${board.member_num}명</br>
                </a>
              </td>
              <td>${board.nickname}</td>
              <td>${board.date}</td>
            </tr>
      </c:forEach>
      </tbody>

    </table>
  </div>

  <button type="button" onclick="location.href='/team/write'">글쓰기</button>

</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
