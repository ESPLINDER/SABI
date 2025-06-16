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
    int r;
    
    public Usuario Validar(String email, String pass) throws ClassNotFoundException {
        Usuario obj_usu = new Usuario();
        String sql = "SELECT * FROM usuarios WHERE emaUsuario = ? AND passUsuario = ?;";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                obj_usu.setIdUsuario(rs.getInt("idUsuario"));
                obj_usu.setNomUsuario(rs.getString("nomUsuario"));
                obj_usu.setApeUsuario(rs.getString("apeUsuario"));
                obj_usu.setEmaUsuario(rs.getString("emaUsuario"));
                obj_usu.setPassUsuario(rs.getString("passUsuario"));
                String[] roles = {rs.getString("rolUsuario")};
                obj_usu.setRolUsuario(roles);
            }
        } catch (SQLException e) {
            System.out.println("Correo o contraseña invalidos");
        }
        return obj_usu;
    }
    
    public List<Usuario> listar() {
        String sql = "SELECT idUsuario, nomUsuario, apeUsuario, emaUsuario FROM usuarios";
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
    
