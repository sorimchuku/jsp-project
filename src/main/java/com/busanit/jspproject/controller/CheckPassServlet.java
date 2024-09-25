package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.UserDAO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mypage/passCheck")
public class CheckPassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserVO user = (UserVO) request.getSession().getAttribute("user");
        String userPW = request.getParameter("userPW");
        String dbPW = null;

        String result = "false";

        UserDAO userDAO = new UserDAO();
        if (!userPW.isEmpty()) {
            dbPW = userDAO.checkPassword(user.getUserID(), userPW);
        }

        if (dbPW != null) {
            if (dbPW.equals(userPW)) {
                result = "true";
            }
        }
        out.print(result);
    }
}
