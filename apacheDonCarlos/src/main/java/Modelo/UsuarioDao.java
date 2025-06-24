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
                obj_usu.setRolUsuario(rs.getString("rolUsuario"));
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
            System.out.println("Error al generar lista de usuarios");
        }
        return lista;
    }

    public Usuario ListarId(int id) {
        Usuario usu = new Usuario();
        String sql = "SELECT * FROM USUARIOS where idUsuario =" + id;
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                usu.setIdUsuario(rs.getInt(1));
                usu.setEmaUsuario(rs.getString(2));
                usu.setPassUsuario(rs.getString(3));
                usu.setNomUsuario(rs.getString(4));
                usu.setApeUsuario(rs.getString(5));
                usu.setRolUsuario(rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Error al seleccionar el usuario");
        }
        return usu;
    }

    public int Actualizar(Usuario usu){
        String sql = "UPDATE USUARIOS SET nomUsuario = ?, apeUsuario = ?, emaUsuario = ?, passUsuario = ?, rolUsuario = ? where idUsuario = ?";
        System.out.println("vamos a actualizar");
        System.out.println("actualizando al usuario "+usu);
        try{
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, usu.getNomUsuario());
            ps.setString(2, usu.getApeUsuario());
            ps.setString(3, usu.getEmaUsuario());
            ps.setString(4, usu.getPassUsuario());
            ps.setString(5, usu.getRolUsuario());
            ps.setInt(6, usu.getIdUsuario());
            r = ps.executeUpdate();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error al actualizar usuario");
        }
        System.out.println(r);
        return r;
    }
    
    public int Agregar(Usuario usuario) {
        String sql = "INSERT INTO usuarios(idUsuario, nomUsuario, apeUsuario, emaUsuario, passUsuario, rolUsuario) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, usuario.getIdUsuario());
            ps.setString(2, usuario.getNomUsuario());
            ps.setString(3, usuario.getApeUsuario());
            ps.setString(4, usuario.getEmaUsuario());
            ps.setString(5, usuario.getPassUsuario());
            ps.setString(6, usuario.getRolUsuario());
            r = ps.executeUpdate();
            rs.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return r;
    }
}
