<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Stiles/RegistroEntrenador.css">
</head>

<body class="cuerpo">
    <!-- Menú -->
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="Media/Logo.enc" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand " href="#">
                        <h1>SABI</h1>
                    </a></div>
                <div class="col-lg-2 text-center"></div>
            </div>
        </div>
    </nav>

    <header class="mt-3">
        <h1 class="encabezado text-center col-md-3 mx-auto">Completa tu registro</h1>
    </header>

    <!-- Contenido -->
    <div class="col-md-7 mx-auto mt-1 contenido">
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
                <button type="submit" class="col-md-2 mx-auto">Enviar</button> <!-- Estilizar Estilizar Estilizar Estilizar Estilizar Estilizar Estilizar -->
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Script/RegistroEntrenador.js"></script>
</body>

</html>