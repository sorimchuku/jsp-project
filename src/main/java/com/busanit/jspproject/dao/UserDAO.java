package com.busanit.jspproject.dao;

import com.busanit.jspproject.dto.UserVO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public UserVO checkLogin(String userID, String userPW) {
        String sql = "select * from user_info where user_id = ? and password = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserVO userVO = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPW);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                userVO = new UserVO();
                userVO.setUserID(rs.getString("user_id"));
                userVO.setPassword(rs.getString("password"));
                userVO.setNickname(rs.getString("nickname"));
                userVO.setGender(rs.getString("gender"));
                userVO.setAge(rs.getInt("age"));
                userVO.setLocation(rs.getString("location"));
                userVO.setAdmin(rs.getBoolean("admin"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return userVO;
    }

    public String checkEmail(String email) {
        String sql = "select * from user_info where user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString("user_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return null;
    }

    public void registerUser(UserVO userVO) {
        String sql = "insert into user_info (user_id, password, nickname, gender, age, location) values (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userVO.getUserID());
            pstmt.setString(2, userVO.getPassword());
            pstmt.setString(3, userVO.getNickname());
            pstmt.setString(4, userVO.getGender());
            pstmt.setInt(5, userVO.getAge());
            pstmt.setString(6, userVO.getLocation());
            int rs = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

    }

