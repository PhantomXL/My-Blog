<?php
session_start();
require_once "functions/userFunctions.php";
require_once "functions/databaseFunctions.php";

requireLogin(); // ensures user is logged in

require_once "includes/header.php"; // optional header HTML
?>

<!-- Optional page heading -->
<h2>📝 Create a New Post</h2>
<a href="dashboard.php" class="back-dashboard-btn">← Back To Dashboard</a>

<!-- Wrap the included form in a container for styling -->
<div class="dashboard-container">
    <?php require_once "includes/editor_form.php"; ?>
</div>

<?php require_once "includes/footer.php"; ?>