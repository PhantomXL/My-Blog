<?php

declare(strict_types=1);

session_start();

require_once __DIR__ . "/../functions/userFunctions.php";
require_once __DIR__ . "/../functions/databaseFunctions.php";
require_once __DIR__ . "/../functions/genericFunctions.php";

requireAdmin();

if (
    empty($_POST["username"]) ||
    empty($_POST["password"]) ||
    empty($_POST["role"])
) {
    redirect("../error.php");
}

$hash = password_hash($_POST["password"], PASSWORD_DEFAULT);

execute(
    "INSERT INTO users (username, password, role) VALUES (?, ?, ?)",
    "sss",
    [
        $_POST["username"],
        $hash,
        $_POST["role"]
    ]
);

redirect("../manage_users.php");