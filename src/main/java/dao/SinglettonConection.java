package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SinglettonConection {
    private static Connection connection;

    private SinglettonConection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_cata", "root", "");
        } catch (ClassNotFoundException var2) {
            ClassNotFoundException e = var2;
            e.printStackTrace();
        }

    }

    public static Connection getInstance() throws SQLException {
        if (connection == null) {
            new SinglettonConection();
        }

        return connection;
    }
}
