<%
    Modelo.Usuario cliente = (Modelo.Usuario) session.getAttribute("logger");
%>
<link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
<header class="superior">
    <div class="izquierda">
        <img src="<%= contextPath%>/recursos/logoLargo.png" alt="Logo" class="logo">
    </div>
    <nav>
        <a href="<%= request.getContextPath()%>/vistas/Cliente/cliente.jsp">
            <span>Progreso</span>
        </a>
        <a href="<%= contextPath%>/RutinaController?accion=Read">
            <span>Rutinas</span>
        </a>
        <a href="<%= request.getContextPath()%>/EntrenadorController">
            <span>Entrenadores</span>
        </a>
        <a href="<%= request.getContextPath()%>/SuscripcionController?menu=Suscripciones&accion=listar&idCliente=<%= cliente.getIdUsuario() %>">
            <span>Suscripciones</span>
        </a>
    </nav>
    <div class="derecha">
        <a href="<%= request.getContextPath()%>/CerrarSesion">
            <span>Cerrar Sesion</span>
        </a>
        <img src="<%= contextPath%>/recursos/cliente.jpg" alt="user" class="user">
        <span><%= cliente.getNomUsuario() %> <%= cliente.getApeUsuario() %> | <%= cliente.getRolUsuario() %></span>
    </div>
</header>