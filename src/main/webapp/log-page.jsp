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
        <div class="border rounded-3 p-4 mb-4" role="button" onclick="location.href='/blog/view?id=${board.post_id}'">
          <div class="d-flex gap-2 justify-content-start align-items-center">
            <span class="h4">${board.title}</span>
            <c:if test="${board.is_private == true}">
              <i class="bi bi-lock-fill text-secondary"></i>
            </c:if>

          </div>

          <p>${board.content}</p>
          <div>
            <p>${board.date}</p>
            <span>${board.running_distance}km</span>
            <span> · </span>
            <span id="runningTime_${board.post_id}"></span>
          </div>
        </div>
        <script>
            let start_time_${board.post_id} = "${board.start_time}";
            let end_time_${board.post_id} = "${board.end_time}";
            if(start_time_${board.post_id} != "" && end_time_${board.post_id} != "") {
                document.querySelector("#runningTime_${board.post_id}").innerHTML = getRunningTime(start_time_${board.post_id}, end_time_${board.post_id});
            }
        </script>
      </c:forEach>
  </div>
      <div class="col-6">
        <button class="w-100 btn btn-primary mb-4 py-3 fs-5" onclick="location.href='/blog/write'">글쓰기</button>
        <div class="border rounded-3 p-4 h-50">대시보드</div>
      </div>
    </c:if>

</div>
</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
