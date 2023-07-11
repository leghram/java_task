<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DAO.CommentsDAO" %>
<%@ page import="modelos.Comment" %>


<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String titulo = request.getParameter("titulo");
  String comentario = request.getParameter("comentario");
  int calificacion = Integer.parseInt(request.getParameter("calificacion"));
  int id_product = Integer.parseInt(request.getParameter("id_product"));


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

  response.sendRedirect(request.getContextPath() + "/productos.jsp?id=" + id_product);
%>
</body>
</html>
