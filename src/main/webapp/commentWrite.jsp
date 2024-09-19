<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>러닝 커뮤니티</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="index.html">홈</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="about.html">개인 기록</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">모집 게시판</a></li>
                    <li class="nav-item"><a class="nav-link" href="freeBoardWrite.jsp">자유게시판</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq.html">회원가입</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-5">
            <div class=" align-items-center justify-content-start">
                    <div class="text-xl-start">
                        <h1 class="display-8 fw-bolder text-white mb-2">Running Community</h1>
                    </div>
            </div>
        </div>
    </header>
    <!-- Features section-->
    <div id="wrap" align="center">
        <h1>댓글</h1>
        <form action="../webapp/commentWrite" method="post" enctype="multipart/form-data">
            <table>

                <tr>
                    <th>내용</th>
                    <td><textarea cols="70" rows="15" name="content"></textarea></td>
                </tr>

                <tr>
                <th>이미지</th>
                <td><input type="file" name="img"><input type="submit" value="upload"></td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="등록" onclick="return boardCheck()">
            <input type="reset" value="다시 작성">
            <input type="button" value="목록" onclick="location.href='/board/list'">
        </form>
    </div>
</main>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
            <div class="col-auto">
                <a class="link-light small" href="#!">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Contact</a>
            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>