<?php
require_once "includes/header.php";
?>

<div class="error-page-container">
    <div class="error-card">

        <!-- Error text centered -->
        <h2 class="error-label">Error</h2>

        <!-- Logo positioned independently to the left -->
        <span class="error-logo">⚠️</span>

        <!-- Error message -->
        <p>Oops! Something went wrong. The page you are looking for cannot be displayed.</p>

        <!-- Back button styled like Post Comment -->
        <button type="button" class="back-post-comment-btn" onclick="window.location.href='index.php';">
            Back To Homepage
        </button>
    </div>
</div>

<?php require_once "includes/footer.php"; ?>