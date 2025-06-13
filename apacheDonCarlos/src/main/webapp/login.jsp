<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login-Pagina Principal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="Estilos/login.css"> 
        <link rel="stylesheet" href="Estilos/formCredito.css"> 
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
                <img src="../recursos/empleado.jpg" alt="usuario" class="user">
            </div>
        </header>
        <br><br><br>
        <div class="container my-2">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h1 class="card-title mb-0 text-center">Inicio De Sesion Usuarios</h1>
                        </div>
                        <div class="card-body">
                            <form id="userForm" method="post" action="ValidarUsuario" novalidate>
                                <div class="form-group">
                                    <label for="emaUsuario">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="emaUsuario" name="emaUsuario" required>
                                    <div class="invalid-feedback">Por favor, ingrese un correo electrónico válido.</div>
                                </div>
                                <div class="form-group">
                                    <label for="passUsuario">Contraseña</label>
                                    <input type="password" class="form-control" id="passUsuario" name="passUsuario" required>
                                    <div class="invalid-feedback">Por favor, ingrese una contraseña.</div>
                                </div>
                                <div class="card-title mt-3 mb-0 text-center">
                                    <input type="submit" name="accion" value="Ingresar" class="btn btn-primary me-2">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script>
                          // Validación del formulario
                          (function () {
                              'use strict'
                              const form = document.getElementById('userForm')
                              form.addEventListener('submit', function (event) {
                                  if (!form.checkValidity()) {
                                      event.preventDefault()
                                      event.stopPropagation()
                                  }
                                  form.classList.add('was-validated')
                              }, false)
                          })()

                          // Función para redirigir a index.html
                          function redirectToIndex() {
                              window.location.href = 'index.html'
                          }
        </script>

        <script src="../Scripts/slideBar.js"></script>
    </body>
</html>

