package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author William
 */
public class RutinaDao {
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r;
}
