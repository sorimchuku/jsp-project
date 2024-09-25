<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>마이페이지</title>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="css/styles.css" rel="stylesheet" />
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">마이페이지</h1>
      </div>
    </div>
  </div>
</header>

<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div>
              <div class="card-body p-md-5 text-black">
                <div class="row mb-4">
                  <span class="col-sm-2 col-form-label col-form-label-lg">이메일</span>
                  <div class="col-sm-6">
                    <span class="form-control-lg form-control-plaintext">${user.userID}</span>
                  </div>
                </div>

                <div class="row mb-4">
                  <span class="col-sm-2 col-form-label col-form-label-lg">닉네임</span>
                  <div class="col-sm-6">
                    <span class="form-control-lg form-control-plaintext">${user.nickname}</span>
                  </div>
                </div>

                <div class="row mb-4">
                  <span class="col-sm-2 col-form-label col-form-label-lg">성별</span>
                  <div class="col-sm-6">
                    <span class="form-control-lg form-control-plaintext">${user.gender == "female" ? "여성" : "남성"}</span>
                  </div>
                </div>

                <div class="row mb-4">
                  <span class="col-sm-2 col-form-label col-form-label-lg">연령대</span>
                  <div class="col-sm-6">
                    <span class="form-control-lg form-control-plaintext">${user.age}대</span>
                  </div>
                </div>

                <div class="row mb-4">
                  <span class="col-sm-2 col-form-label col-form-label-lg">지역</span>
                  <div class="col-sm-6">
                    <span class="form-control-lg form-control-plaintext">${user.location}</span>
                  </div>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <button class="btn btn-primary btn-lg" onclick="location.href='/mypage/update'">회원정보 수정</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
