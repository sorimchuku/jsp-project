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