package Controlador;

import Modelo.Ejercicio_Rutina;
import Modelo.Ejercicio_RutinaDao;
import Modelo.Rutina;
import Modelo.RutinaDao;
import Modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    Usuario usuario = new Usuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("accion: " + accion);
        switch (accion) {
            case "Create":
                this.Create(request, response, accion);
                break;
            case "Read":
                this.Read(request, response, accion);
                break;
            case "Update":
                break;
            case "Delete":
                this.Delete(request, response);
                break;
        }
    }

    protected void Create(HttpServletRequest request, HttpServletResponse response, Object ejercicios) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Modelo.Ejercicio_Rutina> ejerciciosRutina = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");

        boolean alMenosUno = (boolean) session.getAttribute("alMenosUno");
        if (alMenosUno) {
            Usuario usuario = (Usuario) session.getAttribute("logger");
            int semanaMaxima = 0;
            
            int idRutina = (int) session.getAttribute("idRutina");

            for (Ejercicio_Rutina eje : ejerciciosRutina) {
                if (eje.getSemana() > semanaMaxima) {
                    semanaMaxima = eje.getSemana();
                }
            }
            rutina.setSemanasRutina(semanaMaxima);
            rutina.setAutRutina(usuario.getIdUsuario());
            rutina.setDescRutina(request.getParameter("descRutina"));
            rutina.setNivelRutina(request.getParameter("nivelRutina"));
            rutina.setNomRutina(request.getParameter("nomRutina"));
            rutina.setCreacionRutina(LocalDate.now());
            if (idRutina != 0) {
                rutina.setIdRutina(idRutina);
                rutina_dao.Update(rutina);
            } else {
                idRutina = rutina_dao.GuardarAutor(rutina);
            }

            System.out.println("lista antes de filtrar");
            for (Ejercicio_Rutina eje : ejerciciosRutina) {
                System.out.println(eje.toString());
            }
            //eliminar ejercicios y dias vacios
            List<Ejercicio_Rutina> ejerciciosFiltrados = new ArrayList<>();

            // 1. Filtrar ejercicios con intensidad válida
            for (Ejercicio_Rutina eje : ejerciciosRutina) {
                if (eje.getIntensidad() != null && !eje.getIntensidad().trim().isEmpty()) {
                    ejerciciosFiltrados.add(eje);
                }
            }

            // 2. Agrupar manualmente por semana y día
            Map<Integer, Map<Integer, List<Ejercicio_Rutina>>> agrupados = new HashMap<>();

            for (Ejercicio_Rutina eje : ejerciciosFiltrados) {
                int semana = eje.getSemana();
                int dia = eje.getDia();

                agrupados.putIfAbsent(semana, new HashMap<>());
                Map<Integer, List<Ejercicio_Rutina>> dias = agrupados.get(semana);

                dias.putIfAbsent(dia, new ArrayList<>());
                dias.get(dia).add(eje);
            }

            // 3. Reorganizar días y ejercicios 
            List<Ejercicio_Rutina> resultadoFinal = new ArrayList<>();

            for (int semana : agrupados.keySet()) {
                Map<Integer, List<Ejercicio_Rutina>> dias = agrupados.get(semana);

                // Ordenar los días de menor a mayor
                List<Integer> diasOrdenados = new ArrayList<>(dias.keySet());
                Collections.sort(diasOrdenados);

                int nuevoDia = 1;

                for (int diaOriginal : diasOrdenados) {
                    List<Ejercicio_Rutina> ejerciciosDelDia = dias.get(diaOriginal);

                    // Si por alguna razón está vacío, lo saltamos
                    if (ejerciciosDelDia.isEmpty()) {
                        continue;
                    }

                    // Reordenar los ejercicios dentro del día
                    for (int i = 0; i < ejerciciosDelDia.size(); i++) {
                        Ejercicio_Rutina eje = ejerciciosDelDia.get(i);
                        eje.setSemana(semana);
                        eje.setDia(nuevoDia);
                        eje.setOrdenEjercicio(i + 1);
                        resultadoFinal.add(eje);
                    }

                    nuevoDia++;
                }
            }
            System.out.println("lista despues de filtrar");
            for (Ejercicio_Rutina eje : resultadoFinal) {
                System.out.println(eje.toString());
            }
            for (Modelo.Ejercicio_Rutina ejer : resultadoFinal) {
                eje_rut_dao.Delete(idRutina);
                eje_rut_dao.Guardar(ejer, idRutina);
            }
            request.getRequestDispatcher("/vistas/Entrenador/rutinas.jsp").forward(request, response);
        }
    }

    protected void Read(HttpServletRequest request, HttpServletResponse response, Object ejercicios) throws ServletException, IOException {
        HttpSession session = request.getSession();
        usuario = (Usuario) session.getAttribute("logger");
        List listaRutinas;
        String tipoFiltro = request.getParameter("tipoFiltro");
        String filtro = request.getParameter("filtro");
        System.out.println("tipo filtro: "+tipoFiltro);
        System.out.println("filtro: "+filtro);
        String alerta = "";
        if (tipoFiltro != null && filtro != null) {
            listaRutinas = rutina_dao.listarFiltro(usuario.getIdUsuario(), tipoFiltro, filtro);
            if (listaRutinas == null || listaRutinas.isEmpty()) {
                alerta = "No se encontraron rutinas con el filtro: "+filtro;
                System.out.println(alerta);
            }
        } else {
            listaRutinas = rutina_dao.listar(usuario.getIdUsuario());
        }
        System.out.println("lista de rutinas: " + listaRutinas);
        request.setAttribute("alerta", alerta);
        request.setAttribute("listaRutinas", listaRutinas);
        request.getRequestDispatcher("/vistas/Entrenador/rutinas.jsp").forward(request, response);
    }

    protected void Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
        int idRutina = Integer.parseInt(request.getParameter("idRutina"));
        eje_rut_dao.Delete(idRutina);
        rutina_dao.Delete(idRutina);
        
        request.getRequestDispatcher("RutinaController?accion=Read").forward(request, response);
        }catch(ServletException | IOException | NumberFormatException e){
            System.out.println("Error al eliminar");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
