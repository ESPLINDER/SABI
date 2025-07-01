package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author William
 */
public class Ejercicio_RutinaDao {
    
    EjercicioDao ejercicio_dao = new EjercicioDao();
    
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r; //Valor que se retorna al agregar un nuevo registro

    public void Delete(int idRutina){
        String sql = "DELETE FROM ejercicio_rutina WHERE fkIdRutina = ?";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idRutina);
            System.out.println("eliminar Dao: "+sql);
            r = ps.executeUpdate();
            
            if (r > 0) {
                System.out.println("EjeRut eliminado correctamente");
            } else {
                System.out.println("No se encontró la rutina con ID: " + idRutina);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al eliminar usuario: " + e.getMessage());
        }
    }
    
    public List<Ejercicio_Rutina> listarRutina(int idRutina) {
        String sql = "SELECT * FROM ejercicio_rutina where fkIdRutina = ?";
        List<Ejercicio_Rutina> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idRutina);
            System.out.println(ps);
            rs = ps.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                Ejercicio_Rutina eje_rut = new Ejercicio_Rutina();
                eje_rut.setIdEjercicio_Rutina(rs.getInt("idEjercicio_Rutina"));
                eje_rut.setFkIdEjercicio(rs.getInt("fkIdEjercicio"));
                eje_rut.setFkIdRutina(rs.getInt("fkIdRutina"));
                eje_rut.setSemana(rs.getInt("semana"));
                eje_rut.setDia(rs.getInt("dia"));
                eje_rut.setOrdenEjercicio(rs.getInt("ordenEjercicio"));
                eje_rut.setSerie(rs.getInt("serie"));
                eje_rut.setRepeticiones(rs.getInt("repeticiones"));
                eje_rut.setPeso(rs.getInt("peso_tiempo"));
                eje_rut.setIntensidad(rs.getString("intensidad"));
                eje_rut.setDescanso(rs.getInt("descanso"));
                
                String nomEjercicio = ejercicio_dao.nombreId(eje_rut.getFkIdEjercicio());
                eje_rut.setNomEjercicio(nomEjercicio);
                eje_rut.setEstilo("000000");
                lista.add(eje_rut);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de ejercicios rutina: " + e.getMessage());
        }
        return lista;
    }
    
    public List<Ejercicio_Rutina> listar() {
        String sql = "SELECT *, nomEjercicio FROM ejercicio_rutina INNER JOIN"
                + " ejercicio on ejercicio_rutina.fkIdEjercicio = ejercicio.idEjercicio;";
        List<Ejercicio_Rutina> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ejercicio_Rutina eje_rut = new Ejercicio_Rutina();
                eje_rut.setIdEjercicio_Rutina(rs.getInt(1));
                eje_rut.setFkIdEjercicio(rs.getInt(2));
                eje_rut.setFkIdRutina(rs.getInt(3));
                eje_rut.setSemana(rs.getInt(4));
                eje_rut.setDia(rs.getInt(5));
                eje_rut.setOrdenEjercicio(rs.getInt(6));
                eje_rut.setSerie(rs.getInt(7));
                eje_rut.setRepeticiones(rs.getInt(8));
                eje_rut.setPeso(rs.getInt(9));
                eje_rut.setIntensidad(rs.getString(10));
                eje_rut.setDescanso(rs.getInt(11));
                eje_rut.setNomEjercicio(rs.getString(12));
                
                lista.add(eje_rut);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de usuarios");
        }        return lista;
    }
    
    public void Guardar (Ejercicio_Rutina eje_rut, int idRutina){
        String sql = "INSERT INTO ejercicio_rutina (fkIdEjercicio, fkIdRutina, semana, dia, ordenEjercicio, serie, repeticiones, peso_tiempo, intensidad, descanso) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, eje_rut.getFkIdEjercicio());
            ps.setInt(2, idRutina);
            ps.setInt(3, eje_rut.getSemana());
            ps.setInt(4, eje_rut.getDia());
            ps.setInt(5, eje_rut.getOrdenEjercicio());
            ps.setInt(6, eje_rut.getSerie());
            ps.setInt(7, eje_rut.getRepeticiones());
            ps.setInt(8, eje_rut.getPeso());
            ps.setString(9, eje_rut.getIntensidad());
            ps.setInt(10, eje_rut.getDescanso());
            System.out.println("guardar ejercicio rutina: "+ps);
            
            ps.executeUpdate();
            System.out.println("ejercicio rutina agregado correctamente");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar ejercicio rutina: " + e.getMessage());
        }
    }
}
