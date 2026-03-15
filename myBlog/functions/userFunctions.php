<?php

declare(strict_types=1);

require_once __DIR__ . "/databaseFunctions.php";

function login(string $username, string $password): bool
{
    $users = fetchAll(
        "SELECT * FROM users WHERE username = ?",
        "s",
        [$username]
    );

    if (!$users) {
        return false;
    }

    $user = $users[0];

    if (!password_verify($password, $user["password"])) {
        return false;
    }

    $_SESSION["user"] = $user;
    return true;
}

function requireLogin(): void
{
    if (!isset($_SESSION["user"])) {
        header("Location: error.php");
        exit;
    }
}

function requireAdmin(): void
{
    requireLogin();

    if ($_SESSION["user"]["role"] !== "admin") {
        header("Location: error.php");
        exit;
    }
}