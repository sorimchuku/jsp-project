function checkRegister() {
    const userID = document.querySelector("form [name=user_id]");
    const userPW = document.querySelector("#user_pw");
    const emailCheckResult = document.querySelector("form [name=email_check_result]");
    const userPWCheck = document.querySelector("#user_pw_check");
    const userNickname = document.querySelector("#user_nickname");
    const userGender = document.querySelector("form [name=gender_select]:checked");
    const userAge = document.querySelector("form [name=age_select]:checked");
    const userLocation = document.querySelector("#location_select");

    if (userID.value.length <= 0 ) {
        alert("이메일을 입력하세요");
        userID.focus();
        return false;
    }

    if (emailCheckResult.value <= 0) {
        alert("이메일 중복 확인을 해주세요.");
        return  false;
    }

    if (emailCheckResult.value.trim() === "true") {
        alert("새로운 이메일을 입력해주세요.");
        userID.focus();
        return false;
    }

    if (userPW.value.length <= 0 ) {
        alert("비밀번호를 입력하세요");
        userPW.focus();
        return false;
    }
    if (userPW.value !== userPWCheck.value) {
        alert("비밀번호 확인이 일치하지 않습니다.");
        userPWCheck.focus();
        return false;
    }

    if (userNickname.value.length <= 0) {
        alert("닉네임을 입력하세요");
        userNickname.focus();
        return false;
    }

    if (userGender === null ) {
        alert("성별을 선택하세요");
        return false;
    }

    if (userAge === null) {
        alert("연령대를 선택하세요");
        return false;
    }

    if (userLocation.value === "") {
        alert("지역을 선택하세요");
        return false;
    }

    return true;

}

function checkEmail() {
    const user_id = document.querySelector("#user_id").value.trim();
    document.querySelector("#email_check_result").innerText = "";
    const checkResult = document.querySelector("form [name=email_check_result]");

    if (user_id.length > 0) {
        $.ajax({
            type: "post",
            url: "/register/emailCheck",
            data: {
                user_id: user_id
            },
            success: function (data) {
                if(data == "false") {
                    document.querySelector("#email_check_result").innerText = "사용할 수 있는 이메일입니다.";
                    checkResult.value = "false";
                } else {
                    document.querySelector("#email_check_result").innerText = "이미 존재하는 이메일입니다.";
                    checkResult.value = "true";
                }
            },
            error: {
                function() {
                    console.log("서버 요청 실패")
                }
            }
        })
    }
}

function checkLogin() {
    const userID = document.querySelector("form [name=userID]");
    const userPW = document.querySelector("form [name=userPW]");

    if (userID.value.length <= 0 ) {
        alert("아이디를 입력하세요");
        userID.focus();
        return false;
    }
    if (userPW.value.length <= 0 ) {
        alert("비밀번호를 입력하세요");
        userPW.focus();
        return false;
    }
    return true;
}

function checkLogWrite() {
    const titleInput = document.querySelector("form [name=title]");

    if(titleInput.value.length <= 0) {
        alert("제목은 필수 입력 사항입니다.");
        titleInput.focus();
        return  false;
    }

    return true;
}

function getRunningTime(start_time, end_time) {
    let start = new Date(start_time);
    let end = new Date(end_time);

    // 시간 차이를 밀리초 단위로 계산
    let durationInMillis = end - start;

    // 밀리초를 시간과 분으로 변환
    let hours = Math.floor(durationInMillis / (1000 * 60 * 60));
    let minutes = Math.floor((durationInMillis % (1000 * 60 * 60)) / (1000 * 60));

    // hh:MM 형식의 문자열로 반환
    let timestr =  `${String(hours)}시간 ${String(minutes)}분`;

    return timestr;
}