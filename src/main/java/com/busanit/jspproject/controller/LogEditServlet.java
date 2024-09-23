package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/blog/edit")
public class LogEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/log-edit.jsp";
        String id = request.getParameter("id");

        BoardDAO dao = new BoardDAO();
        BoardVO board = dao.viewBlog(id);

        request.setAttribute("board", board);
        request.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        BoardVO board = new BoardVO();
        UserVO user = (UserVO) request.getSession().getAttribute("user");
        board.setPost_id(Integer.parseInt(request.getParameter("id")));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setStart_time(request.getParameter("start_time"));
        board.setEnd_time(request.getParameter("end_time"));
        board.setRunning_distance(request.getParameter("distance"));
        boolean isPrivate = request.getParameter("is_private").equals("true");
        board.setIs_private(isPrivate);
        BoardDAO dao = new BoardDAO();
        dao.updateBlog(board, user.getUserID());

        response.sendRedirect("/blog/view?id=" + request.getParameter("id"));


    }
}
