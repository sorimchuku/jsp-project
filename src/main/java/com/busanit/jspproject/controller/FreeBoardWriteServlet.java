package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/freeboard/write")
public class FreeBoardWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/joinBoardWrite.jsp";

        request.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        BoardVO board = new BoardVO();
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setLocation(request.getParameter("location"));
        board.setMember_num(Integer.parseInt(request.getParameter("member_num")));
        board.setBoard_type("team");

        BoardDAO dao = new BoardDAO();
        dao.insertTeam(board, user.getUserID());
        response.sendRedirect("/team");
    }
}
