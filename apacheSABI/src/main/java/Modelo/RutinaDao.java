package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

/**
 * @author William
 */
public class RutinaDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int idRutina = 0;
    int r;

    public void Delete(int idRutina) {
        String sql = "DELETE FROM rutina WHERE idRutina = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idRutina);
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("Usuario eliminado correctamente");
            } else {
                System.out.println("No se encontró el rutina con ID: " + idRutina);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al eliminar rutina: " + e.getMessage());
        }
    }
    
    public void Update(Rutina rutina){
        String sql = "UPDATE rutina SET nomRutina = ?, semanasRutina = ?, descRutina = ?, nivelRutina = ? WHERE idRutina = ?;";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);

            ps.setString(1, rutina.getNomRutina());
            ps.setInt(2, rutina.getSemanasRutina());
            ps.setString(3, rutina.getDescRutina());
            ps.setString(4, rutina.getNivelRutina());
            
            ps.setInt(5, rutina.getIdRutina());
            System.out.println("update rutina: "+ps);

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
    }
    
    public List<Rutina> listarFiltro(int autor, String tipoFiltro, String filtro) {
        String sql = "SELECT * FROM rutina where autorRutina = ? and " + tipoFiltro + " = ?";
        List<Rutina> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, autor);
            try {
                ps.setInt(2, Integer.parseInt(filtro));
            } catch (NumberFormatException e) {
                ps.setString(2, filtro);
            }
            System.out.println(ps);

            rs = ps.executeQuery();
            while (rs.next()) {
                Rutina rutina = new Rutina();
                rutina.setIdRutina(rs.getInt("idRutina"));
                rutina.setNomRutina(rs.getString("nomRutina"));
                rutina.setSemanasRutina(rs.getInt("semanasRutina"));
                rutina.setDescRutina(rs.getString("descRutina"));
                rutina.setNivelRutina(rs.getString("nivelRutina"));
                rutina.setCreacionRutina(rs.getDate("creacionRutina").toLocalDate());
                rutina.setAutRutina(rs.getInt("autorRutina"));
                rutina.setTotalClientes(totalClientes(autor));
                lista.add(rutina);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de rutinas: " + e.getMessage());
        }
        return lista;
    }

    public List<Rutina> listar(int autor) {
        String sql = "SELECT * FROM rutina where autorRutina = ?";
        List<Rutina> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, autor);
            System.out.println(ps);
            rs = ps.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                Rutina rutina = new Rutina();
                rutina.setIdRutina(rs.getInt("idRutina"));
                rutina.setNomRutina(rs.getString("nomRutina"));
                rutina.setSemanasRutina(rs.getInt("semanasRutina"));
                rutina.setDescRutina(rs.getString("descRutina"));
                rutina.setNivelRutina(rs.getString("nivelRutina"));
                rutina.setCreacionRutina(rs.getDate("creacionRutina").toLocalDate());
                rutina.setAutRutina(rs.getInt("autorRutina"));
                rutina.setTotalClientes(totalClientes(rs.getInt("idRutina")));
                System.out.println(rutina.getNomRutina());
                lista.add(rutina);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de rutinas: " + e.getMessage());
        }
        return lista;
    }

    public int totalClientes(int idRutina) {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM usuario WHERE fkIdRutina = ?";
        try (
                Connection conn = cn.Conexion(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idRutina);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al contar clientes asignados a la rutina " + idRutina + ": " + e.getMessage());
            // No lanzamos la excepción, simplemente dejamos total en 0
        }
        return total;
    }

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
