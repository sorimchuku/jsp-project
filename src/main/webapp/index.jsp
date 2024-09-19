<%@ page import="com.busanit.jspproject.dto.UserVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>러닝 커뮤니티</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="/">홈</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item h5"><a class="nav-link" href="/blog">개인 기록</a></li>
                    <li class="nav-item h5"><a class="nav-link" href="/team">모집 게시판</a></li>
                    <li class="nav-item h5"><a class="nav-link" href="/freeboard">자유게시판</a></li>
                    <c:if test="${sessionScope.user == null}">
                        <li class="nav-item h5"><a class="nav-link" href="/register">회원가입</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                        <li class="nav-item h5"><a class="nav-link" href="/logout.jsp">로그아웃</a></li>
                        <li class="nav-item h5"><a class="nav-link" href="/mypage">마이페이지</a></li>
                    </c:if>

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
    <section class="py-5" id="features">
        <div class="container px-5 my-5">
            <div class="row gx-5">
                <div class="col-xl-4 mb-5 mb-lg-0 ">
                    <div class="border rounded-3 p-5">
                        <c:if test="${user == null}" >
                            <form action="/login" method="post">
                                <h3>로그인</h3>
                                <div class="row flex-nowrap g-2 align-items-center my-2">
                                    <div class="col-auto">
                                        <label for="inputId" class="col-form-label">아이디</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="inputId" class="form-control" name="userID">
                                    </div>
                                </div>
                                <div class="row flex-nowrap g-2 align-items-center">
                                    <div class="col-auto">
                                        <label for="inputPassword6" class="col-form-label my-2">비밀번호</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="password" name="userPW" id="inputPassword6" class="form-control">
                                    </div>
                                </div>
                                <c:if test="${loginError == true}">
                                    <div class="row flex-nowrap g-2 align-items-center">
                                        <span>아이디 또는 비밀번호가 틀렸습니다.</span>
                                    </div>
                                </c:if>
                                <div class="row flex-nowrap g-2 align-items-center justify-content-end my-2">
                                    <div class="col-auto">
                                        <input type="submit" class="btn btn-primary mb-3" value="로그인" onclick="return checkLogin()">
                                    </div>
                                    <div class="col-auto">
                                        <input type="button" class="btn btn-secondary mb-3" value="회원가입" onclick="location.href='/register'">
                                    </div>
                                </div>
                                </p>
                            </form>
                        </c:if>
                        <c:if test="${user != null}">
                            <p>로그인 성공</p>
                            <p>아이디 : ${user.userID}</p>
                            <p>닉네임 : ${user.nickname}</p>
                        </c:if>
                    </div>

                </div>
                <div class="col-lg-8">
                    게시글 미리보기 섹션
                </div>

            </div>
        </div>
    </section>


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