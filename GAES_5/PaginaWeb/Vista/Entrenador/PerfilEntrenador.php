<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario - SABI</title>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Stiles/RegistroEntrenador.css">

    <style>
        @font-face {
            font-family: 'Bonello-Regular';
            src: url('Fonts/Bonello-Regular.otf') format('opentype');
        }
        body {
            background-image: url(../media/fondoSabi.png);;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 150vh;
        }
        .navbar-custom {
            background-color: #021526;
            color: whitesmoke;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #6EACDA;
            font-family: 'Bonello-Regular', sans-serif;
            margin: 0 auto;
            text-decoration: none;
        }
        .navbar-brand:hover {
            color: #6EACDA;
        }
        .profile-container {
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border: 1px solid #000;
            border-radius: 12px;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .profile-image {
            text-align: center;
            position: relative;
        }
        .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #03346E;
            margin-bottom: 15px;
        }
        .btn-upload {
            background-color: #03346E;
            color: #fff;
            margin-top: 10px;
        }
        .btn-upload:hover {
            background-color: #021526;
        }
        .profile-image button {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: #fff;
            border: none;
            border-radius: 50%;
            padding: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        .btn-password, .btn-save {
            background-color: black;
            color: azure;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 12px;
            position: relative;
            overflow: hidden;
            transition: color 0.3s ease;
            z-index: 1;
            margin-top: 15px;
        }
        .btn-password:hover, .btn-save:hover {
            color: black;
        }
        .btn-password::before, .btn-save::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #E2E2B6, #E2E2B6, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #E2E2B6);
            background-size: 400%;
            z-index: -1;
            transition: opacity 0.3s ease;
            opacity: 0;
            border-radius: 12px;
            animation: glowing 50s linear infinite;
        }
        .btn-password:hover::before, .btn-save:hover::before {
            opacity: 1;
        }
        @keyframes glowing {
            0% { background-position: 0 0; }
            50% { background-position: 200% 0; }
            100% { background-position: 0 0; }
        }
        footer {
            background-color: #021526;
            color: #fff;
            padding: 10px 0;
            margin-top: auto;
        }
        footer a {
            color: #6EACDA;
            text-decoration: none;
        }
        footer a:hover {
            color: #fff;
        }
        .footer-column {
            margin-bottom: 20px;
        }
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            right: 0;
            background-color: #021526;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 25px;
            color: #6EACDA;
            display: block;
            transition: 0.3s;
        }
        .sidebar a:hover {
            color: #fff;
        }
        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
        }
        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #021526;
            color: #6EACDA;
            padding: 5px 7.5px;
            border: none;
        }
        .openbtn:hover {
            background-color: #03346E;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between">
                <img src="Logo/sabi.enc" alt="Logo" width="60" height="60" class="me-3 logo">
                <a class="navbar-brand" href="#">SABI</a>
                <div class="col-lg-2 text-center">
                    <a href="PerfilEntrenador.html" class="text-light text-decoration-none">Adriana | Entrenador</a>
                    <button class="openbtn" onclick="openNav()">☰</button>
                    <div id="mySidebar" class="sidebar">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="PaginaPrincipalEntrenador.html">Inicio</a>
                        <a href="NosotrosEntrenador.html">Sobre nosotros</a>
                        <a href="Servicios y Contactos Entrenador.html">Servicios y Contactos</a>
                        <a href="Error404Entrenador.html">Blog</a>
                        <a href="PerfilEntrenador.html">Camila</a>
                    </div>
                </div>
            </div>
        </div>
        </nav>
              
    

    <div class="profile-container">
        <div class="profile-image">
            <img id="profilePicture" src="https://via.placeholder.com/150" alt="Foto de perfil">
            <input type="file" id="uploadPhoto" class="d-none" accept="image/*" onchange="previewImage(event)">
            <button type="button" onclick="document.getElementById('uploadPhoto').click()">
                <i class="bi bi-pencil"></i>
            </button>
        </div>

        <form id="profileForm">
            <div class="row mb-3">
                <div class="col">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Nombre">
                </div>
                <div class="col">
                    <label for="apellido" class="form-label">Apellido</label>
                    <input type="text" class="form-control" id="apellido" placeholder="Apellido">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="edad" class="form-label">Edad</label>
                    <input type="number" class="form-control" id="edad" placeholder="Edad">
                </div>
                
            </div>
            <div class="mb-3 row">
                <form class="row">
                    <div class="col-md-6 px-2 mb-3">
                        <label for="telefono" class="form-label">Número de Telefono</label>
                        <input type="tel" class="form-control" id="telefono" placeholder="Ejemplo: 3000000000"
                            pattern="[0-9]{10}" required>
                    </div>
                    <div class="col-md-6 px-2 mb-3">
                        <label for="genero" class="form-label">Genero</label>
                        <select class="form-select" id="genero" aria-label="Seleccionar sexo" required>
                            <option value=""></option>
                            <option value="Hombre">Hombre</option>
                            <option value="Mujer">Mujer</option>
                            <option value="otro">Otras identidades de genero</option>
                        </select>
                    </div>
                    <div class="col-md-6 px-2 mb-3">
                        <label for="especialidad" class="form-label">Especialidad</label>
                        <input type="text" class="form-control" id="especialidad"
                            placeholder="Especialidad en la que te enfocas" required>
                    </div>
                    <div class="col-md-6 px-2 mb-3">
                        <label for="xp" class="form-label">Años de experiencia</label>
                        <input type="number" class="form-control" id="number" placeholder="Cuantos años tienes de experiencia"
                            required min="0">
                    </div>
                    <div class="col-md-6 px-2 mb-3">
                        <label for="pagos" class="form-label">Escoge un banco para recibir tu dinero</label>
                        <select class="form-select" id="genero" aria-label="Seleccionar sexo" required>
                            <option value=""></option>
                            <option value="banco-bogota">Banco de Bogotá</option>
                            <option value="banco-occcidente">Banco de Occidente</option>
                            <option value="banco-falabella">Banco Falabella</option>
                            <option value="gnb-sudameris">GNB Sudameris</option>
                            <option value="banco-pichincha">Banco Pichincha</option>
                            <option value="banco-popular">Banco Popular</option>
                            <option value="banco-santander">Banco Santander</option>
                            <option value="banco-bancolombia">Bancolombia</option>
                            <option value="banco-omeva">Bancoomeva</option>
                            <option value="citibank">Citibank</option>
                            <option value="daviplata">Daviplata</option>
                            <option value="movii">Movii</option>
                            <option value="itau">Itaú</option>
                            <option value="nequi">Nequi</option>
                            <option value="scotiabank">Scotiabank Colpatria</option>
                            <option value="banco-mia">Bancamía</option>
                            <option value="rappipay">RappiPay</option>
                            <option value="lulo-bank">LuloBank</option>
                        </select>
                    </div>
                    <div class="col-md-6 px-2 mb-3">
                        <label for="cerBancario" class="form-label">Certificado bancario</label>
                        <input class="form-control" type="file" id="cerBancario" required>
                    </div>
                    <div class="col-md-12 px-2 mb-3">
                        <label for="biografia" class="form-label">Biografia</label>
                        <textarea name="biografia" id="biografia" class="form-control" placeholder="Escribe una biografia para que los usuarios te elijan" required></textarea>
                    </div>
                    <div class="col-md-8 px-2 mb-3 mx-auto">
                        <label for="certificado" class="form-label">Certificado profesional</label>
                        <input class="form-control d-none" type="file" id="certificado" required>
                        <label class="certificado pt-4" for="certificado"><i id="subir" class="bi bi-cloud-arrow-up"></i><i id="subido" class="bi bi-cloud-check-fill d-none"></i></label>
                    </div>
                    <div class="col-md-12 row">
                        <button type="submit" class="btn btn-custom w-100 mb-3">Enviar</button> 
                    </div>
                </form>
            </div>
            <button type="button" class="btn btn-password w-100">Actualizar Contraseña</button>
            <button type="submit" class="btn btn-save w-100">Guardar Cambios</button>
        </form>
    </div>

    <footer>
        <div class="container">
            <div class="row text-center text-md-start">
                <div class="col-md-4 footer-column">
                    <h5>Políticas de privacidad</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Política de datos</a></li>
                        <li><a href="#">Aviso de privacidad</a></li>
                    </ul>
                </div>
                <div class="col-md-4 footer-column">
                    <h5>Términos de servicio</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Términos y condiciones</a></li>
                        <li><a href="#">Reglas de uso</a></li>
                    </ul>
                </div>
                <div class="col-md-4 footer-column">
                    <h5>Información de contacto</h5>
                    <ul class="list-unstyled">
                        <li>1534053454</li>
                        <li>2534647864</li>
                        <li>SABI@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="text-center mt-3">
                <p>&copy; 2024 SABI. Todos los derechos reservados.</p>
                <div>
                    <a href="#" class="text-light mx-2"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-youtube"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-twitter-x"></i></a>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                document.getElementById('profilePicture').src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        document.getElementById('profileForm').addEventListener('submit', function(event) {
            event.preventDefault();
            Swal.fire({
                icon: 'success',
                title: '¡Información guardada!',
                text: 'Tu perfil se ha actualizado',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#021526'
            }).then(() => {
                window.location.href = 'Pagina principal.html';
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openNav() {
            document.getElementById("mySidebar").style.width = "250px";
        }
        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
        }
    </script>
    <script src="Script/RegistroEntrenador.js"></script>
</body>
</html>
