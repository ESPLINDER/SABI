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
    try {
        conn = cn.Conexion();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        ps.setInt(1, idUsuario);
        while (rs.next()) {
            Suscripcion suscripcion = new Suscripcion();
            suscripcion.setIdSuscripcion(rs.getInt("idUsuario"));
            suscripcion.setFkIdEntrenador(rs.getInt("fkIdEntrenador"));
            suscripcion.setFkIdCliente(rs.getInt("FkIdCliente"));
            suscripcion.setInicioSuscripcion(rs.getDate("inicioSuscripcion").toLocalDate());
            suscripcion.setFinSuscripcion(rs.getDate("finSuscripcion").toLocalDate());
            suscripcion.setEstadoSuscripcion(rs.getString("estadoSsucripcion"));
            suscripcion.setRenovaciones(rs.getInt("renovaciones"));
            suscripcion.setValorSuscripcion(rs.getFloat("valorSuscripcion"));
            lista.add(suscripcion);
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("Error al listar");
    }
    return lista;
   }
}