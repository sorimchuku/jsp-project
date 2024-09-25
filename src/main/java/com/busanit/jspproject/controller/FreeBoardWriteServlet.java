package com.busanit.jspproject.controller;

import com.busanit.jspproject.dao.BoardDAO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/freeboard/write")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class FreeBoardWriteServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
    private static final String LOCAL_PROJECT_PATH = "C:\\eom\\jsp-project\\jsp-project\\src";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/freeBoardWrite.jsp";

        request.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String uploadFilePath = LOCAL_PROJECT_PATH + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = "";
        for (Part part : request.getParts()) {
            if (part.getName().equals("img")) {
                fileName = extractFileName(part);
                part.write(uploadFilePath + File.separator + fileName);
            }
        }

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");
        BoardVO board = new BoardVO();
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setBoard_type("free_board");
        board.setImg_url(fileName);

        BoardDAO dao = new BoardDAO();
        dao.insertFreeBoard(board, user.getUserID());
        response.sendRedirect("/freeboard");
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


