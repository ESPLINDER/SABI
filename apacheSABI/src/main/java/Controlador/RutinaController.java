package Controlador;

import Modelo.Ejercicio_Rutina;
import Modelo.Rutina;
import Modelo.RutinaDao;
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
    Rutina tablaRutina = new Rutina();
    int idRutina;

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
            String SemanasRutina = request.getParameter("semanasRutina");
            String descRutina = request.getParameter("descRutina");
            String nivelRutina = request.getParameter("nivelRutina");
            rutina.setCreacionRutina(LocalDate.now());
            //df //
            String Dia = request.getParameter("dia");
            String OrdenEjercicio = request.getParameter("ordenEjercicio");
            List<Ejercicio_Rutina> ejerciciosRutina = (List<Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");
            for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
                if (ejer.getIntensidad() != null) {
                    rutina_dao.GuardarAutor(rutina);
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
