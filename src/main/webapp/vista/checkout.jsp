<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vive Ya Travel - Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-primary">Resumen de Compra</h2>
        <table class="table table-dark table-hover mt-3">
            <thead>
                <tr class="text-primary">
                    <th scope="col">#</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Total</th>
                </tr>
            </thead>
            <tbody class="tbody" id="checkout-tbody"></tbody>
        </table>
        <h3 class="text-white">Total: <span id="checkout-total"></span></h3>
        <button class="btn btn-success mt-3" onclick="printInvoice()">Imprimir Boleta/Factura</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Recuperar carrito de localStorage
        const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        const tbody = document.getElementById('checkout-tbody');
        let total = 0;

        // Renderizar productos en la tabla
        carrito.forEach((producto, index) => {
            const precio = Number(producto.precio.replace('$', '')); // Adaptación para el precio en string
            const totalProducto = precio * producto.cantidad;
            total += totalProducto;
            tbody.innerHTML += `
                <tr>
                    <th scope="row">${index + 1}</th>
                    <td>${producto.title}</td>
                    <td>$${precio.toFixed(2)}</td>
                    <td>${producto.cantidad}</td>
                    <td>$${totalProducto.toFixed(2)}</td>
                </tr>
            `;
        });

        // Mostrar el total
        document.getElementById('checkout-total').textContent = `$${total.toFixed(2)}`;

        // Función para imprimir la boleta/factura
        function printInvoice() {
            window.print();
        }
    </script>
</body>
</html>
