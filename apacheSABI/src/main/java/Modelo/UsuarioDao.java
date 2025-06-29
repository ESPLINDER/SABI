package Modelo;

import Config.Conexion; // Importa la clase de conexión
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author UnPendejo
 */
public class UsuarioDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario ValidarUsuario(String emaUsuario, String passUsuario) throws ClassNotFoundException {
        Usuario usuario = new Usuario();
        String sql = "SELECT * FROM usuario WHERE emaUsuario = ? AND passUsuario = ?;";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, emaUsuario);
            ps.setString(2, passUsuario);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNomUsuario(rs.getString("nomUsuario"));
                usuario.setApeUsuario(rs.getString("apeUsuario"));
                usuario.setEmaUsuario(rs.getString("emaUsuario"));
                usuario.setPassUsuario(rs.getString("passUsuario"));
                usuario.setTipDocumento(rs.getString("tipDocumento"));
                usuario.setNumDocumento(rs.getInt("numDocumento"));
                usuario.setCiudadUsuario(rs.getString("ciudadUsuario"));
                usuario.setRolUsuario(rs.getString("rolUsuario"));
                usuario.setEspecialidad(rs.getString("especialidad"));
                usuario.setXpAños(rs.getFloat("xpAños"));
                usuario.setBiografia(rs.getString("biografia"));
                usuario.setPromCalificacion(rs.getFloat("promCalificacion"));
                usuario.setEstadoUsuario(rs.getString("estadoUsuario"));
            }
        } catch (SQLException e) {
            System.out.println("Correo o contraseña invalidos");
        }
        return usuario;
    }
    
    // Método para agregar un nuevo usuario
    public int Agregar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, apellido, email, password, tipo_documento, numero_documento, ciudad, rol, especialidad, xp_años, biografia, prom_calificacion, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps.setString(1, usuario.getNomUsuario());
            ps.setString(2, usuario.getApeUsuario());
            ps.setString(3, usuario.getEmaUsuario());
            ps.setString(4, usuario.getPassUsuario()); // Sin hash por ahora
            ps.setString(5, usuario.getTipDocumento());
            ps.setInt(6, usuario.getNumDocumento());
            ps.setString(7, usuario.getCiudadUsuario());
            ps.setString(8, usuario.getRolUsuario());
            ps.setString(9, usuario.getEspecialidad());
            ps.setFloat(10, usuario.getXpAños());
            ps.setString(11, usuario.getBiografia());
            ps.setFloat(12, usuario.getPromCalificacion());
            ps.setString(13, usuario.getEstadoUsuario());

            return ps.executeUpdate(); // Retorna el número de filas afectadas
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Retorna 0 si hay un error
        }
    }

    // Método para verificar si existe un email
    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE email = ?";
        try {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Retorna true si existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Retorna false si no existe
    }

    // Método para verificar si existe un número de documento
    public boolean existeDocumento(int numeroDocumento) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE numero_documento = ?";
        try {
            ps.setInt(1, numeroDocumento);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Retorna true si existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Retorna false si no existe
    }
    // Método para obtener un usuario por su ID

    public Usuario listarPorId(int idUsuario) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        Usuario usuario = null;
        try {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id"));
                usuario.setNomUsuario(rs.getString("nombre"));
                usuario.setApeUsuario(rs.getString("apellido"));
                usuario.setEmaUsuario(rs.getString("email"));
                usuario.setPassUsuario(rs.getString("password"));
                usuario.setTipDocumento(rs.getString("tipo_documento"));
                usuario.setNumDocumento(rs.getInt("numero_documento"));
                usuario.setCiudadUsuario(rs.getString("ciudad"));
                usuario.setRolUsuario(rs.getString("rol"));
                usuario.setEspecialidad(rs.getString("especialidad"));
                usuario.setXpAños(rs.getFloat("xp_años"));
                usuario.setBiografia(rs.getString("biografia"));
                usuario.setPromCalificacion(rs.getFloat("prom_calificacion"));
                usuario.setEstadoUsuario(rs.getString("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario; // Devuelve null si no se encuentra
    }

   public List<Usuario> listarEntrenadores() {
    List<Usuario> lista = new ArrayList<>();
    String sql = "SELECT * FROM usuario WHERE rolUsuario = 'entrenador'";
    try {
        conn = cn.Conexion();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(rs.getInt("idUsuario"));
            usuario.setNomUsuario(rs.getString("nomUsuario"));
            usuario.setApeUsuario(rs.getString("apeUsuario"));
            usuario.setEmaUsuario(rs.getString("emaUsuario"));
            usuario.setPassUsuario(rs.getString("passUsuario"));
            usuario.setTipDocumento(rs.getString("tipDocumento"));
            usuario.setNumDocumento(rs.getInt("numDocumento"));
            usuario.setCiudadUsuario(rs.getString("ciudadUsuario"));
            usuario.setRolUsuario(rs.getString("rolUsuario"));
            usuario.setEspecialidad(rs.getString("especialidad"));
            usuario.setXpAños(rs.getFloat("xpAños"));
            usuario.setBiografia(rs.getString("biografia"));
            usuario.setPromCalificacion(rs.getFloat("promCalificacion"));
            usuario.setEstadoUsuario(rs.getString("estadoUsuario"));
            lista.add(usuario);
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("Error al listar");
    }
    return lista;
   }
}

