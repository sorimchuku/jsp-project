package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.CommentVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        CommentVO comment = new CommentVO();
        comment.setPost_id(Integer.parseInt(request.getParameter("post_id")));
        comment.setUser_id(user.getUserID());
        comment.setNickname(user.getNickname());
        comment.setContent(request.getParameter("comment"));
        comment.setBoard_type(request.getParameter("board_type"));

        BoardDAO boardDAO = new BoardDAO();
        boardDAO.insertComment(comment);

        String boardType = request.getParameter("board_type");
        System.out.println(boardType);
        String postID = request.getParameter("post_id");

        switch (boardType) {
            case "team":
                response.sendRedirect("/team/view?id=" + postID);
                break;
            case "free_board":
                response.sendRedirect("/freeboard/view?id=" + postID);
                break;
        }
    }
}
