package com.example.app2;

import DAO.CommentsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Comment;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CommentServlet", value = "/commentservlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String comentario = request.getParameter("comentario");
        int calificacion = 5;
        int id_product = 1;

        Comment comment = new Comment();
        comment.setTitulo(titulo);
        comment.setComentario(comentario);
        comment.setCalificacion(calificacion);
        comment.setId_product(id_product);

        CommentsDAO commentsDAO = new CommentsDAO();
        try {
            commentsDAO.createComment(comment);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("index.jsp");
    }
}
