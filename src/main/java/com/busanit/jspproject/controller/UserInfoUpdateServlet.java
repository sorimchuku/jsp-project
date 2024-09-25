package com.busanit.jspproject.controller;
import com.busanit.jspproject.dao.UserDAO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/mypage/update")
public class UserInfoUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/mypage-update.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        UserVO user = new UserVO();
        user.setUserID(request.getParameter("user_id"));
        user.setPassword(request.getParameter("user_pw"));
        user.setNickname(request.getParameter("user_nickname"));
        user.setGender(request.getParameter("gender_select"));
        user.setAge(Integer.parseInt(request.getParameter("age_select")));
        user.setLocation(request.getParameter("location_select"));

        UserDAO userDAO = new UserDAO();
        userDAO.updateUserInfo(user);

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        response.sendRedirect("/mypage");


    }
}
