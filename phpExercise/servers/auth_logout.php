<?php

declare(strict_types=1);
require_once __DIR__ . '/../functions/databaseFunctions.php';
require_once __DIR__ . '/../functions/userFunctions.php';

session_start();
session_destroy();

session_write_close();
header("Location: ../index.php");
exit;