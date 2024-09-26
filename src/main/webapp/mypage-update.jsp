<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>회원정보 수정</title>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script language="JavaScript">
      function goPopup(){
          // 주소검색을 수행할 팝업 페이지를 호출합니다.
          // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
          var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");

          // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
          //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
      }

      function jusoCallBack(roadFullAddr,roadAddrPart1){
          // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
          document.querySelector("#roadAddrPart1").value = roadAddrPart1;

      }
  </script>
</head>
<body>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const userGender = '${sessionScope.user.gender}';
        const genderInputs = document.querySelectorAll('input[name="gender_select"]');

        genderInputs.forEach(input => {
            if (input.value === userGender) {
                input.checked = true;
            }
        });

        const userAge = '${sessionScope.user.age}';
        const ageInputs = document.querySelectorAll('input[name="age_select"]');

        ageInputs.forEach(input => {
            if (input.value === userAge) {
                input.checked = true;
            }
        });
    });

    function checkUserUpdate(){
        const userPW = document.querySelector("#user_pw");
        const userPWCheck = document.querySelector("#user_pw_check");
        const userNickname = document.querySelector("#user_nickname");

        if (userPW.value.length <= 0) {
            userPW.value = "${sessionScope.user.password}";
        } else if (userPW.value !== userPWCheck.value) {
            alert("비밀번호 확인이 일치하지 않습니다.");
            userPWCheck.focus();
            return false;
        }

        if (userNickname.value.length <= 0) {
            userNickname.value = "${sessionScope.user.nickname}"
        }

        return true;
    }

</script>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">회원정보 수정</h1>
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
              <form action="/mypage/update" method="post" class="card-body p-md-5 text-black">
                <input type="hidden" value="${sessionScope.user.userID}" name="user_id">
                <div class="row mb-4">
                  <label class="col-sm-2 col-form-label col-form-label-lg">이메일</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-lg form-control-plaintext" value="${sessionScope.user.userID}">
                  </div>
                </div>

                <div class="row mb-4">
                  <label for="user_pw" class="col-sm-2 col-form-label col-form-label-lg text-nowrap">비밀번호</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-lg" id="user_pw" name="user_pw">
                  </div>
                </div>

                <div class="row mb-4">
                  <label for="user_pw_check" class="col-sm-2 col-form-label col-form-label-lg">비밀번호 확인</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-lg" id="user_pw_check" name="user_pw_check">
                  </div>
                </div>

                <div class="row mb-4">
                  <label for="user_nickname" class="col-sm-2 col-form-label col-form-label-lg">닉네임</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-lg" id="user_nickname" name="user_nickname" value="${sessionScope.user.nickname}">
                  </div>
                </div>

                <div class="row mb-4">
                  <h6 class="col-sm-2 col-form-label col-form-label-lg">성별</h6>
                  <div class="form-check form-control-lg form-check-inline mb-0 me-4 col-auto">
                    <input class="form-check-input" type="radio" name="gender_select" id="female"
                           value="female"/>
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
                             value="10" />
                      <label class="form-check-label" for="age_10">10대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_20"
                             value="20" />
                      <label class="form-check-label" for="age_20">20대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_30"
                             value="30" />
                      <label class="form-check-label" for="age_30">30대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_40"
                             value="40" />
                      <label class="form-check-label" for="age_40">40대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_50"
                             value="50" />
                      <label class="form-check-label" for="age_50">50대</label>
                    </div>
                    <div class="form-check form-control-lg form-check-inline mb-0 me-4 ">
                      <input class="form-check-input" type="radio" name="age_select" id="age_60"
                             value="60" />
                      <label class="form-check-label" for="age_60">60대 이상</label>
                    </div>
                  </div>
                </div>

                <div class="row mb-4">
                  <h6 class="col-sm-2 col-form-label col-form-label-lg">주소</h6>
                  <div class="col-10 ">
                    <label class="visually-hidden" for="roadAddrPart1">주소</label>
                    <div class="input-group input-group-lg">
                      <input type="text" class="form-control"  id="roadAddrPart1"  name="location_select" value="${sessionScope.user.location}">
                      <button type="button" class="btn btn-secondary" onclick="goPopup()">주소검색</button>
                    </div>
                  </div>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <input type="button" class="btn btn-secondary btn-lg" value="되돌리기" onclick="location.href='/mypage/update'">
                  <input type="submit" class="btn btn-primary btn-lg ms-2" onclick="return checkUserUpdate()" value="완료">
                </div>

              </form>
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
<script src="/js/scripts.js"></script>
</body>
</html>
