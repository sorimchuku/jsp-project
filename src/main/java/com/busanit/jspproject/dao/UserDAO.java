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
            System.out.println(conn);
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
            DBManager.close(conn, pstmt);
        }

        return userVO;
    }

}
