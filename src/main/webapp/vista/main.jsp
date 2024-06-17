<!-- Importa la biblioteca JSTL para usar las etiquetas JSTL en la página JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- Establece el tipo de contenido y la codificación de la página -->
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <!-- Especifica la codificación de caracteres para el documento HTML -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <!-- Importa el CSS de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">       
        <!-- Importa el CSS de Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <!-- Enlaza la hoja de estilos personalizada -->
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>        
        <title>Carrito de Compras</title>
    </head>
    <body>
        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!-- Botón para colapsar la barra de navegación en pantallas pequeñas -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><i>Vive Ya Travel</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="main.jsp"><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
                    </li>
                                  
                    <li class="nav-item">
                        <a class="nav-link" href="carrito.jsp"><i class="fas fa-cart-plus">(<label style="color: darkorange">${contador}</label>)</i> Carrito</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="addProducto.jsp">Paquetes</a>
                    </li> 
                </ul>
                    <!-- Barra de búsqueda -->
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">                   
                    <input style="width:400px" class="form-control mr-sm-2" id="txtBuscar">
                    <button class="btn btn-outline-info my-2 my-sm-0" id="btnBuscar"><i class="fas fa-search"></i> Buscar</button>                                 
                </ul>  
                    <!-- Menú desplegable de usuario -->
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${user}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="index.jsp"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>
        <div class="container mt-4">
            <div class="row">
                    <div class="container mt-4">
            <div class="row">
                <!-- Aquí se asume que estás iterando sobre una lista de productos -->
                <c:forEach var="producto" items="${productos}">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">${producto.nombres}</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">${producto.precio}</i></label>
                                    <img src="${producto.imagen}" width="300" height="280" alt="${producto.nombres}">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>${producto.descripcion}</label>
                                    </div>
                                    <div class="col-sm-12 text-center">                                
                                        <a href="Controlador2?accion=AgregarCarrito&id=${producto.id}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador2?accion=Comprar&id=${producto.id}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
                
                
                
                
                <!-- Paquete 1 -->
                <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Machu Picchu</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">300.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/machu_picchu.jpg" width="300" height="280" alt="Machu Picchu">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Cuzco: Caminata de 4 dias por el Camino del Inca</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                
                
                                     <!-- Paquete 2 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Amazonas</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">150.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/amazonas.png" width="300" height="280" alt="Amazonas">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Amazonas: Diversion de 4 dias por la Selva</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                     <!-- Paquete 3 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Lago Titicaca</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">100.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/titicaca.png" width="300" height="280" alt="Lago Titicaca">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Puno: Aventura de 4 dias por los Andes</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                     <!-- Paquete 4-->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Marcahuasi</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">150.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/marcahuasi.png" width="300" height="280" alt="Marcahuasi">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Lima: Caminata de 4 dias por el Camino de Huarochiri</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                     <!-- Paquete 5 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete al Manu</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">150.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/manu.png" width="300" height="280" alt="Manu">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Madre de Dios: Turismo de 4 dias por los Andes</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                     <!-- Paquete 6 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Choquequirao</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">150.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/choquequirao.png" width="300" height="280" alt="Choquequirao">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Cuzco: Aventura de 4 dias por los Andes</label>
                                        <label>4 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                     <!-- Paquete 7 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Ica</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">100.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/paracas.png" width="300" height="280" alt="Paracas">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Ica: Diversion de 3 dias por Paracas</label>
                                        <label>3 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                                    
                                    
                                     <!-- Paquete 8 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Lunahuana</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">80.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/lunahuana.png" width="300" height="280" alt="Lunahuana">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Lima: Avemtura de 1 dia </label>
                                        <label>1 dia * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                
                                     <!-- Paquete 9 -->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-sm-12">Paquete a Chancay</h4>                                    
                                </div>
                                <div class="card-body text-center">
                                    <label><i class="fas fa-dollar-sign">90.00</i></label>
                                    <img src="${pageContext.request.contextPath}/paquetes/chancay.png" width="300" height="280" alt="Chancay">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>EXCURSION DE VARIOS DIAS</label>
                                        <label>Lima: Turismo de 2 dias por el Castillo</label>
                                        <label>2 dias * Grupo reducido * Recogida disponible</label>
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                
                                    
                                    
                                    
                                    
                                    
                                    
            </div>
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/index.js" type="text/javascript"></script>
    </body>
</html>
