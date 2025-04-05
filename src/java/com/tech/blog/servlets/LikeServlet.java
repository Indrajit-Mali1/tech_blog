/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Indrajit
 */
public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            LikeDao ldao = new LikeDao();
            if (operation.equals("like")) {
                boolean isLiked = ldao.isLikedByUser(pid, uid);
//                out.println(isLiked);
                String str = "";
                if (isLiked) {
                    if(ldao.deleteLike(pid, uid)){
                        str="disliked";
                    }
                } else {
                    if(ldao.insertLike(pid, uid)){
                        str="liked";
                    }
                }
                out.println(str);
            }
            if (operation.equals("checkLike")) {
                boolean isLiked = ldao.isLikedByUser(pid, uid);
                out.println(isLiked);
               
            }
//            out.println("Data from server");
//            out.println(operation);
//            out.println(pid);
//            out.println(uid);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
