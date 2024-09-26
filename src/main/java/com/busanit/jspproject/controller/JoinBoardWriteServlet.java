package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardTeamVO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

import static java.lang.Integer.parseInt;

@WebServlet("/team/write")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class JoinBoardWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/joinBoardWrite.jsp";

        request.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String uploadFilePath = "C:\\uploads";
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = "";
        for (Part part : request.getParts()) {
            if (part.getName().equals("img")) {
                if(part.getSize() > 0) {
                    fileName = extractFileName(part);
                    part.write(uploadFilePath + File.separator + fileName);
                }
            }
        }

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        BoardVO board = new BoardVO();
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setLocation(request.getParameter("location"));
        String memberStr = request.getParameter("member_num");
        int memberNum = 0;
        if (!memberStr.isEmpty()) {
            memberNum = parseInt(memberStr);
        }
        board.setMember_num(memberNum);
        board.setBoard_type("team");
        board.setImg_url(fileName);

        BoardDAO dao = new BoardDAO();
        dao.insertTeam(board, user.getUserID());
        response.sendRedirect("/team");
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
