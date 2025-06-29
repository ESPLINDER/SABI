package Controlador;

import Modelo.Ejercicio;
import Modelo.Maximos;
import Modelo.EjercicioDao;
import Modelo.Ejercicio_Rutina;
import Modelo.Ejercicio_RutinaDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author William
 */
@WebServlet("/Ejercicio_RutinaController")
public class Ejercicio_RutinaController extends HttpServlet {

    Ejercicio_Rutina eje_rut = new Ejercicio_Rutina();
    Ejercicio_RutinaDao eje_rut_dao = new Ejercicio_RutinaDao();
    Ejercicio ejercicio = new Ejercicio();
    EjercicioDao ejercicio_dao = new EjercicioDao();
    Maximos max = new Maximos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "default";
        }

        switch (accion) {
            case "Create":
                this.Create(request, response);
                break;
            case "Read":
                break;
            case "Update":
                this.Update(request, response);
                break;
            case "Delete":
                break;
            case "numSeries":
                break;
            default:
                break;
        }
        processRequest(request, response);
    }

    protected void Create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String NumSemanas = request.getParameter("numSemanas");
            String NumDias = request.getParameter("numDias");
            String NumEjercicios = request.getParameter("numEjercicios");
            if (NumSemanas != null && NumDias != null && NumEjercicios != null) {
                int numSemanas = Integer.parseInt(NumSemanas);
                int numDias = Integer.parseInt(NumDias);
                int numEjercicios = Integer.parseInt(NumEjercicios);
                if (numSemanas > 12) {
                    System.out.println("Demasiadas semanas");
                    String alertaSemanas = "Demasiadas semanas, por favor ingresar maximo 12";
                    request.setAttribute("alertaSemanas", alertaSemanas);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numSemanas < 1) {
                    System.out.println("Valor de semanas invalido");
                    String alertaSemanas = "Valor de semanas invalido";
                    request.setAttribute("alertaSemanas", alertaSemanas);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                }
                if (numDias > 7) {
                    System.out.println("Demasiados dias");
                    String alertaDias = "Demasiados dias, la semana no puede tener mas de 7 dias";
                    request.setAttribute("alertaDias", alertaDias);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numDias < 1) {
                    System.out.println("Valor de dias invalido");
                    String alertaDias = "Valor de dias invalido";
                    request.setAttribute("alertaDias", alertaDias);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                }
                if (numEjercicios > 30) {
                    System.out.println("Demasiados ejercicios");
                    String alertaEjercicios = "Demasiados ejercicios, por favor ingresar maximo 100";
                    request.setAttribute("alertaEjercicios", alertaEjercicios);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numEjercicios < 1) {
                    System.out.println("Valor de ejercicios invalido");
                    String alertaEjercicios = "Valor de ejercicios invalido";
                    request.setAttribute("alertaEjercicios", alertaEjercicios);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                }

                max.setSemanas(numSemanas);
                max.setDias(numDias);
                max.setEjercicios(numEjercicios);
                List<Ejercicio_Rutina> ejercicios = new ArrayList<>();
                for (int i = 1; i <= max.getSemanas(); i++) {
                    for (int j = 1; j <= max.getDias(); j++) {
                        for (int k = 1; k <= max.getEjercicios(); k++) {
                            Ejercicio_Rutina lista_eje_rut = new Ejercicio_Rutina();

                            lista_eje_rut.setSemana(i);
                            lista_eje_rut.setDia(j);
                            lista_eje_rut.setOrdenEjercicio(k);
                            lista_eje_rut.setNomEjercicio("Ejercicio " + k);
                            ejercicios.add(lista_eje_rut);
                        }
                    }
                }
                
                HttpSession session = request.getSession();
                session.setAttribute("max", max);
                session.setAttribute("ejerciciosRutina", ejercicios);
                request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Error en el registro");
        }
    }

    protected void Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        eje_rut = (Ejercicio_Rutina) session.getAttribute("ubicacionEjercicio");
        String FkIdEjercicio = request.getParameter("fkIdEjercicio");
        String Series = request.getParameter("series");
        String Repeticiones = request.getParameter("repeticiones");
        String Peso = request.getParameter("peso");
        String intensidad = request.getParameter("intensidad");
        String Descanso = request.getParameter("descanso");

        int fkIdEjercicio = Integer.parseInt(FkIdEjercicio);
        int series = Integer.parseInt(Series);
        int repeticiones = Integer.parseInt(Repeticiones);
        int peso = Integer.parseInt(Peso);
        int descanso = Integer.parseInt(Descanso);

        List<Modelo.Ejercicio_Rutina> ejerciciosRutina = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");

        for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
            if (ejer.getSemana() == eje_rut.getSemana() && ejer.getDia() == eje_rut.getDia() && ejer.getOrdenEjercicio() == eje_rut.getOrdenEjercicio()) {
                ejer.setFkIdEjercicio(fkIdEjercicio);
                ejer.setSemana(eje_rut.getSemana());
                ejer.setDia(eje_rut.getDia());
                ejer.setOrdenEjercicio(eje_rut.getOrdenEjercicio());
                ejer.setSerie(series);
                ejer.setRepeticiones(repeticiones);
                ejer.setPeso(peso);
                ejer.setIntensidad(intensidad);
                ejer.setDescanso(descanso);
            }
        }
        
        session.setAttribute("ejerciciosRutina", ejerciciosRutina);
        request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ejercicio_RutinaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ejercicio_RutinaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
