<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Blog</title>

    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/layout.css">
    <link rel="stylesheet" href="assets/css/tables.css">
    <link rel="stylesheet" href="assets/css/cards.css">
    <link rel="stylesheet" href="assets/css/pagination.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    <link rel="stylesheet" href="assets/css/shared_buttons.css">
    <link rel="stylesheet" href="assets/css/header_nav.css">
    <link rel="stylesheet" href="assets/css/forms.css">
    <link rel="stylesheet" href="assets/css/post.css">
    <link rel="stylesheet" href="assets/css/comments.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/editor.css">
    <link rel="stylesheet" href="assets/css/error.css">
</head>
<body>

<header>
    <div class="navbar">
        <div class="navbar-left">
            <!-- Blog-like SVG -->
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4 4h16v16H4z"/>
                <path stroke-linecap="round" stroke-linejoin="round" d="M4 8h16M4 12h16M4 16h16"/>
            </svg>
            My Blog
        </div>

        <!-- Hamburger menu for mobile -->
        <div class="hamburger" id="hamburger">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="navbar-right" id="navbar-right">
            <a href="index.php">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M3 12h18M3 6h18M3 18h18"/>
                </svg>
                Home
            </a>
            <a href="dashboard.php">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M3 12h18M3 6h18M3 18h18"/>
                </svg>
                Dashboard
            </a>
            <a href="view_all_posts.php">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
                View All Posts
            </a>
            <?php if (isset($_SESSION['user'])): ?>
                <a href="servers/auth_logout.php">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M16 17l5-5-5-5M21 12H9M13 5v-2H5v18h8v-2"/>
                    </svg>
                    Logout
                </a>
            <?php else: ?>
                <a href="login.php">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M12 2v20M5 12h14"/>
                    </svg>
                    Login
                </a>
            <?php endif; ?>
        </div>
    </div>
</header>

<main class="container">

<!-- Mobile menu toggle script -->
<script>
    const hamburger = document.getElementById('hamburger');
    const navbarRight = document.getElementById('navbar-right');

    hamburger.addEventListener('click', () => {
        navbarRight.classList.toggle('active');
    });
</script>