package Modelo;

import Config.conexion;
import Modelo.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SDC
 */
public class UsuarioDao {
    
    conexion cn = new conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public Usuario Validar(String email, String pass) throws ClassNotFoundException {
        Usuario obj_usu = new Usuario();
        String sql = "select idUsuario, nombre, apellido, email, rol, contrasena from Usuarios join rol_usu on idUsuario = id_usuario where email = ? and contrasena = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                obj_usu.setIdUsuario(rs.getInt("idUsuario"));
                obj_usu.setNomUsuario(rs.getString("nombre"));
                obj_usu.setApeUsuario(rs.getString("apellido"));
                obj_usu.setEmaUsuario(rs.getString("email"));
                obj_usu.setPassUsuario(rs.getString("contrasena"));
                String[] roles = {rs.getString("rol")};
                obj_usu.setRolUsuario(roles);
            }
        } catch (SQLException e) {
            
        }
        return obj_usu;
    }
    
    public List<Usuario> listar() {
        String sql = "select idUsuario, nombre, apellido, email, telefono from usuarios";
        List<Usuario> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setIdUsuario(rs.getInt(1));
                usu.setNomUsuario(rs.getString(2));
                usu.setApeUsuario(rs.getString(3));
                usu.setEmaUsuario(rs.getString(4));
                lista.add(usu);
            }
        } catch (ClassNotFoundException | SQLException e) {
            
        }
        return lista;
    }
}
    
