package Controlador;

import Modelo.Ejercicio_Rutina;
import Modelo.Ejercicio_RutinaDao;
import Modelo.Rutina;
import Modelo.RutinaDao;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

/**
 * @author William
 *
 * @author arvsa
 */
@WebServlet("/RutinaController")
public class RutinaController extends HttpServlet {

    RutinaDao rutina_dao = new RutinaDao();
    Rutina rutina = new Rutina();
    Ejercicio_RutinaDao eje_rut_dao = new Ejercicio_RutinaDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        switch (accion) {
            case "Create":
                this.Create(request, response, accion);
                break;
            case "Read":
                break;
            case "Update":
                break;
            case "Delete":
                break;
            case "Estructurar":
                this.CrearTabla(request, response);
                break;
        }
    }

    protected void Create(HttpServletRequest request, HttpServletResponse response, Object ejercicios) throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean alMenosUno = (boolean) session.getAttribute("alMenosUno");
        if (alMenosUno) {
            Usuario usuario = (Usuario) session.getAttribute("logger");
            String SemanasRutina = request.getParameter("semanasRutina");
            if (SemanasRutina != null) {
                int semanasRutina = Integer.parseInt(SemanasRutina);
                rutina.setSemanasRutina(semanasRutina);
            }
            rutina.setAutRutina(usuario.getIdUsuario());
            rutina.setDescRutina(request.getParameter("descRutina"));
            rutina.setNivelRutina(request.getParameter("nivelRutina"));
            rutina.setNomRutina(request.getParameter("nomRutina"));
            rutina.setIdRutina(rutina_dao.GuardarAutor(rutina));
            
            
            List<Ejercicio_Rutina> ejerciciosRutina = (List<Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");
            for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
                if (ejer.getIntensidad() != null) {
                    eje_rut_dao.Guardar(ejer);
                }
            }
            request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void CrearTabla(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
