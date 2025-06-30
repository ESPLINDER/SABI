package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
        // Le decimos al PreparedStatement que queremos las claves generadas (como el id autoincremental)
        ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        ps.setString(1, rutina.getNomRutina());
        ps.setInt(2, rutina.getSemanasRutina());
        ps.setString(3, rutina.getDescRutina());
        ps.setString(4, rutina.getNivelRutina());
        ps.setDate(5, java.sql.Date.valueOf(rutina.getCreacionRutina()));
        ps.setInt(6, rutina.getAutRutina());

        int filas = ps.executeUpdate();

        // Recuperamos la clave generada si el insert fue exitoso
        if (filas > 0) {
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idRutina = rs.getInt(1); // La primera columna de las claves generadas
            }
        }

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("Error al agregar rutina: " + e.getMessage());
    }
    return idRutina;
}
}
