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

@WebServlet("/freeboard/view")
public class FreeBoardViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/freeBoardView.jsp";
        String id = request.getParameter("id");
        String boardType = "free_board";

        BoardDAO dao = new BoardDAO();
        List<CommentVO> commentList = dao.getCommentList(Integer.parseInt(id), boardType);
        dao.updateCount(id, boardType);
        BoardVO board = dao.viewFreeBoard(id);

        request.setAttribute("board", board);
        request.setAttribute("commentList", commentList);
        request.getRequestDispatcher(url).forward(request, response);
    }

}