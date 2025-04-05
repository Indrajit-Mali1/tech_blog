//package com.tech.blog.helper;
//
//import java.sql.*;
//
//public class ConnectionProvider {
//
//    private static Connection con;
//
//    public static Connection getConnection() {
//        try {
//            if (con == null) {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return con;
//    }
//}


//new Code

package com.tech.blog.helper;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ConnectionProvider {
    private static DataSource dataSource;

    static {
        try {
            InitialContext ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TechBlogDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}