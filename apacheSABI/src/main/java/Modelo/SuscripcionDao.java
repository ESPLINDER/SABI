package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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

    public List<Suscripcion> listarSuscripcionesCliente(int idCliente) {
    List<Suscripcion> lista = new ArrayList<>();
    String sql = "SELECT s.idSuscripcion, s.fkIdEntrenador, s.fkIdCliente, "
               + "s.inicioSuscripcion, s.finSuscripcion, s.estadoSuscripcion, "
               + "s.renovaciones, s.valorSuscripcion, s.estadoPagoSuscripcion, "
               + "u.nomUsuario, u.apeUsuario "
               + "FROM suscripcion s "
               + "JOIN usuario u ON s.fkIdEntrenador = u.idUsuario "
               + "WHERE s.fkIdCliente = ?";

    try {
        conn = cn.Conexion();
        ps = conn.prepareStatement(sql);
        ps.setInt(1, idCliente);
        rs = ps.executeQuery();

        while (rs.next()) {
            Suscripcion suscripcion = new Suscripcion();
            Usuario entrenador = new Usuario();

            suscripcion.setIdSuscripcion(rs.getInt("idSuscripcion"));
            suscripcion.setFkIdEntrenador(rs.getInt("fkIdEntrenador"));
            suscripcion.setFkIdCliente(rs.getInt("fkIdCliente"));
            suscripcion.setInicioSuscripcion(rs.getDate("inicioSuscripcion").toLocalDate());
            suscripcion.setFinSuscripcion(rs.getDate("finSuscripcion").toLocalDate());
            suscripcion.setEstadoSuscripcion(rs.getString("estadoSuscripcion"));
            suscripcion.setRenovaciones(rs.getInt("renovaciones"));
            suscripcion.setValorSuscripcion(rs.getFloat("valorSuscripcion"));
            suscripcion.setEstadoPagoSuscripcion(rs.getString("estadoPagoSuscripcion"));

            entrenador.setNomUsuario(rs.getString("nomUsuario"));
            entrenador.setApeUsuario(rs.getString("apeUsuario"));

            suscripcion.setEntrenador(entrenador);
            lista.add(suscripcion);
            System.out.println(suscripcion);
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("Error al listar: " + e.getMessage());
    }

    return lista;
}

    public List<Suscripcion> listarSuscripcionesEntrenador(int idUsuario) {
        List<Suscripcion> lista = new ArrayList<>();
        String sql = "SELECT s.idSuscripcion, s.fkIdEntrenador, s.fkIdCliente, "
                + "s.inicioSuscripcion, s.finSuscripcion, s.estadoSuscripcion, "
                + "s.renovaciones, s.valorSuscripcion, "
                + "u.nomUsuario FROM suscripcion s "
                + "JOIN usuario u ON s.fkIdEntrenador = u.idUsuario "
                + "WHERE s.fkIdCliente = ?";
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

    public boolean crearSuscripcionPorDefecto(int idCliente, int idEntrenador) throws ClassNotFoundException {
        LocalDate inicio = LocalDate.now();
        LocalDate fin = inicio.plusMonths(1);
        String estado = "inactiva";
        int renovaciones = 0;
        float valor = 0.0f;

        String sql = "INSERT INTO suscripcion (fkIdEntrenador, fkIdCliente, inicioSuscripcion, finSuscripcion, estadoSuscripcion, renovaciones, valorSuscripcion) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, idEntrenador);
            ps.setInt(2, idCliente);
            ps.setDate(3, java.sql.Date.valueOf(inicio));
            ps.setDate(4, java.sql.Date.valueOf(fin));
            ps.setString(5, estado);
            ps.setInt(6, renovaciones);
            ps.setFloat(7, valor);
            r = ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
