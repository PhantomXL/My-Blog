<?php

declare(strict_types=1);

session_start();

require_once __DIR__ . "/../functions/userFunctions.php";
require_once __DIR__ . "/../functions/databaseFunctions.php";
require_once __DIR__ . "/../functions/genericFunctions.php";

requireAdmin();

if (!isset($_GET["id"])) {
    redirect("../error.php");
}

execute(
    "DELETE FROM comments WHERE id = ?",
    "i",
    [(int) $_GET["id"]]
);

redirect("../manage_comments.php");