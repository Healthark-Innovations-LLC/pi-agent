document.querySelectorAll('.add-to-cart').forEach(button => {
    button.addEventListener('click', (e) => {
        const productId = e.target.getAttribute('data-id');
        console.log(`Product ${productId} added to cart!`);
        alert(`Added product ${productId} to your cart!`);
    });
});
