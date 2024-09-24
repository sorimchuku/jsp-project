package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/team/delete")
public class JoinBoardDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        BoardDAO dao = new BoardDAO();
        dao.deleteTeamBoard(id);

        // 게시글 목록이동
        response.sendRedirect("/team");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
