document.addEventListener("DOMContentLoaded", () => {
    const hamburger = document.querySelector('.hamburger');
    const navbarRight = document.querySelector('.navbar-right');

    if (hamburger) {
        hamburger.addEventListener('click', () => {
            navbarRight.classList.toggle('active');
            hamburger.classList.toggle('active'); // Lines → X animation
        });
    }
});