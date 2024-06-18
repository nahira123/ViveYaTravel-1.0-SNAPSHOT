const Clickbutton = document.querySelectorAll('.button');
const tbody = document.querySelector('.tbody');
let carrito = [];
let total = 0;

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
        precio: itemPrice,
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
            <td class="table__price"><p>${item.precio}</p></td>
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
        const precio = Number(item.precio.replace("$", ''));
        Total += precio * item.cantidad;
    });

    itemCartTotal.innerHTML = `Total $${Total}`;
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

function addLocalStorage() {
    localStorage.setItem('carrito', JSON.stringify(carrito));
}

window.onload = function () {
    const storage = JSON.parse(localStorage.getItem('carrito'));
    if (storage) {
        carrito = storage;
        renderCarrito();
    }
};

// Event listener para redirigir a la página de compra
document.getElementById('comprar-btn').addEventListener('click', () => {
    localStorage.setItem('carrito', JSON.stringify(carrito));
    window.location.href = 'checkout.jsp';
});

// Función para mostrar alertas
function showAlert(message, alertClass) {
    const alertBox = document.querySelector(`.${alertClass}`);
    alertBox.textContent = message;
    alertBox.classList.remove('hide');
    setTimeout(() => alertBox.classList.add('hide'), 3000);
}
