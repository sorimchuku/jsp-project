package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardTeamVO;
import util.PageHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/freeboard")
public class FreeBoardListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/freeBoardList.jsp";

        // 페이지 정보
        int currPage = 1;
        String req_page = request.getParameter("currentPage");
        if(req_page == null) {
            currPage = 1;
        } else {
            currPage = Integer.parseInt(req_page);
        }

        BoardDAO dao = new BoardDAO();

        int totalCnt = dao.selectAllFreeBoardCount();

        // 페이징 관련 값 계산(생성자 호출)
        PageHandler pageHandler = new PageHandler(totalCnt, currPage);

        // 페이지 시작값 계산
        int offset = (currPage - 1) * pageHandler.getPageSize();


        List<BoardTeamVO> freeBoardList = dao.selectPagingFreeBoard(offset, pageHandler.getPageSize());
        request.setAttribute("boardList", freeBoardList);
        request.setAttribute("pageHandler", pageHandler);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
