<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container px-5 d-flex justify-content-between">
    <a class="navbar-brand fw-bolder" href="/">Running Community</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0  text-nowrap">
        <li class="nav-item fs-4"><a class="nav-link" href="/blog">개인 기록</a></li>
        <li class="nav-item fs-4"><a class="nav-link" href="/team">모집 게시판</a></li>
        <li class="nav-item fs-4"><a class="nav-link" href="/freeboard">자유게시판</a></li>
      </ul>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0  text-nowrap">
        <c:if test="${sessionScope.user == null}">
          <li class="nav-item fs-5"><a class="nav-link" href="/">로그인</a></li>
          <li class="nav-item fs-5"><a class="nav-link" href="/register">회원가입</a></li>
        </c:if>
        <c:if test="${sessionScope.user != null}">
          <li class="nav-item fs-5"><a class="nav-link" href="/logout.jsp">로그아웃</a></li>
          <li class="nav-item fs-5"><a class="nav-link" href="/mypage">마이페이지</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

</body>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</html>