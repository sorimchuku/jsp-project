package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardTeamVO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class IndexPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        UserVO user = (UserVO) request.getSession().getAttribute("user");
        if (user != null) {
            List<BoardVO> blogList = dao.getBlogList(user.getUserID(), 0, 3);


            request.setAttribute("blogList", blogList);

        }

        List<BoardTeamVO> freeboardList = dao.getJoinFreeBoardList();
        List<BoardTeamVO> joinList = dao.getJoinList();
        request.setAttribute("freeboardList", freeboardList);
        request.setAttribute("joinList", joinList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
