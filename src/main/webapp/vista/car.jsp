<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#bla" />
    <style>
    body {
    font-family: 'Arial', sans-serif;
    color: #555;
}

.invoice-box {
    max-width: 800px;
    margin: auto;
    padding: 30px;
    border: 1px solid #eee;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
    font-size: 16px;
    line-height: 24px;
    font-family: 'Arial', sans-serif;
    color: #555;
}

.invoice-box table {
    width: 100%;
    line-height: inherit;
    text-align: left;
    border-collapse: collapse;
}

.invoice-box table td {
    padding: 5px;
    vertical-align: top;
}

.invoice-box table tr td:nth-child(2) {
    text-align: right;
}

.invoice-box table tr.top table td {
    padding-bottom: 20px;
}

.invoice-box table tr.top table td.title {
    font-size: 45px;
    line-height: 45px;
    color: #333;
}

.invoice-box table tr.information table td {
    padding-bottom: 40px;
}

.invoice-box table tr.heading td {
    background: #eee;
    border-bottom: 1px solid #ddd;
    font-weight: bold;
}

.invoice-box table tr.details td {
    padding-bottom: 20px;
}

.invoice-box table tr.item td {
    border-bottom: 1px solid #eee;
}

.invoice-box table tr.item.last td {
    border-bottom: none;
}

.invoice-box table tr.total td:nth-child(4) {
    border-top: 2px solid #eee;
    font-weight: bold;
}

.invoice-box table tr.footer td {
    padding-top: 20px;
    text-align: center;
    font-size: 14px;
    color: #777;
}

.invoice-details {
    text-align: right;
}
</style>


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
      <div class="invoice-box">
          <table cellpadding="0" cellspacing="0" class="invoice-table">
            <tr class="top">
                <td colspan="4">
                    <table>
                        <tr>
                            <td class="title">
                                <h1>VIVE YA TRAVEL</h1>
                            </td>
                            <td class="invoice-details">
                                <h2>Boleta</h2>
                                <p>Fecha: 04/07/2024</p>
                                <p>Boleta #: 12345</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Dirección de la Empresa<br>
                                Ciudad, Estado, Código Postal<br>
                                Teléfono: (123) 456-7890<br>
                                Correo: info@empresa.com<br>
                                Sitio Web: www.empresa.com<br>
                                Horario de Atención: Lunes a Sabado, 9am-5pm<br>
                                Razón Social: Nombre de la Empresa S.A.<br>
                                Condiciones de Garantía: Detalles de las condiciones de garantía<br>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            
            <tr class="footer">
                <td colspan="4">
                    <p>Gracias por su compra!</p>
                    <p>Si tiene alguna pregunta sobre esta boleta, contáctenos a través de la información proporcionada arriba.</p>
                </td>
            </tr>
        </table>
    </div>                 
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
            
            <button class="btn btn-success me-2" id="comprar-btn">Comprar</button>
            <button class="btn btn-primary" id="imprimir-btn">Imprimir</button>
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
        
        
        
    <script>
      
        
        
    document.getElementById('imprimir-btn').addEventListener('click', function() {
        // Guardar el contenido original
        var productos = document.querySelectorAll('.card');
        var contenidoOriginal = [];

        productos.forEach(function(producto, index) {
            contenidoOriginal.push(producto.innerHTML);

            // Reemplazar la imagen con el texto "Paquete X"
            var img = producto.querySelector('.card-img-top');
            if (img) {
                img.style.display = 'none';
                var paqueteTexto = document.createElement('div');
                paqueteTexto.textContent = `Paquete ${index + 1}`;
                paqueteTexto.className = 'paquete-texto';
                producto.insertBefore(paqueteTexto, img.nextSibling);
            }
        });

        // Ocultar contenido no relevante para la impresión
        document.querySelectorAll('header, footer, .tab-pane').forEach(function(element) {
            element.style.display = 'none';
        });

        // Mostrar solo el contenido del carrito
        document.querySelector('.carrito').style.display = 'block';

        // Ocultar botones específicos antes de imprimir
        document.querySelectorAll('.btn').forEach(function(button) {
            button.style.visibility = 'hidden';
        });

        // Imprimir la página
        window.print();

        // Restaurar el contenido original después de la impresión
        productos.forEach(function(producto, index) {
            producto.innerHTML = contenidoOriginal[index];
        });

        // Restaurar estilos después de la impresión
        document.querySelectorAll('header, footer, .tab-pane').forEach(function(element) {
            element.style.display = '';
        });
        document.querySelector('.carrito').style.display = '';

        // Restaurar visibilidad de los botones ocultados
        document.querySelectorAll('.btn').forEach(function(button) {
            button.style.visibility = 'visible';
        });
    });
