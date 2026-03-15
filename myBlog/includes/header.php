<?php
declare(strict_types=1);

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$isLoggedIn = isset($_SESSION["user"]);
$isAdmin = $isLoggedIn && $_SESSION["user"]["role"] === "admin";

/**
 * Include header HTML
 */
require_once __DIR__ . "/header.html.php";