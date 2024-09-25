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
<%@include file="layout/header.jsp" %>

<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">모집 게시판 글쓰기</h1>
      </div>
    </div>
  </div>
</header>

<main class="container">
  <div class="row p-5 text-center">
    <c:if test="${sessionScope.user == null}">
    <div class="border rounded-3 w-75 p-4 py-5 mx-auto d-flex flex-column justify-content-center align-items-center">
      <h5 class="text-center mb-4">로그인이 필요합니다.</h5>
      <button type="button" class="btn btn-primary" onclick="location.href='/'">메인으로</button>
    </div>
    </c:if>

    <c:if test="${sessionScope.user != null}">
    <div id="wrap" align="center">
      <form action="/team/write" method="post">
        <div class="input-group input-group-lg mb-4">
          <input type="text" class="form-control rounded-2" placeholder="제목" aria-label="title" name="title" required>
          <span class="input-group-text bg-transparent border-0">*필수</span>
        </div>
        <div class="row mb-3">
          <div class="col-auto">
            <div class="input-group ">
              <span class="input-group-text">지역</span>
              <select class="form-select" id="location" name="location">
                <option selected value="">선택하세요</option>
                <%
                  String[] busanDistricts = {"강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"};
                  for (String district : busanDistricts) {
                    out.println("<option value=\"" + district + "\">" + district + "</option>");
                  }
                %>
              </select>
            </div>
          </div>
          <div class="col-auto">
            <div class="input-group col">
              <span class="input-group-text">인원수</span>
              <input type="number" name="member_num" class="form-control">
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <span class="input-group-text">이미지</span>
          <input type="file" class="form-control" name="img">
          <input type="submit" class="btn btn-outline-secondary" value="업로드">
        </div>
        <textarea class="form-control" rows="15" name="content" placeholder="내용"></textarea>

        <div class="d-flex justify-content-center gap-3 my-4">
          <button type="submit" class="btn btn-primary px-3">등록</button>
          <input type="reset" class="btn btn-secondary px-3" value="다시 작성">
          <input type="button" value="목록" class="btn btn-secondary px-3" onclick="location.href='/team'">
        </div>
      </form>
    </div>
    </c:if>

</main>
<%@include file="layout/footer.jsp" %>
</body>
</html>
