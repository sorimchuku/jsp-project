<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-13
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>회원가입</title>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">회원가입</h3>

                <div class="row mb-4">
                  <label for="user_id" class="col-sm-2 col-form-label col-form-label-lg">이메일</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-lg" id="user_id" name="user_id">
                  </div>
                  <input type="button" class="col-auto btn btn-secondary" id="check_id" value="중복체크">
                </div>

                <div class="row mb-4">
                  <label for="user_pw" class="col-sm-2 col-form-label col-form-label-lg text-nowrap">비밀번호</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-lg" id="user_pw" name="user_pw">
                  </div>
                </div>

                <div class="row mb-4">
                  <label for="user_pw_check" class="col-sm-2 col-form-label col-form-label-lg">비밀번호 확인</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-lg" id="user_pw_check" name="user_pw_check">
                  </div>
                </div>

                <div class="row mb-4">
                  <label for="user_nickname" class="col-sm-2 col-form-label col-form-label-lg">닉네임</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-lg" id="user_nickname" name="user_nickname">
                  </div>
                </div>

                <div class="row mb-4">
                  <h6 class="col-sm-2 col-form-label col-form-label-lg">성별</h6>
                  <div class="form-check form-control-lg form-check-inline mb-0 me-4 col-auto">
                    <input class="form-check-input" type="radio" name="gender_select" id="female"
                           value="female" />
                    <label class="form-check-label" for="female">여성</label>
                  </div>
                  <div class="form-check form-check-inline form-control-lg mb-0 me-4 col-auto">
                    <input class="form-check-input" type="radio" name="gender_select" id="male"
                           value="male" />
                    <label class="form-check-label" for="male">남성</label>
                  </div>
                </div>

                <div class="row mb-4">
                  <h6 class="col-sm-2 col-form-label col-form-label-lg">연령대</h6>
                  <div class="col-10 flex flex-wrap">
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4">
                      <input class="form-check-input" type="radio" name="age_select" id="age_10"
                             value="age_10" />
                      <label class="form-check-label" for="age_10">10대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_20"
                             value="age_20" />
                      <label class="form-check-label" for="age_20">20대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_30"
                             value="age_30" />
                      <label class="form-check-label" for="age_30">30대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_40"
                             value="age_40" />
                      <label class="form-check-label" for="age_40">40대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_50"
                             value="age_50" />
                      <label class="form-check-label" for="age_50">50대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_60"
                             value="age_60" />
                      <label class="form-check-label" for="age_60">60대 이상</label>
                    </div>
                  </div>
                </div>

                <div class="row mb-4">
                  <h6 class="col-sm-2 col-form-label col-form-label-lg">지역</h6>
                  <div class="col-10 ">
                    <label class="visually-hidden" for="location_select">지역</label>
                    <select class="form-select form-select-lg" id="location_select">
                      <option selected >선택하세요</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                  </div>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-light btn-lg">Reset all</button>
                  <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-warning btn-lg ms-2">Submit form</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
