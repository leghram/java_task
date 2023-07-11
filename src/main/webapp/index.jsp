<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DAO.ProductsDAO" %>

<%@ page import="modelos.Product" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Trabajo java</title>
    <link rel="stylesheet" href="./css/general.css" />
    <link rel="stylesheet" href="./css/home.css" />
  </head>

  <body>

  <%
    ProductsDAO productDAO = new ProductsDAO();
  %>



    <div class="body-content">
      <div class="header-home">
        <h1>Lista de Productos: </h1>
        <button>Crear Nuevo</button>
      </div>

        <div class="content-header">
          <p>Nombre</p>
          <p class="detalles">Detalles</p>
        </div>
        <div class="content-data">

          <%

            try {
              List<Product> products = productDAO.getAllProducts();

                for (Product product : products) {

                %>

                <div class="row-data">
                  <p class="row-name"><%= product.getName() %></p>
                  <a href="productos.jsp?id=<%= product.getId() %>">Ver</a>
                </div>

                <%

                }
              } catch (SQLException e) {
                e.printStackTrace();
              }
          %>




        </div>
    </div>
  </body>
</html>
