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
                // Obtener ID del ejercicio
                int idEjercicio = rs.getInt(2);
                EjercicioDao ejercicioDao = new EjercicioDao();
                Ejercicio ejercicio = Ejercicio.listarPorId(idEjercicio);
                eje_rut.setFkIdEjercicio(ejercicio);

                // Obtener ID del autor
                int idAutor = rs.getInt(5);
                // debo compara el id obtenido con el del usuario que tenga la sesion iniciada para decidir mostralo o no
                if (rs.wasNull()) {
                    ejercicio.setAutorEjercicio(null);
                } else {
                    UsuarioDao usuarioDao = new UsuarioDao();
                    Usuario autor = usuarioDao.listarPorId(idAutor);
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
