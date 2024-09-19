package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;
import util.PageHandler;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/blog")
public class LogPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "log-page.jsp";
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");
        if (user != null) {
            String userID = user.getUserID();
            System.out.println(userID);

            BoardDAO dao = new BoardDAO();

            List<BoardVO> boardList = dao.getBlogList(userID);

            request.setAttribute("boardList", boardList);
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
