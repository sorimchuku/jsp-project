package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentID = request.getParameter("id");
        String postID = request.getParameter("post");
        String boardType = request.getParameter("boardType");

        BoardDAO boardDAO = new BoardDAO();
        boardDAO.deleteComment(Integer.parseInt(postID), Integer.parseInt(commentID), boardType );

        switch (boardType) {
            case "team":
                response.sendRedirect("/team/view?id=" + postID);
                break;
            case "free_board":
                response.sendRedirect("/freeboard/view?id=" + postID);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
