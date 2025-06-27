package Modelo;

import Config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SDC
 */
public class UsuarioDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r; //Valor que se retorna al agregar un nuevo registro

    public Usuario Validar(String email, String pass) throws ClassNotFoundException {
        Usuario obj_usu = new Usuario();
        String sql = "SELECT * FROM usuario WHERE emaUsuario = ? AND passUsuario = ? AND estadoUsuario = 'activo';";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                obj_usu.setIdUsuario(rs.getInt("idUsuario"));
                obj_usu.setnomUsuario(rs.getString("nomUsuario"));
                obj_usu.setapeUsuario(rs.getString("apeUsuario")); // CORREGIDO: era setnomUsuario
                obj_usu.setEmaUsuario(rs.getString("emaUsuario"));
                obj_usu.setPassUsuario(rs.getString("passUsuario"));
                obj_usu.setTipDocumento(rs.getString("tipDocumento"));
                obj_usu.setNumDocumento(rs.getInt("numDocumento"));
                obj_usu.setCiudadUsuario(rs.getString("ciudadUsuario"));
                obj_usu.setRolUsuario(rs.getString("rolUsuario"));
                obj_usu.setEspecialidad(rs.getString("especialidad"));
                obj_usu.setXpAños(rs.getFloat("xpAños"));
                obj_usu.setBiografia(rs.getString("biografia"));
                obj_usu.setPromCalificacion(rs.getInt("promCalificacion"));
                obj_usu.setEstadoUsuario(rs.getString("estadoUsuario"));
            }
        } catch (SQLException e) {
            System.out.println("Correo o contraseña invalidos: " + e.getMessage());
        }
        return obj_usu;
    }

    public List<Usuario> listar() {
        String sql = "SELECT * FROM usuario WHERE estadoUsuario = 'activo'";
        List<Usuario> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setnomUsuario(rs.getString("nomUsuario"));
                usu.setapeUsuario(rs.getString("apeUsuario")); // CORREGIDO: era setnomUsuario
                usu.setEmaUsuario(rs.getString("emaUsuario"));
                usu.setPassUsuario(rs.getString("passUsuario"));
                usu.setTipDocumento(rs.getString("tipDocumento"));
                usu.setNumDocumento(rs.getInt("numDocumento"));
                usu.setCiudadUsuario(rs.getString("ciudadUsuario"));
                usu.setRolUsuario(rs.getString("rolUsuario"));
                usu.setEspecialidad(rs.getString("especialidad"));
                usu.setXpAños(rs.getFloat("xpAños"));
                usu.setBiografia(rs.getString("biografia"));
                usu.setPromCalificacion(rs.getInt("promCalificacion"));
                usu.setEstadoUsuario(rs.getString("estadoUsuario"));
                lista.add(usu);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de usuarios: " + e.getMessage());
        }
        return lista;
    }

    public Usuario ListarId(int id) {
        Usuario usu = new Usuario();
        String sql = "SELECT * FROM usuario WHERE idUsuario = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setnomUsuario(rs.getString("nomUsuario"));
                usu.setapeUsuario(rs.getString("apeUsuario")); // CORREGIDO: era setnomUsuario
                usu.setEmaUsuario(rs.getString("emaUsuario"));
                usu.setPassUsuario(rs.getString("passUsuario"));
                usu.setTipDocumento(rs.getString("tipDocumento"));
                usu.setNumDocumento(rs.getInt("numDocumento"));
                usu.setCiudadUsuario(rs.getString("ciudadUsuario"));
                usu.setRolUsuario(rs.getString("rolUsuario"));
                usu.setEspecialidad(rs.getString("especialidad"));
                usu.setXpAños(rs.getFloat("xpAños"));
                usu.setBiografia(rs.getString("biografia"));
                usu.setPromCalificacion(rs.getInt("promCalificacion"));
                usu.setEstadoUsuario(rs.getString("estadoUsuario"));
            }
        } catch (Exception e) {
            System.out.println("Error al seleccionar el usuario: " + e.getMessage());
        }
        return usu;
    }

    public int Agregar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nomUsuario, apeUsuario, emaUsuario, passUsuario, " +
                    "tipDocumento, numDocumento, ciudadUsuario, rolUsuario, especialidad, " +
                    "xpAños, biografia, promCalificacion, estadoUsuario) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // CORREGIDO: usuario no usuarios
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, usuario.getnomUsuario());
            ps.setString(2, usuario.getapeUsuario());
            ps.setString(3, usuario.getEmaUsuario());
            ps.setString(4, usuario.getPassUsuario());
            ps.setString(5, usuario.getTipDocumento());
            ps.setInt(6, usuario.getNumDocumento());
            ps.setString(7, usuario.getCiudadUsuario());
            ps.setString(8, usuario.getRolUsuario());
            ps.setString(9, usuario.getEspecialidad());
            ps.setFloat(10, usuario.getXpAños());
            ps.setString(11, usuario.getBiografia());
            ps.setInt(12, usuario.getPromCalificacion());
            ps.setString(13, usuario.getEstadoUsuario());
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("Usuario agregado correctamente");
            } else {
                System.out.println("No se pudo agregar el usuario");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return r;
    }

    public int Actualizar(Usuario usu) {
        String sql = "UPDATE usuario SET nomUsuario = ?, apeUsuario = ?, emaUsuario = ?, " +
                    "passUsuario = ?, tipDocumento = ?, numDocumento = ?, ciudadUsuario = ?, " +
                    "rolUsuario = ?, especialidad = ?, xpAños = ?, biografia = ?, " +
                    "promCalificacion = ?, estadoUsuario = ? WHERE idUsuario = ?"; // CORREGIDO: usuario no usuarios
        System.out.println("Actualizando usuario con ID: " + usu.getIdUsuario());
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, usu.getnomUsuario());
            ps.setString(2, usu.getapeUsuario());
            ps.setString(3, usu.getEmaUsuario());
            ps.setString(4, usu.getPassUsuario());
            ps.setString(5, usu.getTipDocumento());
            ps.setInt(6, usu.getNumDocumento());
            ps.setString(7, usu.getCiudadUsuario());
            ps.setString(8, usu.getRolUsuario());
            ps.setString(9, usu.getEspecialidad());
            ps.setFloat(10, usu.getXpAños());
            ps.setString(11, usu.getBiografia());
            ps.setInt(12, usu.getPromCalificacion());
            ps.setString(13, usu.getEstadoUsuario());
            ps.setInt(14, usu.getIdUsuario());
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("Usuario actualizado correctamente");
            } else {
                System.out.println("No se pudo actualizar el usuario");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al actualizar usuario: " + e.getMessage());
        }
        return r;
    }
    
    // Método para eliminar físicamente un usuario (usar con precaución no QUIERO ERRORES)
    public int Eliminar(int idUsuario) {
        String sql = "DELETE FROM usuario WHERE idUsuario = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("Usuario eliminado físicamente");
            } else {
                System.out.println("No se encontró el usuario con ID: " + idUsuario);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al eliminar usuario físicamente: " + e.getMessage());
        }
        return r;
    }
    
    // Método para listar usuarios por rol
    public List<Usuario> listarPorRol(String rol) {
        String sql = "SELECT * FROM usuario WHERE rolUsuario = ? AND estadoUsuario = 'activo' ORDER BY nomUsuario";
        List<Usuario> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, rol);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setnomUsuario(rs.getString("nomUsuario"));
                usu.setapeUsuario(rs.getString("apeUsuario")); // CORREGIDO: era setnomUsuario
                usu.setEmaUsuario(rs.getString("emaUsuario"));
                usu.setPassUsuario(rs.getString("passUsuario"));
                usu.setTipDocumento(rs.getString("tipDocumento"));
                usu.setNumDocumento(rs.getInt("numDocumento"));
                usu.setCiudadUsuario(rs.getString("ciudadUsuario"));
                usu.setRolUsuario(rs.getString("rolUsuario"));
                usu.setEspecialidad(rs.getString("especialidad"));
                usu.setXpAños(rs.getFloat("xpAños"));
                usu.setBiografia(rs.getString("biografia"));
                usu.setPromCalificacion(rs.getInt("promCalificacion"));
                usu.setEstadoUsuario(rs.getString("estadoUsuario"));
                lista.add(usu);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de usuarios por rol: " + e.getMessage());
        }
        return lista;
    }
    
    // Método para verificar si existe un email se usa el boolean para evitar datos previamente registrados en BD
    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE emaUsuario = ?";
        boolean existe = false;
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                existe = rs.getInt(1) > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al verificar email: " + e.getMessage());
        } finally {
            cerrarConexion(); // AÑADIDO: cerrar conexión
        }
        return existe;
    }
    
    // Método para verificar si existe un número de documento se usa el boolean para evitar datos previamente registrados en BD 
    public boolean existeDocumento(int numDocumento) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE numDocumento = ?";
        boolean existe = false;
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, numDocumento);
            rs = ps.executeQuery();
            if (rs.next()) {
                existe = rs.getInt(1) > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al verificar documento: " + e.getMessage());
        } finally {
            cerrarConexion(); // AÑADIDO: cerrar conexión
        }
        return existe;
    }
    
    // Método adicional para cerrar la conexión
    public void cerrarConexion() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}