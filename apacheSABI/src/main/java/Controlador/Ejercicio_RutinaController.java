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
import java.util.List;
import java.util.Map;

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

        switch (accion) {
            case "Create":
                break;
            case "Read":
                break;
            case "Update":
                break;
            case "Delete":
                break;
        }
        processRequest(request, response);
    }

    protected void CrearTabla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                    request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
                }
                if (numDias > 7) {
                    System.out.println("Demasiados dias");
                    String alertaDias = "Demasiados dias, la semana no puede tener mas de 7 dias";
                    request.setAttribute("alertaDias", alertaDias);
                    request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
                }
                if (numEjercicios > 30) {
                    System.out.println("Demasiados ejercicios");
                    String alertaEjercicios = "Demasiados ejercicios, por favor ingresar maximo 100";
                    request.setAttribute("alertaEjercicios", alertaEjercicios);
                    request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
                }

                max.setSemanas(numSemanas);
                max.setDias(numDias);
                max.setEjercicios(numEjercicios);
                List ejercicios = eje_rut_dao.listar();
                request.setAttribute("ejercicios", ejercicios);
                request.getRequestDispatcher("vistas/admin/ListaUsuariosAdmin.jsp").forward(request, response);

                request.setAttribute("max", max);
                request.setAttribute("ejercicios", ejercicios); //lista
                request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
            } else {
                System.out.println("valor de estructura nulo");
                String alerta = "Por favor rellenar todos los campos con numeros enteros";
                request.setAttribute("alerta", alerta);
                request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Error en el registro");
        }
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
