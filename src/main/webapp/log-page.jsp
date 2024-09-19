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
  <c:if test="${sessionScope.user == null}">
    <div class="border rounded-3 w-75 p-4 py-5 mx-auto d-flex flex-column justify-content-center align-items-center">
      <h5 class="text-center mb-4">로그인이 필요합니다.</h5>
      <button type="button" class="btn btn-primary" onclick="location.href='/'">메인으로</button>
    </div>
  </c:if>

    <c:if test="${boardList != null}">
  <div class="col-6">
      <c:forEach var="board" items="${boardList}">
        <div class="border rounded-3 p-4 mb-4">
          <h4>${board.title}</h4>
          <p>${board.content}</p>
          <div>
            <span>${board.date}</span>
            <span>${board.running_distance}</span>
            <span>${board.running_time}</span>
          </div>
        </div>
      </c:forEach>
  </div>
      <div class="col-6">
        <div class="border rounded-3 p-4 h-50">대시보드</div>
      </div>
    </c:if>


</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
