<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Trabajo java</title>
    <link rel="stylesheet" href="./css/general.css" />
    <link rel="stylesheet" href="./css/home.css" />
  </head>

  <body>

  <%
    Connection conn = null;
    String message = "";
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://mysql:3306/java?useSSL=false";
      String username = "myuser";
      String password = "mypassword";

      try {
        conn = DriverManager.getConnection(url, username, password);
        message = "¡Conexión exitosa a la base de datos!";
      } catch (SQLException ex) {
        // Capturar errores específicos de la conexión
        if (ex instanceof SQLInvalidAuthorizationSpecException) {
          message = "Error de autenticación: nombre de usuario o contraseña incorrectos.";
        } else if (ex instanceof SQLNonTransientConnectionException) {
          message = "Error de conexión: no se pudo establecer la conexión.";
        } else {
          message = "Error de conexión a la base de datos: " + ex.getMessage();
        }
      } finally {
        if (conn != null) {
          try {
            conn.close();
          } catch (SQLException ex) {
            ex.printStackTrace();
          }
        }
      }
    } catch (ClassNotFoundException ex) {
      // Capturar errores de carga del controlador JDBC
      message = "Error al cargar el controlador JDBC: " + ex.getMessage();
    }
  %>
    <h1><%= message %></h1>

    <div class="body-content">
      <div class="header-home">
        <h1>Lista de Productos</h1>
        <button>Crear Nuevo</button>
      </div>
      <div class="content-data">
        <p>Nombre</p>
        <p>Actions</p>
      </div>
    </div>
  </body>
</html>
