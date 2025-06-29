package Controlador;

import Modelo.Maximos;
import Modelo.EjercicioDao;
import Modelo.Ejercicio_Rutina;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author William
 */
@WebServlet("/Ejercicio_RutinaController")
public class Ejercicio_RutinaController extends HttpServlet {

    Ejercicio_Rutina ubi_eje_rut = new Ejercicio_Rutina();
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
                this.Delete(request, response);
                break;
            case "numSeries":
                break;
            default:
                break;
        }
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
                    String alertaSemanas = "Demasiadas semanas, por favor ingresar maximo 12";
                    request.setAttribute("alertaSemanas", alertaSemanas);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numSemanas < 1) {
                    String alertaSemanas = "Valor de semanas invalido";
                    request.setAttribute("alertaSemanas", alertaSemanas);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                }
                if (numDias > 7) {
                    String alertaDias = "Demasiados dias, la semana no puede tener mas de 7 dias";
                    request.setAttribute("alertaDias", alertaDias);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numDias < 1) {
                    String alertaDias = "Valor de dias invalido";
                    request.setAttribute("alertaDias", alertaDias);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                }
                if (numEjercicios > 30) {
                    String alertaEjercicios = "Demasiados ejercicios, por favor ingresar maximo 100";
                    request.setAttribute("alertaEjercicios", alertaEjercicios);
                    request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    return;
                } else if (numEjercicios < 1) {
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
                            lista_eje_rut.setEstilo("#7e7e7e");
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
        ubi_eje_rut = (Ejercicio_Rutina) session.getAttribute("ubicacionEjercicio");
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

        String nomEjercicio = ejercicio_dao.nombreId(fkIdEjercicio);

        List<Modelo.Ejercicio_Rutina> ejerciciosRutina = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");

        for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
            //solo actualiza el ejercicioRutina de la lista donde coincida la ubicacion
            if (ejer.getSemana() == ubi_eje_rut.getSemana() && ejer.getDia() == ubi_eje_rut.getDia() && ejer.getOrdenEjercicio() == ubi_eje_rut.getOrdenEjercicio()) {
                ejer.setFkIdEjercicio(fkIdEjercicio);
                ejer.setSemana(ubi_eje_rut.getSemana());
                ejer.setDia(ubi_eje_rut.getDia());
                ejer.setOrdenEjercicio(ubi_eje_rut.getOrdenEjercicio());
                ejer.setSerie(series);
                ejer.setRepeticiones(repeticiones);
                ejer.setPeso(peso);
                ejer.setIntensidad(intensidad);
                ejer.setDescanso(descanso);

                ejer.setNomEjercicio(nomEjercicio);
                ejer.setEstilo("#000000");
            }
        }

        session.setAttribute("ejerciciosRutina", ejerciciosRutina);
        request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
    }

    protected void Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String Semana = request.getParameter("semana");
        String Dia = request.getParameter("dia");
        String OrdenEjercicio = request.getParameter("ordenEjercicio");

        if (Semana != null && Dia != null && OrdenEjercicio != null) {
            int semana = Integer.parseInt(Semana);
            int dia = Integer.parseInt(Dia);
            int ordenEjercicio = Integer.parseInt(OrdenEjercicio);

            List<Modelo.Ejercicio_Rutina> ejerciciosRutina = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");

            int ordenAEliminar = 0; //auxiliar

            Iterator<Modelo.Ejercicio_Rutina> iterator = ejerciciosRutina.iterator();
            while (iterator.hasNext()) {
                Modelo.Ejercicio_Rutina ejer = iterator.next();
                if (ejer.getSemana() == semana && ejer.getDia() == dia && ejer.getOrdenEjercicio() == ordenEjercicio) {
                    ordenAEliminar = ejer.getOrdenEjercicio();
                    iterator.remove();
                    break;
                }
            }
            for (Modelo.Ejercicio_Rutina ejer : ejerciciosRutina) {
                if (ejer.getSemana() == semana && ejer.getDia() == dia && ejer.getOrdenEjercicio() > ordenAEliminar) {
                    ejer.setOrdenEjercicio(ejer.getOrdenEjercicio() - 1); // Baja un lugar
                    if (ejer.getIntensidad() == null) {
                        ejer.setNomEjercicio("Ejercicio "+ejer.getOrdenEjercicio());
                    }
                }
            }

            session.setAttribute("ejerciciosRutina", ejerciciosRutina);
        }
        request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
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
