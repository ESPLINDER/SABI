package Controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.Usuario;
import Modelo.UsuarioDao;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author William
 */

@WebServlet("/ValidarUsuarioController")
public class ValidarUsuarioController extends HttpServlet {

    UsuarioDao u_dao = new UsuarioDao();
    Usuario usu = new Usuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion"); //name del boton ingresar/registrar
        if (accion.equalsIgnoreCase("Ingresar")){
            
            //al hacer click en el boton con value ingresar
            String user = request.getParameter("emaUsuario"); //name del formulario campo usuario
            String pass = request.getParameter("passUsuario"); // campo contrasena
            try {
                usu = u_dao.ValidarUsuario(user, pass);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ValidarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (usu.getEmaUsuario() != null && usu.getPassUsuario() != null) {
                
                HttpSession session = request.getSession();
                session.setAttribute("logger", usu);
                
                request.setAttribute("logger", usu); //vamos a la pagina donde se autentica el usuario
                if (usu.getRolUsuario().equals("entrenador")) {
                    request.getRequestDispatcher("vistas/Entrenador/index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("vistas/Cliente/index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Ingrese Usuario y Contraseña");
            request.getRequestDispatcher("../../index.jsp");
        }
    }
}
