<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#bla" />
        <title>Vive Ya Travel</title>

        <!-- CSS only -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css" />
    </head>
    <body>
        <header class="container-fluid bg-dark position-sticky top-0">
            <ul class="nav nav-pills mb-3 py-3 container" id="pills-tab" role="tablist">
                <li class="nav-item text-primary" role="presentation">
                    <a href="index.jsp"    
                       class="nav-link "
                       data-bs-target="#pills-home"
                       type="button"
                       role="tab"
                       aria-controls="pills-home"
                       aria-selected="true">Home</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Destinos</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Carrito</a>
                </li>
            </ul>
        </header>

        <div class="alert container position-sticky top-0 alert-primary hide" role="alert">
            Paquete Añadido al Carrito!
        </div>
        <div class="alert container position-sticky top-0 alert-danger remove" role="alert">
            Paquete Removido del Carrito!
        </div>

        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                1
            </div>
            <div class="tab-pane fade show active container" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <h2 class="h4 m-4 text-primary">Paquetes</h2>
                <!--Producto 1-->
                <div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4">
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Machu Picchu</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/machu_picchu.jpg" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Cuzco: Caminata de 4 dias por el Camino del Inca</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$499.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products, modifying the content as necessary -->
                    <!--Producto 2-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Amazonas</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/amazonas.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Amazonas: Diversion de 4 dias por la Selva</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$699.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Producto 3-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Lago Titicaca</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/titicaca.jpg" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Puno: Aventura de 4 dias por los Andes</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$599.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>    

                    <!--Producto 4-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Marcahuasi</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/marcahuasi.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Lima: Caminata de 4 dias por el Camino de Huarochiri</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$150.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>    

                    <!--Producto 5-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Reserva Nacional del Manu</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/manu.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Madre de Dios: Turismo de 4 dias por los Andes</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$399.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>    

                    <!--Producto 6-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Choquequirao</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/choquequirao.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Cuzco: Aventura de 4 dias por los Andes</label>
                                    <label>4 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$499.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>   

                    <!--Producto 7-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Paracas</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/paracas.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Ica: Diversion de 3 dias por Paracas</label>
                                    <label>3 dias * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$250.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>   

                    <!--Producto 8-->
                    <div class="col d-flex justify-content-center mb-4">
                        <div class="card shadow mb-1 bg-dark rounded" style="width: 20rem;">
                            <h5 class="card-title pt-2 text-center text-primary">Lunahuana</h5>
                            <img src="<%= request.getContextPath()%>/paquetes/lunahuana.png" width="300" height="280" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text text-white-50 description">
                                    <label>Lima: Avemtura de 1 dia </label>
                                    <label>1 dia * Grupo reducido * Disponible</label>
                                </p>
                                <h5 class="text-primary">Precio: <span class="precio">$99.00</span></h5>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-primary button">Añadir a Carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>  




                </div>
            </div>
            <div class="tab-pane fade carrito" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                <br>
                <table class="table table-dark table-hover">
                    <thead>
                        <tr class="text-primary">
                            <th scope="col">#</th>
                            <th scope="col">Productos</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody class="tbody"></tbody>
                </table>
                <br><br>
                <div class="row mx-4">
                    <div class="col">
                        <h3 class="itemCartTotal text-white">Total: 0</h3>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <button class="btn btn-success" id="comprar-btn">COMPRAR</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="bg-dark p-3 mt-5">
            <p class="text-center m-0 text-muted">Agencia - Vive Ya Travel</p>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts.js"></script>
    </body>
</html>
