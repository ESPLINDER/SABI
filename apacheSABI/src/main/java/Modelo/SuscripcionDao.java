package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rojas
 */
public class SuscripcionDao {
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public List<Suscripcion> listarSuscripciones(int idUsuario) {
    List<Suscripcion> lista = new ArrayList<>();
    String sql = "SELECT * FROM Suscripcion WHERE fkIdCliente = ?";
    Suscripcion suscripcion = null;
    try {
        conn = cn.Conexion();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        ps.setInt(1, idUsuario);
        while (rs.next()) {
            
            lista.add(suscripcion);
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("Error al listar");
    }
    return lista;
   }
}
