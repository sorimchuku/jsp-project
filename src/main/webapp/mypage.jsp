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
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script>
      function openModal() {
          const myModal = new bootstrap.Modal('#staticBackdrop');
          myModal.show();
      }

      function passwordCheck() {
          let input_pass = document.querySelector("#userPW").value.trim();
          document.querySelector("#modal_result").innerText = "";
          if(input_pass.length > 0) {
              $.ajax({
                  type: "post",
                  url: "/mypage/passCheck",
                  data: {
                      userPW: input_pass,
                  },
                  success: function (data) {
                      console.log(data);
                      if(data == "true") {
                          location.href="/mypage/update";
                      } else {
                          document.querySelector("#modal_result").innerText = "비밀번호가 일치하지 않습니다.";
                      }
                  },
                  error: function() {
                      console.log("서버 요청 실패");
                  }
              })
          }

      }
  </script>
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

<section class="h-100">
  <div class="container py-4">
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
                  <button class="btn btn-primary btn-lg" onclick="openModal()">회원정보 수정</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="input-group">
            <span class="input-group-text">비밀번호</span>
            <input type="password" class="form-control" id="userPW">
            <button type="button" class="btn btn-primary" onclick="passwordCheck()">확인</button>
          </div>
        <span class="form-text text-danger mx-1 my-2" id="modal_result"></span>
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
