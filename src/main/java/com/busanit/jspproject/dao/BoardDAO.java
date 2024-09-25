package com.busanit.jspproject.dao;

import com.busanit.jspproject.dto.BoardTeamVO;
import com.busanit.jspproject.dto.BoardVO;
import com.busanit.jspproject.dto.CommentVO;
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

        } catch (Exception e) {
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
        } catch (Exception e) {
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
        String sql = "select t.post_id, t.title, t.date, t.user_id, t.board_type, u.nickname, t.member_num, t.location from user_info u inner join team_board t on u.user_id = t.user_id order by t.post_id desc";

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
                board.setLocation(rs.getString("location"));
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
        String sql = "INSERT INTO team_board (title, location, member_num, content, user_id, board_type, img_url) values (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getLocation());
            ps.setInt(3, board.getMember_num());
            ps.setString(4, board.getContent());
            ps.setString(5, userID);
            ps.setString(6, board.getBoard_type());
            ps.setString(7, board.getImg_url());

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }
    }

    public BoardVO viewTeam(String postID) {
        BoardTeamVO board = new BoardTeamVO();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select t.post_id, t.title, t.date, t.user_id, t.board_type, u.nickname, t.member_num, t.location, t.content, t.read_count, t.img_url from user_info u inner join team_board t on u.user_id = t.user_id where post_id = ?";


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
                board.setNickname(rs.getString("nickname"));
                board.setBoard_type(rs.getString("board_type"));
                board.setImg_url(rs.getString("img_url"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }
        return board;
    }

    public void updateTeam(BoardVO board, String userID) {
        String sql = "update team_board set title = ?, location = ? , member_num = ? , content = ? where post_id = ? and user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getLocation());
            ps.setInt(3, board.getMember_num());
            ps.setString(4, board.getContent());
            ps.setInt(5, board.getPost_id());
            ps.setString(6, userID);

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

    public BoardVO viewFreeBoard(String id) {
        BoardTeamVO board = new BoardTeamVO();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
      
        String sql = "select f.post_id, f.title, f.date, f.user_id, f.board_type, u.nickname, f.content, f.read_count, f.img_url from user_info u inner join free_board f on u.user_id = f.user_id where post_id = ?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                board.setPost_id(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setDate(rs.getString("date"));
                board.setContent(rs.getString("content"));
                board.setUser_id(rs.getString("user_id"));
                board.setRead_count(rs.getInt("read_count"));
                board.setNickname(rs.getString("nickname"));
                board.setBoard_type(rs.getString("board_type"));
                board.setImg_url(rs.getString("img_url"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }
        return board;
    }


    public void deleteFreeBoard(String id) {
        String sql = "DELETE FROM free_board WHERE post_id = ?";

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

    public void insertFreeBoard(BoardVO board, String userID) {
        String sql = "INSERT INTO Free_board (title, content, user_id, board_type, img_url) values (?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getContent());
            ps.setString(3, userID);
            ps.setString(4, board.getBoard_type());
            ps.setString(5, board.getImg_url());

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }
    }


    public List<BoardTeamVO> getJoinFreeBoardList() {
        List<BoardTeamVO> list = new ArrayList<BoardTeamVO>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select f.post_id, f.title, f.date, f.user_id, f.board_type, u.nickname from user_info u inner join free_board f on u.user_id = f.user_id order by f.post_id desc";

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
                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps, rs);
        }

        return list;
    }

    public void insertComment(CommentVO comment) {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "insert into comment (content, board_type, user_id, post_id) values (?, ?, ?, ?)";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, comment.getContent());
            ps.setString(2, comment.getBoard_type());
            ps.setString(3, comment.getUser_id());
            ps.setInt(4, comment.getPost_id());
            int rs = ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBManager.close(conn, ps);
        }
    }

    public List<CommentVO> getCommentList(int postID, String boardType) {
        List<CommentVO> commentList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select c.post_id, c.comment_id, c.content, c.board_type, c.user_id, c.date, u.nickname from comment c inner join user_info u on c.user_id = u.user_id where c.post_id = ? and c.board_type = ?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, postID);
            ps.setString(2, boardType);
            rs = ps.executeQuery();
            while (rs.next()) {
                CommentVO comment = new CommentVO();
                comment.setPost_id(rs.getInt("post_id"));
                comment.setComment_id(rs.getInt("comment_id"));
                comment.setDate(rs.getString("date"));
                comment.setContent(rs.getString("content"));
                comment.setBoard_type(rs.getString("board_type"));
                comment.setUser_id(rs.getString("user_id"));
                comment.setNickname(rs.getString("nickname"));
                comment.setBoard_type(boardType);
                commentList.add(comment);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBManager.close(conn, ps, rs);
        }

        return commentList;
    }

    public void deleteComment(int postID, int commentID, String boardType) {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "delete from comment where post_id = ? and comment_id = ? and board_type = ?";

        try {
            conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, postID);
            ps.setInt(2, commentID);
            ps.setString(3, boardType);
            int rs = ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            DBManager.close(conn, ps);
        }

       public void updateFreeBoard(BoardVO board, String userID) {
        String sql = "update free_board set title = ?, content = ? where post_id = ? and user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getContent());
            ps.setInt(3, board.getPost_id());
            ps.setString(4, userID);

            int rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, ps);
        }

}