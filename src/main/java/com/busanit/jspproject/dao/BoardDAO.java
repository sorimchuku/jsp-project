package com.busanit.jspproject.dao;

import com.busanit.jspproject.dto.BoardTeamVO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.UserVO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    public void updateCount(String postID, String boardName) {
        String sql = "update " + boardName + " set read_count = read_count + 1 where post_id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, postID);
            int rs = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

    public int getBlogCount(String userID) {
        String sql = "select count(*) from log_page where user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return count;
    }

    public List<BoardVO> getBlogList(String userID, int offset, int limit) {
        List<BoardVO> list = new ArrayList<BoardVO>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from log_page where user_id=? order by post_id desc limit ?, ?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setInt(2, offset);
            ps.setInt(3, limit);

            rs = ps.executeQuery();
            while (rs.next()) {
                BoardVO board = new BoardVO();
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setDate(rs.getString("date"));
                board.setContent(rs.getString("content"));
                board.setStart_time(rs.getString("start_time"));
                board.setEnd_time(rs.getString("end_time"));
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

    public void insertLog(BoardVO board, String userID) {
        String sql = "INSERT INTO log_page (title, start_time, end_time, running_distance, content, is_private, user_id, board_type) values (?, ?, ?,  ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getStart_time());
            ps.setString(3, board.getEnd_time());
            ps.setString(4, board.getRunning_distance());
            ps.setString(5, board.getContent());
            ps.setBoolean(6, board.getIs_private());
            ps.setString(7, userID);
            ps.setString(8, board.getBoard_type());

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }
    }

    public void updateBlog(BoardVO board, String userID) {
        String sql = "update log_page set title = ?, start_time = ? , end_time = ? , running_distance = ?, content = ?, is_private = ? where post_id = ? and user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getStart_time());
            ps.setString(3, board.getEnd_time());
            ps.setString(4, board.getRunning_distance());
            ps.setString(5, board.getContent());
            ps.setBoolean(6, board.getIs_private());
            ps.setInt(7, board.getPost_id());
            ps.setString(8, userID);

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }

    }

    public BoardVO viewBlog(String postID) {
        BoardVO board = new BoardVO();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from log_page where post_id=?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, postID);
            rs = ps.executeQuery();
            if (rs.next()) {
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setDate(rs.getString("date"));
                board.setStart_time(rs.getString("start_time"));
                board.setEnd_time(rs.getString("end_time"));
                board.setContent(rs.getString("content"));
                board.setRunning_distance(rs.getString("running_distance"));
                board.setIs_private(rs.getBoolean("is_private"));
                board.setUser_id(rs.getString("user_id"));

            }

        } catch ( Exception e ) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }
        return board;
    }

    public void deleteBlog(String postID, UserVO user) {
        String sql = "delete from log_page where post_id=? and user_id=?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, postID);
            ps.setString(2, user.getUserID());
            int rs = ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }

    }

    public List<BoardTeamVO> getJoinList() {
        List<BoardTeamVO> list = new ArrayList<BoardTeamVO>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from user_info u inner join team_board t on u.user_id = t.user_id order by t.post_id desc";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                BoardTeamVO board = new BoardTeamVO();
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setDate(rs.getString("date"));
                board.setUser_id(rs.getString("user_id"));
                board.setBoard_type(rs.getString("board_type"));
                board.setNickname(rs.getString("nickname"));
                board.setMember_num(rs.getInt("member_num"));


                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }

        return list;
    }



    public void insertTeam(BoardVO board, String userID) {
        String sql = "INSERT INTO team_board (title, location, member_num, date, content, user_id, board_type) values (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getLocation());
            ps.setInt(3, board.getMember_num());
            ps.setString(4, board.getDate());
            ps.setString(5, board.getContent());
            ps.setString(6, userID);
            ps.setString(7, board.getBoard_type());

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }
    }

    public BoardVO viewTeam(String postID) {
        BoardVO board = new BoardVO();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from team_board where post_id=?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, postID);
            rs = ps.executeQuery();
            if (rs.next()) {
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setLocation(rs.getString("location"));
                board.setMember_num(rs.getInt("member_num"));
                board.setDate(rs.getString("date"));
                board.setContent(rs.getString("content"));
                board.setRead_count(rs.getInt("read_count"));
                board.setUser_id(rs.getString("user_id"));

            }

        } catch ( Exception e ) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }
        return board;
    }

    public void updateTeam(BoardVO board, String userID) {
        String sql = "update team_board set title = ?, location = ? , member_num = ? , date = ?, content = ? where post_id = ? and user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getLocation());
            ps.setInt(3, board.getMember_num());
            ps.setString(4, board.getDate());
            ps.setString(5, board.getContent());
            ps.setInt(6, board.getPost_id());
            ps.setString(7, userID);

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }

    }

    public void deleteTeamBoard(String id) {
        String sql = "DELETE FROM team_board WHERE post_id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

}

