<?php
session_start();

require_once "includes/header.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

if (!isset($_SESSION["user"])) {
    die("Access denied");
}

$user = $_SESSION["user"];
$isAdmin = ($user["role"] ?? "") === "admin";
?>

<h2>📊 Dashboard</h2>

<div class="dashboard-buttons">
    <!-- Create Posts -->
    <a href="create_posts.php" class="subpage-btn">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 5V19M5 12H19" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span>Create Posts</span>
    </a>

    <!-- Manage Posts -->
    <a href="manage_posts.php" class="subpage-btn">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M3 6H21M3 12H21M3 18H21" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span>Manage Posts</span>
    </a>

    <?php if ($isAdmin): ?>
        <!-- Manage Users (admin only) -->
        <a href="manage_users.php" class="subpage-btn">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="12" cy="7" r="4" stroke="#ffffff" stroke-width="2"/>
                <path d="M6 21C6 17 18 17 18 21" stroke="#ffffff" stroke-width="2" stroke-linecap="round"/>
            </svg>
            <span>Manage Users</span>
        </a>

        <!-- Manage Comments (admin only) -->
        <a href="manage_comments.php" class="subpage-btn">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span>Manage Comments</span>
        </a>
    <?php endif; ?>
</div>

<?php require_once "includes/footer.php"; ?>