<?php
declare(strict_types=1);
session_start();

require_once __DIR__ . "/../functions/userFunctions.php";
require_once __DIR__ . "/../functions/databaseFunctions.php";

requireLogin();

if (empty($_POST["title"]) || empty($_POST["content"])) {
    header("Location: ../error.php");
    exit;
}

execute(
    "INSERT INTO posts (title, content, user_id) VALUES (?, ?, ?)",
    "ssi",
    [
        $_POST["title"],
        $_POST["content"],
        $_SESSION["user"]["id"]
    ]
);

header("Location: ../index.php");
exit;