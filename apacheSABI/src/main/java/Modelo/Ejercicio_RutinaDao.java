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

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r; //Valor que se retorna al agregar un nuevo registro

    /*public List<Ejercicio_Rutina> Crear() {
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
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return ejercicios;
    }*/
    
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
    
    public void Guardar (Ejercicio_Rutina eje_rut){
        String sql = "INSERT INTO ejercicio_rutina (fkIdEjercicio, fkIdRutina, semana, dia, ordenEjercicio, serie, repeticiones, peso, intensidad, descanso) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, eje_rut.getFkIdEjercicio());
            ps.setInt(2, eje_rut.getFkIdRutina());
            ps.setInt(3, eje_rut.getSemana());
            ps.setInt(4, eje_rut.getDia());
            ps.setInt(5, eje_rut.getOrdenEjercicio());
            ps.setInt(6, eje_rut.getSerie());
            ps.setInt(7, eje_rut.getRepeticiones());
            ps.setInt(8, eje_rut.getPeso());
            ps.setString(9, eje_rut.getIntensidad());
            ps.setInt(10, eje_rut.getDescanso());
            
            ps.executeUpdate();
            System.out.println("ejercicio rutina agregado correctamente");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar ejercicio rutina: " + eje_rut.toString());
        }
    }
}
