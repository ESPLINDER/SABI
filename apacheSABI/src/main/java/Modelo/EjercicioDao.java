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
public class EjercicioDao {

    
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r; //Valor que se retorna al agregar un nuevo registro

    public List<Ejercicio> listar() {
        System.out.println("creando lista");
        String sql = "SELECT idEjercicio, nomEjercicio FROM ejercicio";
        List<Ejercicio> lista = new ArrayList<>();
        try {
            System.out.println("inicia la conexion para listar ejercicios");
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ejercicio ejercicio = new Ejercicio();
                ejercicio.setIdEjercicio(rs.getInt(1));
                ejercicio.setNomEjercicio(rs.getString(2));
                lista.add(ejercicio);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de usuarios");
        }
        return lista;
    }
    
    public Ejercicio listarId(int id){
        String sql = "SELECT idEjercicio, nomEjercicio, descEjercicio, tipEjercicio, urlVideo FROM ejercicio where idEjercicio = ?";
        System.out.println("supuesto id que llega al dao: "+id);
        Ejercicio ejercicio = new Ejercicio();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ejercicio.setIdEjercicio(rs.getInt("idEjercicio"));
                ejercicio.setNomEjercicio(rs.getString("nomEjercicio"));
                ejercicio.setDescEjercicio(rs.getString("descEjercicio"));
                ejercicio.setTipEjercicio(rs.getString("tipEjercicio"));
                ejercicio.setUrlVideo(rs.getString("urlVideo"));
            }
        } catch (Exception e) {
            System.out.println("Error al seleccionar el usuario: " + e.getMessage());
        }
        return ejercicio;
    }
    public Ejercicio nombreId(int id){
        String sql = "SELECT nomEjercicio FROM ejercicio "
                + "INNER JOIN ejercicio_rutina on ejercicio_rutina.fkIdEjercicio = ejercicio.idEjercicio "
                + "where ejercicio_rutina.semana = 1 AND ejercicio_rutina.dia = 2 AND ejercicio_rutina.ordenEjercicio = 3;";
        Ejercicio ejercicio = new Ejercicio();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ejercicio.setIdEjercicio(rs.getInt("idEjercicio"));
                ejercicio.setNomEjercicio(rs.getString("nomEjercicio"));
                ejercicio.setDescEjercicio(rs.getString("descEjercicio"));
                ejercicio.setTipEjercicio(rs.getString("tipEjercicio"));
                ejercicio.setUrlVideo(rs.getString("urlVideo"));
            }
        } catch (Exception e) {
            System.out.println("Error al seleccionar el usuario: " + e.getMessage());
        }
        return ejercicio;
    }
}
