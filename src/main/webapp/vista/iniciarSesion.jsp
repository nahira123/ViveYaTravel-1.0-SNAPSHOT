<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/inicioSesion.css" rel="stylesheet" type="text/css"/> <!-- Rutas relativas unicas, es decir, para evitar el mal acceso a las rutas  -->
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <div class="formulario">
            <h1>Inicio de sesion</h1>
            <form action="${pageContext.request.contextPath}/srvUsuario?accion=verificar" method="post"> 
                
                <div class="user">
                    <input type="text" name="correo" id="correo" required>
                    <label>Correo Electronico</label>
                </div>
                <div class="user">
                    <input type="password" name="clave" id="clave" required>
                    <label>Contraseña</label>
                </div>
                <div class="recordar">¿Olvidaste tu contraseña?</div>
                <input type="submit" name="verificar" id="Verificar" value="iniciar">
                <div class="registrarse">
                    Crear <a href="registrar.jsp">cuenta</a>
                </div>
                <div class="volver">
                    Volver al <a href="index.jsp">inicio</a>
                </div>
            </form>
            <div>
                <p>Verificacion credenciales:</p>
                ${msjeCredenciales}
            </div>
        </div>
    </body>
</html>
