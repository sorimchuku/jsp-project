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
  <title>freeboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/board.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="layout/header.jsp"%>
<main>

  <div class="row">
    <table class="table" id="article-table">
      <thead>
      <tr>
        <th class="number">#</th>
        <th class="title col-6"><a>제목</a></th>
        <th class="user-id"><a>작성자</a></th>
        <th class="created-at"><a>작성일</a></th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>1</td>
        <td class="title"><a>첫글</a></td>
        <td class="user-id">Uno</td>
        <td class="created-at">
          <time>2022-01-01</time>
        </td>
      </tr>
      <tr>
        <td>2</td>
        <td>두번째글</td>
        <td>Uno</td>
        <td>
          <time>2022-01-02</time>
        </td>
      </tr>
      <tr>
        <td>3</td>
        <td>세번째글</td>
        <td>Uno</td>
        <td>
          <time>2022-01-03</time>
        </td>
      </tr>
      </tbody>
    </table>
  </div>

  <div class="row">
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
      <a class="btn btn-primary me-md-2" role="button" id="write-article">글쓰기</a>
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

</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
