package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/team/view")
public class JoinBoardViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/joinBoardView.jsp";
        String id = request.getParameter("id");

        BoardDAO dao = new BoardDAO();
        BoardVO board = dao.viewTeam(id);

        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);
    }

}