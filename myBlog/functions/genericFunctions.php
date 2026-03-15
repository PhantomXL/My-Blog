<?php

declare(strict_types=1);

function redirect(string $path): void
{
    header("Location: $path");
    exit;
}

function escape(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES, "UTF-8");
}