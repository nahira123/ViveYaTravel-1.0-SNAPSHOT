<%@page import="com.mycompany.viveyatravel.modelo.dto.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/headerValidacionUsuario.css" rel="stylesheet" type="text/css"/>
    <div class="header">
        <div class="contHeader">
            <div class="logo">
                <a href="index.jsp"><img src="https://www.viveyatravel.com/imagenes/logo-web-vive-ya-travel-2.png" class="logo"></a>
            </div>
            <div class="navbar">
                <nav>
                    <ul class="menu">
                        <!--Para encontrar la ruta request.getContextPath()%> -->
                        <li><a href="<%=request.getContextPath()%>/PaqueteControlador">TOURS</a></li>
                        <li><a href="<%=request.getContextPath()%>/srvPromocion">PROMOCIONES</a></li>
                        <li><a href="${pageContext.request.contextPath}/vista/nosotros.jsp">NOSOTROS</a></li>
                    </ul>
                </nav>
            </div>
            <div class="carro">
                <a href="main.jsp"><img class="carrito"/><i class="fa-solid fa-cart-shopping carrito"></i></a>
            </div>
            <div class="usuario-container">
                <!--Cuando entra un usuario se carga esta seccion -->
                <%
                  usuario cliente = (usuario) session.getAttribute("cliente");
                  if (cliente != null) {  
                %>
                <ul class="menu2">
                    <li><a href="#">
                            <p class="username">
                                <%  
                                        out.print("Hola, " + cliente.getNombre());
                                %>
                            </p>
                            <img class="imagen" src="../img/user.png" alt=""/>
                            <i class="fa-solid fa-chevron-down" style="color: #fff"></i></a>
                        <ul>
                            <li><a href="#"><i class=""></i> Configuracion</a></li>
                            <li><a href="${pageContext.request.contextPath}/srvUsuario?accion=cerrar"><i class="fa-solid fa-arrow-right-from-bracket"></i> Cerrar sesión</a></li>
                        </ul>
                    </li>
                </ul>
                <%
                    } else {
                %>
                 <!--En caso contrario de no haber iniciado sesion -->
                <p class="bienvenido">
                   <% out.print("Bienvenido invitado"); %> 
                </p>
                <div class="usuario">
                    <a href="${pageContext.request.contextPath}/vista/iniciarSesion.jsp"><i class="fa-solid fa-user usuario"></i></a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</header>
