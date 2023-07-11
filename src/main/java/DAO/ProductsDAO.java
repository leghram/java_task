package DAO;

import modelos.Product;
import utils.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO {

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();

        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM products");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));


                products.add(product);
            }
        }

        return products;
    }

    public Product getProductById(int idProduct) throws SQLException {
        Product product = null;

        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM products WHERE id = ?");
        ) {
            statement.setInt(1, idProduct);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setDescription(resultSet.getString("description"));
                }
            }
        }

        return product;
    }



}
