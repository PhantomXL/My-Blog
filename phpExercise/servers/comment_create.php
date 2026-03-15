<?php

declare(strict_types=1);

session_start();

require_once __DIR__ . "/../functions/databaseFunctions.php";
require_once __DIR__ . "/../functions/genericFunctions.php";

if (
    empty($_POST["post_id"]) ||
    empty($_POST["comment"]) ||
    (empty($_POST["name"]) && !isset($_SESSION["user"]))
) {
    redirect("../error.php");
}

$name = isset($_SESSION["user"]) ? $_SESSION["user"]["username"] : $_POST["name"];

execute(
    "INSERT INTO comments (post_id, name, comment) VALUES (?, ?, ?)",
    "iss",
    [
        (int) $_POST["post_id"],
        $name,
        $_POST["comment"]
    ]
);

redirect("../index.php?id=" . (int) $_POST["post_id"]);