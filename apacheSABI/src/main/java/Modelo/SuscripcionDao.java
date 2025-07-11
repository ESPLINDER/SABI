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
                suscripcion.setValorSuscripcion(rs.getInt("valorSuscripcion"));
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

    public List<Suscripcion> listarSuscripcionesEntrenador(int idEntrenador) {
        List<Suscripcion> lista = new ArrayList<>();
        String sql = "SELECT s.idSuscripcion, s.fkIdEntrenador, s.fkIdCliente, "
                + "s.inicioSuscripcion, s.finSuscripcion, s.estadoSuscripcion, "
                + "s.renovaciones, s.valorSuscripcion, s.estadoPagoSuscripcion, "
                + "u.nomUsuario, u.apeUsuario "
                + "FROM suscripcion s "
                + "JOIN usuario u ON s.fkIdCliente = u.idUsuario "
                + "WHERE s.fkIdEntrenador = ?";

        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idEntrenador);
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
                suscripcion.setValorSuscripcion(rs.getInt("valorSuscripcion"));
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

    public Suscripcion obtenerPorId(int idSuscripcionEditar) {
        Suscripcion sus = null;
        String sql = "SELECT * FROM suscripcion WHERE idSuscripcion = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idSuscripcionEditar);
            rs = ps.executeQuery();
            if (rs.next()) {
                sus = new Suscripcion();
                sus.setIdSuscripcion(rs.getInt("idSuscripcion"));
                sus.setFinSuscripcion(rs.getDate("finSuscripcion").toLocalDate());
                sus.setEstadoSuscripcion(rs.getString("estadoSuscripcion"));
                sus.setValorSuscripcion(rs.getInt("valorSuscripcion"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener suscripción por ID: " + e.getMessage());
        }
        return sus;
    }

    public boolean crearSuscripcionPorDefecto(int idCliente, int idEntrenador) throws ClassNotFoundException {
        LocalDate inicio = LocalDate.now();
        LocalDate fin = inicio.plusMonths(1);
        String estado = "inactiva";
        int renovaciones = 0;
        int valor = 0;

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
            ps.setInt(7, valor);
            r = ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int Actualizar(Suscripcion sus) {
        String sql = "UPDATE suscripcion SET finSuscripcion = ?, estadoSuscripcion = ?, valorSuscripcion = ? WHERE idSuscripcion = ?";
        System.out.println("Actualizando suscripcion: " + sus.getIdSuscripcion());
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);

            ps.setDate(1, java.sql.Date.valueOf(sus.getFinSuscripcion()));
            ps.setString(2, sus.getEstadoSuscripcion());
            ps.setFloat(3, sus.getValorSuscripcion());
            ps.setInt(4, sus.getIdSuscripcion());
            r = ps.executeUpdate();

            if (r > 0) {
                System.out.println("Suscripcion actualizada correctamente");
            } else {
                System.out.println("No se pudo actualizar la suscripcion");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al actualizar suscripcion: " + e.getMessage());
        }
        return r;
    }

    public boolean actualizarEstadoPago(int idSuscripcion) {
        String sql = "UPDATE suscripcion SET estadoPagoSuscripcion = 'activo' WHERE idSuscripcion = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idSuscripcion);
            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0;
        } catch (Exception e) {
            System.out.println("Error al actualizar estadoPagoSuscripcion: " + e.getMessage());
            return false;
        }
    }

    public int Eliminar(int idSuscripcion) {
        String sql = "DELETE FROM suscripcion WHERE idSuscripcion = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idSuscripcion);
            r = ps.executeUpdate();

            if (r > 0) {
                System.out.println("Suscripcion eliminada correctamente");
            } else {
                System.out.println("No se encontró la Suscripcion con ID: " + idSuscripcion);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al eliminar la Suscripcion: " + e.getMessage());
        }
        return r;
    }

    public int reporteSuscripciones(int idEntrenador) {
        int total = 0;
        String sql = "SELECT COUNT(*) AS total_clientes_bogota "
                + "FROM usuario u "
                + "INNER JOIN suscripcion s ON u.idUsuario = s.fkIdCliente "
                + "WHERE u.ciudadUsuario = 'Bogotá' AND s.fkIdEntrenador = ?";

        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idEntrenador);
            rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getInt("total_clientes_bogota");
            }

            System.out.println("Cantidad de clientes: "+ total);
        } catch (Exception e) {
            System.out.println("Error al contar clientes de Bogotá: " + e.getMessage());
        }

        return total;
    }

}
