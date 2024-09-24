package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;
import util.PageHandler;
import util.PageScrollHandler;

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

            BoardDAO dao = new BoardDAO();

            int blogCount = dao.getBlogCount(userID);

            int currentPage = 1;
            String currentPageStr = request.getParameter("page");
            if (currentPageStr != null) {
                currentPage = Integer.parseInt(currentPageStr);
            }


            PageScrollHandler pageHandler = new PageScrollHandler(blogCount, currentPage);

            int lastPost = currentPage * pageHandler.getPageSize();
            List<BoardVO> boardList = dao.getBlogList(userID, 0, lastPost);

            System.out.println(pageHandler.getLastPost());
            request.setAttribute("boardList", boardList);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("showNext", pageHandler.isShowNext());
            System.out.println(pageHandler.isShowNext());
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
