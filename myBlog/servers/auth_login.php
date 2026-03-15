<?php

declare(strict_types=1);

session_start();

require_once __DIR__ . "/../functions/userFunctions.php";
require_once __DIR__ . "/../functions/genericFunctions.php";
require_once __DIR__ . "/../functions/databaseFunctions.php";

if (!login($_POST["username"], $_POST["password"])) {
    $_SESSION["login_error"] = "Wrong credentials. Please try again.";
    redirect("../login.php");
}

session_write_close();
redirect("../index.php");