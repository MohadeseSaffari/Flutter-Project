import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Connections {
    static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection =DriverManager.getConnection("jdbc:mysql://localhost:3308/AdminLogin", "root", "");
            return connection;
        } catch (Exception e) {
            System.out.println("" + e);
        }
        return null;
    }
}
