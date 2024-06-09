import java.sql.Connection;
import java.sql.DriverManager;

public class Connections {
      static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysq.jdbc.Driver");
            connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/AdminLogin", "root", "");
        } catch (Exception e) {
            System.out.println("" + e);
        }
        return connection;
    }
}