</script>


<script>
    
    document.getElementById('comprar-btn').addEventListener('click', function() {
        // Simular una compra exitosa
        alert('Compra exitosa');

        // Aquí puedes agregar más lógica para actualizar el estado del carrito o realizar otras acciones necesarias

        // Evitar la redirección
        return false;
    });
</script>
        

<!-- Modal para mostrar los detalles de la compra -->
<div class="modal fade" id="detalleCompraModal" tabindex="-1" aria-labelledby="detalleCompraModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detalleCompraModalLabel">Detalle de la Compra</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-dark table-hover">
          <thead>
            <tr class="text-primary">
              <th scope="col">#</th>
              <th scope="col">Producto</th>
              <th scope="col">Precio</th>
              <th scope="col">Cantidad</th>
            </tr>
          </thead>
          <tbody id="detalle-compra-body">
            <!-- Aquí se agregarán los detalles de la compra dinámicamente con JavaScript -->
          </tbody>
        </table>
        <h3 class="modal-itemCartTotal text-black mt-3" id="modal-total">Total: </h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="comprar-modal-btn">Comprar</button>
      </div>
    </div>
  </div>
</div>

<script>
        const Clickbutton = document.querySelectorAll('.button');
        const tbody = document.querySelector('.tbody');
        const verDetalleBtn = document.getElementById('ver-detalle-btn');
        const detalleCompraBody = document.getElementById('detalle-compra-body');
        const modalTotal = document.getElementById('modal-total');
        const comprarModalBtn = document.getElementById('comprar-modal-btn');
        let carrito = [];

        // Event listeners para los botones de añadir al carrito
        Clickbutton.forEach(btn => {
            btn.addEventListener('click', addToCarritoItem);
        });

        function addToCarritoItem(e) {
            const button = e.target;
            const item = button.closest('.card');
            const itemTitle = item.querySelector('.card-title').textContent;
            const itemPrice = item.querySelector('.precio').textContent;
            const itemImg = item.querySelector('.card-img-top').src;

            const newItem = {
                title: itemTitle,
                price: itemPrice,
                img: itemImg,
                cantidad: 1
            };

            addItemCarrito(newItem);
        }

        function addItemCarrito(newItem) {
            const alert = document.querySelector('.alert');

            setTimeout(() => {
                alert.classList.add('hide');
            }, 2000);
            alert.classList.remove('hide');

            const InputElemnto = tbody.getElementsByClassName('input__elemento');
            for (let i = 0; i < carrito.length; i++) {
                if (carrito[i].title.trim() === newItem.title.trim()) {
                    carrito[i].cantidad++;
                    const inputValue = InputElemnto[i];
                    inputValue.value++;
                    CarritoTotal();
                    return null;
                }
            }

            carrito.push(newItem);
            renderCarrito();
        }

        function renderCarrito() {
            tbody.innerHTML = '';
            carrito.forEach((item, index) => {
                const tr = document.createElement('tr');
                tr.classList.add('ItemCarrito');
                const Content = `
                    <th scope="row">${index + 1}</th>
                    <td class="table__productos">
                        <img src="${item.img}" alt="" width="50">
                        <h6 class="title">${item.title}</h6>
                    </td>
                    <td class="table__price"><p>${item.price}</p></td>
                    <td class="table__cantidad">
                        <input type="number" min="1" value="${item.cantidad}" class="input__elemento">
                        <button class="delete btn btn-danger">x</button>
                    </td>
                `;
                tr.innerHTML = Content;
                tbody.append(tr);

                tr.querySelector('.delete').addEventListener('click', removeItemCarrito);
                tr.querySelector('.input__elemento').addEventListener('change', sumaCantidad);
            });
            CarritoTotal();
        }

        function CarritoTotal() {
            let Total = 0;
            const itemCartTotal = document.querySelector('.itemCartTotal');
            carrito.forEach((item) => {
                const precio = Number(item.price.replace("$", ''));
                Total += precio * item.cantidad;
            });

            itemCartTotal.innerHTML = `Total: $${Total.toFixed(2)}`;
            addLocalStorage();
        }

        function removeItemCarrito(e) {
            const buttonDelete = e.target;
            const tr = buttonDelete.closest('.ItemCarrito');
            const title = tr.querySelector('.title').textContent;
            carrito = carrito.filter(item => item.title.trim() !== title.trim());

            const alert = document.querySelector('.remove');

            setTimeout(() => {
                alert.classList.add('remove');
            }, 2000);
            alert.classList.remove('remove');

            tr.remove();
            CarritoTotal();
        }

        function sumaCantidad(e) {
            const sumaInput = e.target;
            const tr = sumaInput.closest('.ItemCarrito');
            const title = tr.querySelector('.title').textContent;
            carrito.forEach(item => {
                if (item.title.trim() === title.trim()) {
                    sumaInput.value < 1 ? (sumaInput.value = 1) : sumaInput.value;
                    item.cantidad = sumaInput.value;
                    CarritoTotal();
                }
            });
        }

        // Función para agregar productos al carrito y guardarlos en el localStorage
        function addLocalStorage() {
            localStorage.setItem('carrito', JSON.stringify(carrito));
        }

        // Inicializar el carrito al cargar la página
        window.onload = function () {
            const storage = JSON.parse(localStorage.getItem('carrito'));
            if (storage) {
                carrito = storage;
                renderCarrito();
            }
        };

        // Función para mostrar los detalles de la compra en el modal
        verDetalleBtn.addEventListener('click', function () {
            // Limpiar el contenido previo
            detalleCompraBody.innerHTML = '';

            // Obtener los datos del carrito desde localStorage
            const carrito = JSON.parse(localStorage.getItem('carrito')) || [];

            // Verificar si el carrito está vacío
            if (carrito.length === 0) {
                detalleCompraBody.innerHTML = '<tr><td colspan="4" class="text-center text-white-50">El carrito está vacío</td></tr>';
                modalTotal.textContent = 'Total: $0.00';
                return;
            }

            // Iterar sobre los elementos del carrito y agregarlos al modal
            let total = 0;
            carrito.forEach((item, index) => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <th scope="row">${index + 1}</th>
                    <td>${item.title}</td>
                    <td>$${item.price}</td>
                    <td>${item.cantidad}</td>
                `;
                detalleCompraBody.appendChild(row);

                // Calcular el total
                total += Number(item.price.replace("$", "")) * item.cantidad;
            });

            // Actualizar el total en el modal
            modalTotal.textContent = `Total: $${total.toFixed(2)}`;
        });

        // Función para manejar el botón de comprar en el modal
        comprarModalBtn.addEventListener('click', function () {
            // Simular una compra exitosa
            alert('Compra exitosa');

            // Limpiar el carrito en localStorage
            localStorage.removeItem('carrito');

            // Actualizar el carrito en la interfaz principal
            carrito = [];
            renderCarrito();

            // Cerrar el modal
            const detalleCompraModal = new bootstrap.Modal(document.getElementById('detalleCompraModal'));
            detalleCompraModal.hide();
        });
    </script>
        
    </body>
</html>
