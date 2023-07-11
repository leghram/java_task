package DAO;

import modelos.Comment;
import utils.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentsDAO {


    public List<Comment> getAllComments() throws SQLException {
        List<Comment> comments = new ArrayList<>();

        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM comments");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Comment comment = new Comment();
                comment.setId(resultSet.getInt("id"));
                comment.setTitulo(resultSet.getString("titulo"));
                comment.setComentario(resultSet.getString("comentario"));

                comments.add(comment);
            }
        }

        return comments;
    }

    public List<Comment> getAllCommentsByIdProduct(int idProduct) throws SQLException {
        List<Comment> comments = new ArrayList<>();

        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM comments where id_product="+idProduct);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Comment comment = new Comment();
                comment.setId(resultSet.getInt("id"));
                comment.setTitulo(resultSet.getString("titulo"));
                comment.setComentario(resultSet.getString("comentario"));
                comment.setCalificacion(resultSet.getInt("calificacion"));

                comments.add(comment);
            }
        }

        return comments;
    }

    public void createComment (Comment comment) throws SQLException {
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO comments (titulo, comentario, calificacion, id_product) VALUES (?, ?, ?, ?)")) {
            statement.setString(1, comment.getTitulo());
            statement.setString(2, comment.getComentario());
            statement.setInt(3, comment.getCalificacion());
            statement.setInt(4, comment.getId_product());

            statement.executeUpdate();
        }
    }



}
