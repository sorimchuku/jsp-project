<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="p-4 border-bottom">
  <h5 class="fw-bold mb-3">댓글</h5>
  <div class="mb-4">
    <c:forEach var="comment" items="${commentList}">
      <div class="border-bottom py-4">
        <div class="mb-3">
                <span class="">
                  <span class="fw-bold">${comment.nickname}</span>
                  <span> · </span>
                  <span class="text-secondary">${comment.date}</span>
                </span>
          <c:if test="${sessionScope.user.userID == comment.user_id}">
            <button class="btn btn-sm btn-secondary ms-2" onclick="deleteComment(${board.post_id}, ${comment.comment_id}, '${comment.board_type}')">삭제</button>
          </c:if>

        </div>

        <div class="">${comment.content}</div>
      </div>

    </c:forEach>
  </div>
  <c:if test="${sessionScope.user != null}">
    <form action="/comment" method="post">
      <input type="hidden" value="${board.post_id}" name="post_id">
      <input type="hidden" value="${board.board_type}" name="board_type">
      <h6 class="fw-bold mb-3">${sessionScope.user.nickname}</h6>
      <div class="row align-items-end">
        <div class="col-auto flex-grow-1">
          <textarea rows="3" class="form-control" name="comment"></textarea>
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary col-auto">댓글 작성</button>
        </div>
      </div>
    </form>
  </c:if>
  <c:if test="${sessionScope.user == null}">
    <span class="fs-6">로그인하면 댓글을 작성할 수 있습니다.</span>
  </c:if>
</div>
