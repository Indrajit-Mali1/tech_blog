package com.tech.blog.dao;

import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base;
    public boolean saveUser(User user) {
        boolean f = false;
        try {
//            User--> database

            String query = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        
        try {
            String query="select * from user where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            if(set.next()){
                user = new User();
//                String name = set.getString("name");
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setAbout(set.getString("about"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    //Update User
    public  boolean updateUser(User user){
        boolean f =false;
        try {
            String query="update user set name=?, email=?, password=?, about=?, profile=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6,user.getId());
            
            pstmt.executeUpdate();
            f=true;
            
            pstmt.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId) {
        User user = null;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement pstmt = con.prepareStatement(
                "select * from user where id=?")) {
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
//                String name = set.getString("name");
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setAbout(set.getString("about"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
