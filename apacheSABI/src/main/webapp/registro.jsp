<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="Modelo.UsuarioDao" %>

<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SABI - Registro</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/estilos/registro.css">
        <script>
            let selectedRole = null;
            function showRoleModal() {
                // Validar formulario antes de mostrar modal
                if (!validateForm()) {
                    return false;
                }
                document.getElementById('roleModal').classList.add('active');
                return false; // Prevenir submit del formulario
            }

            function selectRole(role) {
                selectedRole = role;
                document.getElementById('selectedRole').value = role;
                document.getElementById('roleModal').classList.remove('active');
                document.getElementById('registerForm').submit(); // Enviar el formulario después de seleccionar el rol
            }

            function closeModal() {
                document.getElementById('roleModal').classList.remove('active');
            }

            function updateCiudades() {
                const departamentoSelect = document.getElementById('departamento');
                const ciudadSelect = document.getElementById('ciudad');
                const departamento = departamentoSelect.value;

                // Limpiar opciones anteriores
                ciudadSelect.innerHTML = '';

                if (departamento) {
                    ciudadSelect.disabled = false;
                    const ciudades = {
                        antioquia: ['Medellín', 'Envigado', 'Bello', 'Itagüí', 'Sabaneta'],
                        atlantico: ['Barranquilla', 'Soledad', 'Malambo', 'Puerto Colombia'],
                        bogota: ['Bogotá'],
                        cundinamarca: ['Soacha', 'Chía', 'Zipaquirá', 'Facatativá'],
                        valle: ['Cali', 'Palmira', 'Buenaventura', 'Tulua']
                    };

                    if (ciudades[departamento]) {
                        ciudades[departamento].forEach(ciudad => {
                            const option = document.createElement('option');
                            option.value = ciudad;
                            option.textContent = ciudad;
                            ciudadSelect.appendChild(option);
                        });
                    }
                } else {
                    ciudadSelect.disabled = true;
                    const defaultOption = document.createElement('option');
                    defaultOption.value = '';
                    defaultOption.textContent = 'Primero selecciona un departamento';
                    ciudadSelect.appendChild(defaultOption);
                }
            }

            function validateForm() {
                const form = document.getElementById('registerForm');
                const password = form.password.value;
                const confirmPassword = form.confirmPassword.value;
                const email = form.email.value;
                const numeroDocumento = form.numeroDocumento.value;

                // Validar campos obligatorios
                const requiredFields = ['nombre', 'apellido', 'email', 'password', 'confirmPassword',
                    'tipoDocumento', 'numeroDocumento', 'departamento', 'ciudad', 'genero'];

                for (let field of requiredFields) {
                    if (!form[field] || !form[field].value.trim()) {
                        alert(`El campo ${field} es obligatorio`);
                        if (form[field])
                            form[field].focus();
                        return false;
                    }
                }

                // Validar contraseña
                if (password.length < 8) {
                    alert('La contraseña debe tener al menos 8 caracteres');
                    form.password.focus();
                    return false;
                }

                // Validar coincidencia de contraseñas
                if (password !== confirmPassword) {
                    alert('Las contraseñas no coinciden');
                    form.confirmPassword.focus();
                    return false;
                }

                // Validar email básico
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Por favor ingresa un correo electrónico válido');
                    form.email.focus();
                    return false;
                }

                // Validar número de documento
                if (!/^\d+$/.test(numeroDocumento)) {
                    alert('El número de documento debe contener solo números');
                    form.numeroDocumento.focus();
                    return false;
                }

                return true;
            }

            function goBack() {
                window.location.href = '${pageContext.request.contextPath}/UsuarioController';
            }

            // Restaurar ciudades si hay valores previos
            window.onload = function () {
                const departamento = '${param.departamento != null ? param.departamento : ""}';
                const ciudad = '${param.ciudad != null ? param.ciudad : ""}';

                if (departamento) {
                    document.getElementById('departamento').value = departamento;
                    updateCiudades();

                    if (ciudad) {
                        setTimeout(() => {
                            document.getElementById('ciudad').value = ciudad;
                        }, 100);
                    }
                }
            };
        </script>
    </head>
    <body>
        <!-- Modal de Selección de Rol -->
        <div class="modal-overlay" id="roleModal">
            <div class="modal-content">
                <h2 class="modal-title">¡Bienvenido a SABI!</h2>
                <p class="modal-subtitle">¿Qué rol prefieres para tu cuenta?</p>
                <div class="role-buttons">
                    <button type="button" class="role-btn" onclick="selectRole('cliente')">
                        <span class="role-icon">👤</span>
                        <span>Cliente</span>
                    </button>
                    <button type="button" class="role-btn" onclick="selectRole('entrenador')">
                        <span class="role-icon">💪</span>
                        <span>Entrenador</span>
                    </button>
                </div>
                <button type="button" onclick="closeModal()">Cerrar</button>
            </div>
        </div>

        <!-- Navbar -->
        <nav class="navbar">
            <div class="nav-container">
                <button type="button" class="back-btn" onclick="goBack()">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
                <h1 class="brand-title">SABI</h1>
            </div>
        </nav>

        <!-- Sección de Registro -->
        <section class="register-section">
            <div class="register-container">
                <div class="register-card">
                    <h2>Bienvenido a SABI<br>Ingresa tus datos</h2>

                    <!-- Mostrar mensajes de error -->
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="error-message" style="color: #d32f2f; margin-bottom: 15px; padding: 12px; background-color: #ffebee; border: 1px solid #f44336; border-radius: 4px; font-size: 14px;">
                        <%= request.getAttribute("error")%>
                    </div>
                    <% }%>

                    <form class="register-form" id="registerForm" method="POST" action="UsuarioController" onsubmit="return showRoleModal()">
                        <input type="hidden" id="selectedRole" name="rol" value="">

                        <div class="form-row">
                            <div class="form-group">
                                <label>Nombre *</label>
                                <input type="text" name="nombre" placeholder="Nombre" required maxlength="50"
                                       value="${param.nombre != null ? param.nombre : ''}">
                            </div>
                            <div class="form-group">
                                <label>Apellido *</label>
                                <input type="text" name="apellido" placeholder="Apellido" required maxlength="50"
                                       value="${param.apellido != null ? param.apellido : ''}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Género *</label>
                                <select name="genero" required>
                                    <option value="">Seleccionar género</option>
                                    <option value="masculino" ${param.genero == 'masculino' ? 'selected' : ''}>Masculino</option>
                                    <option value="femenino" ${param.genero == 'femenino' ? 'selected' : ''}>Femenino</option>
                                    <option value="otro" ${param.genero == 'otro' ? 'selected' : ''}>Otro</option>
                                    <option value="no-especificar" ${param.genero == 'no-especificar' ? 'selected' : ''}>Prefiero no especificar</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Fecha de nacimiento *</label>
                                <input type="date" name="fechaNacimiento" required value="${param.fechaNacimiento != null ? param.fechaNacimiento : ''}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Departamento *</label>
                                <select id="departamento" name="departamento" required onchange="updateCiudades()">
                                    <option value="">Seleccionar departamento</option>
                                    <option value="antioquia" ${param.departamento == 'antioquia' ? 'selected' : ''}>Antioquia</option>
                                    <option value="atlantico" ${param.departamento == 'atlantico' ? 'selected' : ''}>Atlántico</option>
                                    <option value="bogota" ${param.departamento == 'bogota' ? 'selected' : ''}>Bogotá D.C.</option>
                                    <option value="cundinamarca" ${param.departamento == 'cundinamarca' ? 'selected' : ''}>Cundinamarca</option>
                                    <option value="valle" ${param.departamento == 'valle' ? 'selected' : ''}>Valle del Cauca</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Ciudad *</label>
                                <select id="ciudad" name="ciudad" required disabled>
                                    <option value="">Primero selecciona un departamento</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Tipo de Documento *</label>
                                <select name="tipoDocumento" required>
                                    <option value="">Seleccionar tipo</option>
                                    <option value="CC" ${param.tipoDocumento == 'CC' ? 'selected' : ''}>Cédula de Ciudadanía</option>
                                    <option value="TI" ${param.tipoDocumento == 'TI' ? 'selected' : ''}>Tarjeta de Identidad</option>
                                    <option value="CE" ${param.tipoDocumento == 'CE' ? 'selected' : ''}>Cédula de Extranjería</option>
                                    <option value="Pasaporte" ${param.tipoDocumento == 'Pasaporte' ? 'selected' : ''}>Pasaporte</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Número de Documento *</label>
                                <input type="text" name="numeroDocumento" placeholder="123456789" required pattern="[0-9]+"
                                       value="${param.numeroDocumento != null ? param.numeroDocumento : ''}">
                            </div>
                        </div>

                        <div class="form-group full-width">
                            <label>Correo electrónico *</label>
                            <input type="email" name="email" placeholder="correo@ejemplo.com" required maxlength="100"
                                   value="${param.email != null ? param.email : ''}">
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Contraseña *</label>
                                <input type="password" name="password" placeholder="Contraseña" required minlength="8" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label>Confirmar Contraseña *</label>
                                <input type="password" name="confirmPassword" placeholder="Confirmar contraseña" required minlength="8" maxlength="50">
                            </div>
                        </div>

                        <div class="form-group">
                            <small class="password-hint">Mínimo 8 caracteres</small>
                        </div>

                        <button type="submit" class="register-btn">
                            <span class="btn-text">Registrarse</span>
                        </button>

                        <div class="login-link-container">
                            <span>¿Ya tienes cuenta? </span>
                            <a href="${pageContext.request.contextPath}/index.jsp" class="login-link">Iniciar sesión</a>
                        </div>
                    </form>
                </div>
                <div class="logo-section">
                    <div class="logo">
                        <img src="${pageContext.request.contextPath}/recursos/logoF.png" alt="SABI Logo" class="logo-img">
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
