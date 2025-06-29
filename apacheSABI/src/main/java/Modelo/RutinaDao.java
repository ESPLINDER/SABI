package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

/**
 * @author William
 */
public class RutinaDao {
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int idRutina = 0;
    
    public int GuardarAutor(Rutina rutina) {
        String sql = "INSERT INTO rutina (nomRutina, semanasRutina, descRutina, nivelRutina, creacionRutina, autorRutina) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, rutina.getNomRutina());
            ps.setInt(2, rutina.getSemanasRutina());
            ps.setString(3, rutina.getDescRutina());
            ps.setString(4, rutina.getNivelRutina());
            ps.setDate(5, java.sql.Date.valueOf(rutina.getCreacionRutina()));
            ps.setInt(6, rutina.getAutRutina());
            
            ps.executeUpdate();
            idRutina = IdRutina(rutina);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return idRutina;
    }
     public int IdRutina (Rutina rutina){
        String sql = "SELECT idRutina FROM rutina where nomRutina = ?";
        
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, rutina.getNomRutina());
            idRutina = rs.getInt("idRutina");
            
            ps.executeUpdate();
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return idRutina;
     }
}
