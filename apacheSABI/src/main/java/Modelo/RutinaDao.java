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

    public List<Rutina> listar() {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("Usuario eliminado correctamente");
            } else {
                System.out.println("No se encontró el usuario con ID: " + idUsuario);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al eliminar usuario: " + e.getMessage());
        }
        return r;
    }
}
