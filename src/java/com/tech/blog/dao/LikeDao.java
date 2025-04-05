package com.tech.blog.dao;

import com.tech.blog.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

public class LikeDao {

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement ps = con.prepareStatement(
                "INSERT INTO LIKES(PID, UID) VALUES(?, ?)")) {
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            int no = ps.executeUpdate();
            if (no == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) FROM LIKES WHERE PID=?")) {
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM LIKES WHERE PID=? AND UID=?")) {
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement ps = con.prepareStatement(
                "DELETE FROM LIKES WHERE PID=? AND UID=?")) {
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
                f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
