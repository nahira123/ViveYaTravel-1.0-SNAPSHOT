<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/registroUsuario.css" rel="stylesheet" type="text/css"/>
        <title>Registrar</title>
    </head>
    <body>
        <div class="formularioRegistro">
            <h1>Registrarse</h1>
            <p>Es rápido y fácil</p>
            <form action="${pageContext.request.contextPath}/srvRegistroUsuario" method="post">
                <div class="registro">
                    <input type="text" name="nombre" id="nombre" required>
                    <label>Nombre</label>
                </div>
                <div class="registro">
                    <input type="text" name="apellido" id="apellido" required>
                    <label>Apellido</label>
                </div>
                <div class="registro">
                    <input type="text" name="nroCelular" id="celular" required>
                    <label>Celular</label>
                </div>
                <div class="registro">
                    <input type="text" name="nroDni" id="dni" required>
                    <label>DNI</label>
                </div>
                <div class="registro">
                    <input type="text" name="correoElectronico" id="correoElectronico" required>
                    <label>Correo Electronico</label>
                </div>
                <div class="registro">
                    <input type="password" name="clave" id="password" required>
                    <label>Contraseña</label>
                </div>
                <input type="submit" name="registrar" id="Registrar" value="Registrarte">
            </form>

        </div>
    </body>
</html>
