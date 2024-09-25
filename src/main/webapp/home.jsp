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
<%@include file="/layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
    <div class="container px-5">
        <div class=" align-items-center justify-content-start">
            <div class="text-xl-start">
                <h1 class="display-8 fw-bolder text-white mb-2">홈</h1>
            </div>
        </div>
    </div>
</header>
<main class="flex-shrink-0">
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
                            <div class="d-flex flex-lg-column d-md-inline-flex justify-content-md-between w-100">
                                <div class="mb-4">
                                    <span class="h4 fw-bold">${user.nickname}</span>
                                    <span style="color: gray">${user.userID}</span>
                                </div>
                                <div class="d-md-inline d-flex justify-content-center gap-4 btn-group-lg text-nowrap">
                                    <button class="btn btn-secondary mx-1" onclick="location.href='/logout.jsp'">로그아웃</button>
                                    <button class="btn btn-secondary mx-1" onclick="location.href='/mypage'">마이페이지</button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${user == null}">
                        <div>
                            <div class="d-flex justify-content-between align-items-center border-bottom p-4 my-4 w-100">
                                <span class="fs-5">로그인하면 개인 기록을 작성할 수 있습니다.</span>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${user != null}">
                    <div>
                        <div class="d-flex justify-content-between align-items-center border-bottom p-4 my-4 w-100">
                            <span class="fs-4">개인 기록</span>
                            <button class="btn btn-light" onclick="location.href='/blog'">더보기</button>
                        </div>

                        <c:if test="${blogList != null}">
                            <div class="d-flex flex-column justify-content-center">
                                <c:forEach var="blog" items="${blogList}">
                                    <div class="border rounded-3 p-4 mb-2" role="button" onclick="location.href='/blog/view?id=${blog.post_id}'">
                                        <div class="d-flex gap-2 justify-content-start align-items-center">
                                            <span class="h4">${blog.title}</span>
                                            <c:if test="${blog.is_private == true}">
                                                <i class="bi bi-lock-fill text-secondary"></i>
                                            </c:if>

                                        </div>

                                        <p>${blog.content}</p>
                                        <div>
                                            <p>${blog.date}</p>
                                            <span>${blog.running_distance}km</span>
                                            <span> · </span>
                                            <span id="runningTime_${blog.post_id}"></span>
                                        </div>
                                    </div>
                                    <script>
                                        let start_time_${blog.post_id} = "${blog.start_time}";
                                        let end_time_${blog.post_id} = "${blog.end_time}";
                                        if(start_time_${blog.post_id} != "" && end_time_${blog.post_id} != "") {
                                            document.querySelector("#runningTime_${blog.post_id}").innerHTML = getRunningTime(start_time_${blog.post_id}, end_time_${blog.post_id});
                                        }
                                    </script>
                                </c:forEach>
                            </div>
                        </c:if>

                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>

<%@include file="/layout/footer.jsp"%>
</main>
<!-- Bootstrap core JS-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- Core theme JS-->
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>