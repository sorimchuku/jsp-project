package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@WebServlet("/blog/write")
public class LogWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/log-write.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        BoardVO board = new BoardVO();
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setRunning_distance(request.getParameter("distance"));
        board.setStart_time(start_time);
        board.setEnd_time(end_time);
        boolean isPrivate = request.getParameter("is_private").equals("true");
        board.setIs_private(isPrivate);
        board.setBoard_type("log");

        BoardDAO dao = new BoardDAO();
        dao.insertLog(board, user.getUserID());
        response.sendRedirect("/blog");
    }
}
