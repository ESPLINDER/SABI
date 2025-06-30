<%
    Modelo.Usuario cliente = (Modelo.Usuario) session.getAttribute("logger");
%>
<link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
<header class="superior">
    <div class="izquierda">
        <img src="<%= contextPath%>/recursos/logoLargo.png" alt="Logo" class="logo">
    </div>
    <nav>
        <a href="<%= contextPath%>/vistas/Entrenador/rutinas.jsp">
            <span>Rutinas</span>
        </a>
        <a href="<%= request.getContextPath()%>/SuscripcionController?menu=Suscripciones&accion=listar">
            <span>Clientes</span>
        </a>
        <a href="<%= request.getContextPath()%>/SuscripcionController?menu=Suscripciones&accion=listar">
            <span>Suscripciones</span>
        </a>
    </nav>
    <div class="derecha">
        <img src="<%= contextPath%>/recursos/cliente.jpg" alt="user" class="user">
        <span><%= cliente.getNomUsuario() %> <%= cliente.getApeUsuario() %> | <%= cliente.getRolUsuario() %></span>
    </div>
</header>