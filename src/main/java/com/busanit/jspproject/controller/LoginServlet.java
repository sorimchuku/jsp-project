package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.UserDAO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");

        UserDAO dao = new UserDAO();
        UserVO userVO = dao.checkLogin(userID, userPW);
        HttpSession session = request.getSession();
        session.removeAttribute("loginError");

        if (userVO != null) {
            session.setAttribute("user", userVO);
        } else {
            session.setAttribute("loginError", "error");
        }

        response.sendRedirect("/");

    }
}
