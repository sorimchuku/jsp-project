package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.CommentVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/team/view")
public class JoinBoardViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/joinBoardView.jsp";
        String id = request.getParameter("id");
        String boardType = "team";

        BoardDAO dao = new BoardDAO();

        List<CommentVO> commentList = dao.getCommentList(Integer.parseInt(id), boardType);
        dao.updateCount(id, boardType);
        BoardVO board = dao.viewTeam(id);

        request.setAttribute("board", board);
        request.setAttribute("commentList", commentList);
        request.getRequestDispatcher(url).forward(request, response);
    }

}