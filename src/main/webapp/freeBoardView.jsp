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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">


  <title>freeboard</title>
</head>
<body>
<%@include file="layout/header.jsp"%>
<main>
  <div class="row" align="center">
    <h2>자유 게시판 목록</h2>
    <table class="table" id="article-table" width="100%">
      <thead>
      <tr>
        <th class="title col-6"><a>제목</a></th>
        <th class="hashtag col-2"><a>해시태그</a></th>
        <th class="user-id"><a>작성자</a></th>
        <th class="created-at"><a>작성일</a></th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td class="title"><a>첫글</a></td>
        <td class="hashtag">#java</td>
        <td class="user-id">Uno</td>
        <td class="created-at">
          <time>2022-01-01</time>
        </td>
      </tr>
      <tr>
        <td>두번째글</td>
        <td>#spring</td>
        <td>Uno</td>
        <td>
          <time>2022-01-02</time>
        </td>
      </tr>
      <tr>
        <td>세번째글</td>
        <td>#java</td>
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

  <main class="container">
    <header class="py-5 text-center">
      <h1>첫번째 글</h1>
    </header>


    <div class="row g-5">
      <section class="col-md-3 col-lg-4 order-md-last">
        <aside>
          <p>Jyc</p>
          <p><a href="mailto:jyc4648@gmail.com">작성자 이메일 주소</a></p>
          <p>
            <time datetime="2022-01-01T00:00:00">2022-01-01</time>
          </p>
          <p>#java</p>
        </aside>
      </section>

      <article id="article-content" class="col-md-9 col-lg-8">
        <pre>본문</pre>
      </article>


    </div>
    </div>

    <div class="row 9-5">
      <sectoin>
        <form class="row g-3">

          <div class="col-md-9 col-lg-8">
            <label for="articleComment" hidden>댓글</label>
            <textarea class="form-control" id="articleComment" placeholder="댓글 쓰기.." rows="3"
                      required></textarea>
          </div>
          <div class="col-md-3 col-lg-4">
            <label for="comment-submit" hidden>댓글 쓰기</label>
            <button class="btn btn-primary" id="comment-submit" type="submit">쓰기</button>
          </div>

        </form>

        <ul id="article-comments" class="row col-md-10 col-lg-8 pt-3">
          <li>
            <form>
              <input hidden class="article-id">
              <div class="row">
                <div class="row col-md-10 col-lg-9">
                  <strong>Jyc</strong>
                  <small>
                    <time>2022-01-01</time>
                  </small>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                    Lorem ipsum dolor sit amet
                  </p>
                </div>
              </div>
            </form>
          </li>
          <li>
            <form>
              <input hidden class="article-id">
              <div class="row">
                <div class="row col-md-10 col-lg-9">
                  <strong>Jyc</strong>
                  <small>
                    <time>2022-01-01</time>
                  </small>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                    Lorem ipsum dolor sit amet
                  </p>
                </div>
              </div>
            </form>
          </li>
        </ul>

      </sectoin>
    </div>
    <div class="row g-5">
      <nav aria-label="Page navigation">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
              <span class="sr-only">이전글</span>
            </a>
          </li>

          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo; </span>
              <span class="sr-only">다음글</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </main>
<%@include file="layout/footer.jsp"%>
</body>
</html>
