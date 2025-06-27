package Modelo;

import Config.Conexion; // Importa la clase de conexión
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDao {
    private Connection connection;

    public UsuarioDao() {
        try {
            // Inicializa la conexión a la base de datos
            this.connection = new Conexion().Conexion();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Método para agregar un nuevo usuario
    public int Agregar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, apellido, email, password, tipo_documento, numero_documento, ciudad, rol, especialidad, xp_años, biografia, prom_calificacion, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
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
        } finally {
            cerrarConexion(); // Cierra la conexión después de la operación
        }
    }

    // Método para verificar si existe un email
    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Retorna true si existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexion(); // Cierra la conexión después de la operación
        }
        return false; // Retorna false si no existe
    }

    // Método para verificar si existe un número de documento
    public boolean existeDocumento(int numeroDocumento) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE numero_documento = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, numeroDocumento);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Retorna true si existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarConexion(); // Cierra la conexión después de la operación
        }
        return false; // Retorna false si no existe
    }

    // Método para cerrar la conexión
    private void cerrarConexion() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexión cerrada");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
