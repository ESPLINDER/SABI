<%-- 
    Document   : index
    Created on : 27/05/2025, 7:08:25 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
        <div class="left">
            <div class="menu-container">
                <div class="menu">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div class="brand">
                <i class="bi bi-shop logo"></i>
                <span class="name">Tienda Don Carlos</span>
            </div>
        </div>
        <div class="right">
            <a href="#">
                <i class="bi bi-plus"></i>
                <span class="names">Crear</span>
            </a>
            <div class="right">
                <a href="#" class="d-flex align-items-center">
                    <i class="bi bi-people"></i>
                    <span class="names">Clientes</span>
                </a>
                <a href="#">
                    <i class="bi bi-exclamation-circle"></i>
                    <span class="names">reportes</span>
                </a>
            </div>
            <img src="../recursos/empleado.jpg" alt="usuario" class="user">
        </div>
    </header>
    <div class="sidebar">
        <ul>
            <li>
                <a href="#">
                    <i class="bi bi-cash-stack"></i>
                    <span class="names">Pagos</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="bi bi-coin"></i>
                    <span class="names">Creditos</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="bi bi-basket"></i>
                    <span class="names">Productos</span>
                </a>
            </li>
            <li>
                <body>
                    <a href="#">
                      <i class="bi bi-people"></i>
                      <span class="names">clientes</span>
                    </a>
            </li>
            <li>
                <a href="#">
                    <i class="bi bi-exclamation-circle"></i>
                    <span class="names">reportes</span>
                </a>
            </li>
        </ul>
    </div>
    <script src="../Scripts/slideBar.js"></script>
    </body>
</html>
