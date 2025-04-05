//package com.tech.blog.dao;
//
//import com.tech.blog.entities.Category;
//import com.tech.blog.entities.Post;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;

//new import
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao() {
//        if (con == null) {
//            throw new IllegalArgumentException("Database connection is null!");
//        }
//        this.con = con;
    }

//    public ArrayList<Category> getAllCategories() {
//        ArrayList<Category> list = new ArrayList<>();
//
//        try {
//            String q = "select * from categories";
//            Statement st = con.createStatement();
//            ResultSet rs = st.executeQuery(q);
//            while (rs.next()) {
//                int cid = rs.getInt("cid");
//                String name = rs.getString("name");
//                String description = rs.getString("description");
//                Category c = new Category(cid, name, description);
//                list.add(c);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    ////        try {
////            con.close();
////        } catch (SQLException ex) {
////            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
////        }
//        return list;
//    }

    //new Code
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try (Connection con = ConnectionProvider.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("select * from categories")) {
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    
//    public boolean savePost(Post p) {
//        boolean f = false;
//
//        try {
//
//            String q = "INSERT INTO POSTS(pTitle, pContent, pCode, pPic,catId, userId) values(?,?,?,?,?,?)";
//            PreparedStatement pstmt = con.prepareStatement(q);
//            pstmt.setString(1, p.getpTitle());
//            pstmt.setString(2, p.getpContent());
//            pstmt.setString(3, p.getpCode());
//            pstmt.setString(4, p.getpPic());
//            pstmt.setInt(5, p.getCatId());
//            pstmt.setInt(6, p.getUserId());
//
//            pstmt.executeUpdate();
//            f = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        try {
//            con.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return f;
//    }
    //new Code
    public boolean savePost(Post p) {
        boolean f = false;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO posts(pTitle, pContent, pCode, pPic, catId, userId) VALUES(?,?,?,?,?,?)")) {
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    // get all posts
//    public List<Post> getAllPosts() {
//        List<Post> list = new ArrayList<>();
//
//        // fetch all the post
//        try {
//            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
//            ResultSet set = p.executeQuery();
//            while (set.next()) {
//                int pid = set.getInt("pid");
//                String pTitle = set.getString("pTitle");
//                String pContent = set.getString("pContent");
//                String pCode = set.getString("pCode");
//                String pPic = set.getString("pPic");
//                Timestamp date = set.getTimestamp("pDate");
//                int catId = set.getInt("catId");
//                int userId = set.getInt("userId");
//                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
//                list.add(post);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    ////        try {
////            con.close();
////        } catch (SQLException ex) {
////            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
////        }
//        return list;
//    }

    
    //new Code
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement p = con.prepareStatement("select * from posts order by pid desc"); ResultSet set = p.executeQuery()) {
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //  get post by category
//    public List<Post> getPostByCatId(int catId) {
//        List<Post> list = new ArrayList<>();
//
//        // fetch all the post by the category Id
//        try {
//            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
//            p.setInt(1, catId);
//            ResultSet set = p.executeQuery();
//            while (set.next()) {
//                int pid = set.getInt("pid");
//                String pTitle = set.getString("pTitle");
//                String pContent = set.getString("pContent");
//                String pCode = set.getString("pCode");
//                String pPic = set.getString("pPic");
//                Timestamp date = set.getTimestamp("pDate");
//
//                int userId = set.getInt("userId");
//                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
//                list.add(post);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return list;
//    }
    //new Code
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement p = con.prepareStatement("select * from posts where catId=?")) {
            p.setInt(1, catId);
            try (ResultSet set = p.executeQuery()) {
                while (set.next()) {
                    int pid = set.getInt("pid");
                    String pTitle = set.getString("pTitle");
                    String pContent = set.getString("pContent");
                    String pCode = set.getString("pCode");
                    String pPic = set.getString("pPic");
                    Timestamp date = set.getTimestamp("pDate");
                    int userId = set.getInt("userId");
                    Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                    list.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    //  get post by post id
//    public Post getPostByPostId(int postId) {
//        Post post = null;
//
//        // fetch all the post by the category Id
//        try {
//            PreparedStatement p = this.con.prepareStatement("select * from posts where pid=?");
//            p.setInt(1, postId);
//            ResultSet set = p.executeQuery();
//            while (set.next()) {
//                int pid = postId;
//                String pTitle = set.getString("pTitle");
//                int catId = set.getInt("catId");
//                String pContent = set.getString("pContent");
//                String pCode = set.getString("pCode");
//                String pPic = set.getString("pPic");
//                Timestamp date = set.getTimestamp("pDate");
//
//                int userId = set.getInt("userId");
//                post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
//
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    ////        try {
////            con.close();
////        } catch (SQLException ex) {
////            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
////        }
//        return post;
//    }
//}

// new Code
    
    public Post getPostByPostId(int postId) {
        Post post = null;
        try (Connection con = ConnectionProvider.getConnection(); PreparedStatement p = con.prepareStatement("select * from posts where pid=?")) {
            p.setInt(1, postId);
            try (ResultSet set = p.executeQuery()) {
                if (set.next()) {
                    int pid = postId;
                    String pTitle = set.getString("pTitle");
                    int catId = set.getInt("catId");
                    String pContent = set.getString("pContent");
                    String pCode = set.getString("pCode");
                    String pPic = set.getString("pPic");
                    Timestamp date = set.getTimestamp("pDate");
                    int userId = set.getInt("userId");
                    post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }
}
