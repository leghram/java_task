<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.ProductsDAO" %>
<%@ page import="modelos.Product" %>
<%@ page import="DAO.CommentsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="modelos.Comment" %>

<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="./css/general.css" />
  <link rel="stylesheet" href="./css/productos.css" />
</head>
<body>
  <%
    ProductsDAO productDAO = new ProductsDAO();
    CommentsDAO commentsDAO = new CommentsDAO();
  %>
  <a class="link-home" href="index.jsp">← Inicio</a>

  <%
    String idProductParam = request.getParameter("id");
    int idProduct = Integer.parseInt(idProductParam);
    Product product = productDAO.getProductById(idProduct);
  %>


    <div class="body-info">
      <div class="primary-container">
        <p class="resena-msg">Escribir una resena del producto</p>
        <div class="produc-details">
          <div class="img-container">
            <img
              class="imagen-producto"
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDwiveKr_qfuQqq5mnM6xf2Ashcw1ckH_C5A&usqp=CAU"
              alt=""
            />
          </div>
          <div class="info-container">
            <h1> <%= product.getName() %></h1>
            <p><%= product.getDescription() %></p>
            <p>s/.  <%= product.getPrice() %></p>
          </div>
        </div>

        <form action="commentservlet" method="POST">
          <div class="product-calification">
            <p>Califica este product NO QUIERo</p>
            <div class="product-starts">
              <p>Estrellas</p>
              <p>Excelente</p>
            </div>
          </div>
          <div class="coment-container">
            <label for="input-titulo">Titulo</label>
            <input
              id="input-titulo"
              type="text"
              placeholder="escribe aqui"
              name="titulo"
            />
          </div>
          <div class="coment-container">
            <label for="input-comentario">Comentarios</label>
            <input
              id="input-comentario"
              type="text"
              placeholder="escribe aqui"
              name="comentario"
            />
          </div>
          <div class="btn-container">
            <input type="submit" value="Publicar" name="" id="" />
          </div>
        </form>
      </div>


      <div class="space-comments">
        <h2>Comments</h2>

        <%
          List<Comment> comments = commentsDAO.getAllCommentsByIdProduct(idProduct);


          for (Comment comment : comments) {
           %>

        <div class="row-comentario">
          <p><%= comment.getTitulo() %></p>
          <p><%= comment.getComentario() %></p>
        </div>
        <%

          }

        %>




      </div>
    </div>
  </body>
</html>
