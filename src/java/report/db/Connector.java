package report.db;

import java.sql.*;

public class Connector {

    public Connection connect() {
        try {
            String username = "root";
            String password = "admin";
            String url = "jdbc:mysql://localhost:3306/person";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            return conn;
        } catch (Exception e) {
            System.out.println("Exception in connection:" + e.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(new Connector().connect());
    }
}
