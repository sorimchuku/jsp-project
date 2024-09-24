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
  <title>개인 기록</title>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
<%@include file="layout/header.jsp"%>
<!-- Header-->
<header class="bg-dark py-4">
  <div class="container px-5">
    <div class=" align-items-center justify-content-start">
      <div class="text-xl-start">
        <h1 class="display-8 fw-bolder text-white mb-2">개인 기록</h1>
      </div>
    </div>
  </div>
</header>
<main>
  <div class="container px-5 my-5">
<div class="row p-5">
  <c:if test="${sessionScope.user == null}">
    <div class="border rounded-3 w-75 p-4 py-5 mx-auto d-flex flex-column justify-content-center align-items-center">
      <h5 class="text-center mb-4">로그인이 필요합니다.</h5>
      <button type="button" class="btn btn-primary" onclick="location.href='/'">메인으로</button>
    </div>
  </c:if>

    <c:if test="${boardList != null}">
  <div class="col-6 d-flex flex-column justify-content-center">
      <c:forEach var="board" items="${boardList}">
        <div class="border rounded-3 p-4 mb-2" role="button" onclick="location.href='/blog/view?id=${board.post_id}'">
          <div class="d-flex gap-2 justify-content-start align-items-center">
            <span class="h4">${board.title}</span>
            <c:if test="${board.is_private == true}">
              <i class="bi bi-lock-fill text-secondary"></i>
            </c:if>

          </div>

          <p>${board.content}</p>
          <div>
            <p>${board.date}</p>
            <span>${board.running_distance}km</span>
            <span> · </span>
            <span id="runningTime_${board.post_id}"></span>
          </div>
        </div>
        <script>
            let start_time_${board.post_id} = "${board.start_time}";
            let end_time_${board.post_id} = "${board.end_time}";
            if(start_time_${board.post_id} != "" && end_time_${board.post_id} != "") {
                document.querySelector("#runningTime_${board.post_id}").innerHTML = getRunningTime(start_time_${board.post_id}, end_time_${board.post_id});
            }
        </script>
      </c:forEach>
    <c:if test="${showNext == true}" >
      <form action="/blog" method="get" class="  mx-auto my-1">
        <input type="hidden" name="page" value="${currentPage + 1}">
        <button type="submit" class="btn btn-light">더 불러오기</button>
      </form>
    </c:if>
  </div>
      <div class="col-6">
        <button class="w-100 btn btn-primary mb-4 py-3 fs-5" onclick="location.href='/blog/write'">글쓰기</button>
        <div class="border rounded p-4">
          <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        </div>

      </div>
    </c:if>

</div>
</div>
</main>
<%@include file="layout/footer.jsp"%>
</body>
<script>
    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            theme: "light2",
            title: {
                text: "러닝 기록"
            },
            axisY: {
                title: "달린 거리 (km)"
            },
            axisY2: {
                title: "달린 시간 (분)"
            },
            data: [{
                type: "column",
                name: "Distance",
                showInLegend: true,
                dataPoints: [
                    <c:forEach var="board" items="${boardList}">
                    { label: formatDate("${board.date}"), y: ${board.running_distance} },
                    </c:forEach>
                ]
            },
                {
                    type: "line",
                    name: "Time",
                    axisYType: "secondary",
                    showInLegend: true,
                    dataPoints: [
                        <c:forEach var="board" items="${boardList}">
                        { label: formatDate("${board.date}"), y: getRunningTimeInMinutes("${board.start_time}", "${board.end_time}") },
                        </c:forEach>
                    ]
                }]
        });
        chart.render();
    }

    function formatDate(dateString) {
        let date = new Date(dateString);
        let formattedStr = date.toLocaleDateString('ko-KR', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
        }).replace(/\./g, '').replace(/\s/g, '-');
        return formattedStr;
    }

    function getRunningTimeInMinutes(startTime, endTime) {
        // Calculate the running time in minutes
        let start = new Date(startTime);
        let end = new Date(endTime);
        let diff = (end - start) / 1000 / 60; // Convert milliseconds to minutes
        return diff;
    }
</script>

</html>
