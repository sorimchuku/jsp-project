package com.busanit.jspproject.controller;

import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/mypage")
public class UserPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/mypage.jsp";
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        UserVO user = (UserVO) request.getSession().getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
