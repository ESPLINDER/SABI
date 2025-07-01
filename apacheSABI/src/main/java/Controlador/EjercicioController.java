package Controlador;

import Modelo.EjercicioDao;
import Modelo.Ejercicio_Rutina;
import Modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 * @author William
 */
@WebServlet("/EjercicioController")
public class EjercicioController extends HttpServlet {

    EjercicioDao ejercicio_dao = new EjercicioDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "Create":
                break;
            case "Read":
                break;
            case "Update":
                break;
            case "Delete":
                break;
            case "TraerEjercicio":
                this.EnviarEjercicios(request, response);
                break;
        }
    }

    protected void EnviarEjercicios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("logger");
        String carpeta = (user.getRolUsuario().equals("entrenador")) ? "Entrenador" : "Cliente";
        
        String IdEjercicio = request.getParameter("idEjercicio");
        String FkIdEjercicio = request.getParameter("fkIdEjercicio");
        String Semana = request.getParameter("semana");
        String Dia = request.getParameter("dia");
        String OrdenEjercicio = request.getParameter("ordenEjercicio");
        if (IdEjercicio != null) {
            int idEjercicio = Integer.parseInt(IdEjercicio);
            System.out.println("int del idEJercicio: "+idEjercicio);//
            request.setAttribute("ejercicio", ejercicio_dao.listarId(idEjercicio));
        } else if (FkIdEjercicio != null){
            int fkIdEjercicio = Integer.parseInt(FkIdEjercicio);
            System.out.println("int del FKidEJercicio: "+fkIdEjercicio);//
            if (fkIdEjercicio > 0) {
                request.setAttribute("ejercicio", ejercicio_dao.listarId(fkIdEjercicio));
            }
        }
        
        Ejercicio_Rutina ubicacionEjercicio = new Ejercicio_Rutina();
        if (Semana != null && Dia != null && OrdenEjercicio != null) {
            int semana = Integer.parseInt(Semana);
            int dia = Integer.parseInt(Dia);
            int ordenEjercicio = Integer.parseInt(OrdenEjercicio);

            ubicacionEjercicio.setSemana(semana);
            ubicacionEjercicio.setDia(dia);
            ubicacionEjercicio.setOrdenEjercicio(ordenEjercicio);
            
            List<Modelo.Ejercicio_Rutina> ejerciciosRutina = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");

            for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
                //envia los datos si ya existia un ejercicio rutina en esa ubicacion
                if (ejer.getSemana() == ubicacionEjercicio.getSemana() && ejer.getDia() == ubicacionEjercicio.getDia() && ejer.getOrdenEjercicio() == ubicacionEjercicio.getOrdenEjercicio() && ejer.getIntensidad() != null) {
                    session.setAttribute("eje_rut_edicion", ejer);
                }
            }
        }
        
        session.setAttribute("ubicacionEjercicio", ubicacionEjercicio);
        List listaEjercicios = ejercicio_dao.listar();
        request.setAttribute("lista_ejercicios", listaEjercicios);
        request.getRequestDispatcher("/vistas/"+carpeta+"/formEjercicioRutina.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
