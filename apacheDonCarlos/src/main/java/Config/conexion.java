package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author AndresM
 */
public class conexion {

    Connection conn;
    String url = "jdbc:mysql://localhost:3306/nombre_db";
    String user = "root";
    String pass = "";

    public Connection Conexion() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {

        }
        return conn;
    }
}
