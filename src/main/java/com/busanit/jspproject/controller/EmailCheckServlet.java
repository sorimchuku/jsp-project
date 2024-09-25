package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register/emailCheck")
public class EmailCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("user_id");

        UserDAO dao = new UserDAO();
        String db_userId = dao.checkEmail(email);

        if (db_userId != null) {
            out.print("true");
        } else {
            out.print("false");
        }

    }
}
