<?php
require_once "includes/header.php";
require_once "functions/genericFunctions.php";
require_once "functions/databaseFunctions.php";
?>

<div class="login-page-container">
    <div class="login-card-wrapper">

        <!-- Form card including Login label + icon -->
        <form action="servers/auth_login.php" method="post" class="login-form">
            
            <!-- Login header inside card -->
            <div class="login-header">
                <span class="login-icon">🔐</span>
                <h2 class="login-label">Login</h2>
            </div>

            <?php if (isset($_SESSION["login_error"])): ?>
                <div class="error"><?= escape($_SESSION["login_error"]) ?></div>
                <?php unset($_SESSION["login_error"]); ?>
            <?php endif; ?>

            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="comment-btn">Login</button>
        </form>
    </div>
</div>

<?php require_once "includes/footer.php"; ?>