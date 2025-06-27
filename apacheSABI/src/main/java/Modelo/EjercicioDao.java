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
        String sql = "SELECT idEjercicio, nomEjercicio, descEjercicio, tipEjercicio, autorEjercicio, urlVideo FROM ejercicio";
        List<Ejercicio> lista = new ArrayList<>();
        try {
            conn = cn.Conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Ejercicio ejercicio = new Ejercicio();
                ejercicio.setIdEjercicio(rs.getInt(1));
                ejercicio.setNomEjercicio(rs.getString(2));
                ejercicio.setDescEjercicio(rs.getString(3));
                ejercicio.setTipEjercicio(rs.getString(4));
                // Obtener ID del autor
                int idAutor = rs.getInt(5);
                if (rs.wasNull()) {
                    ejercicio.setAutorEjercicio(null);
                } else {
                    UsuarioDao usuarioDao = new UsuarioDao();
                    Usuario autor = usuarioDao.ListarId(idAutor);
                    ejercicio.setAutorEjercicio(autor);
                }
                ejercicio.setUrlVideo(rs.getString(6));
                lista.add(ejercicio);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al generar lista de usuarios");
        }
        return lista;
    }
}
