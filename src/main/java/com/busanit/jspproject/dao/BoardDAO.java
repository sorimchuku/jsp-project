package com.busanit.jspproject.dao;

import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    public List<BoardVO> getBlogList(String userID) {
        List<BoardVO> list = new ArrayList<BoardVO>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from log_page where user_id=? order by post_id desc";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                BoardVO board = new BoardVO();
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setDate(rs.getString("date"));
                board.setContent(rs.getString("content"));
                board.setRunning_time(rs.getString("running_time"));
                board.setRunning_distance(rs.getString("running_distance"));
                board.setIs_private(rs.getBoolean("is_private"));
                board.setUser_id(rs.getString("user_id"));
                board.setBoard_type(rs.getString("board_type"));
                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }

        return list;
    }
}

