package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.UserDAO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/register.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserVO user = new UserVO();

        user.setUserID(request.getParameter("user_id"));
        user.setPassword(request.getParameter("user_pw"));
        user.setNickname(request.getParameter("user_nickname"));
        user.setGender(request.getParameter("gender_select"));
        user.setAge(Integer.parseInt(request.getParameter("age_select")));
        user.setLocation(request.getParameter("location_select"));

        UserDAO dao = new UserDAO();
        dao.registerUser(user);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/register-success.jsp").forward(request, response);

    }
}
