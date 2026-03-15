<?php

declare(strict_types=1);

function fetchAll(string $sql, string $types = "", array $params = []): array
{
    $stmt = db()->prepare($sql);
    if (!$stmt) {
        throw new RuntimeException("Invalid SQL");
    }

    if ($types) {
        $stmt->bind_param($types, ...$params);
    }

    $stmt->execute();
    return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
}

function execute(string $sql, string $types = "", array $params = []): void
{
    $stmt = db()->prepare($sql);
    if (!$stmt) {
        throw new RuntimeException("Invalid SQL");
    }

    if ($types) {
        $stmt->bind_param($types, ...$params);
    }

    $stmt->execute();
}

function db(): mysqli
{
    static $conn = null;

    if ($conn === null) {
        $conn = new mysqli("localhost", "root", "", "blog");

        if ($conn->connect_error) {
            throw new RuntimeException("Database connection failed");
        }
    }

    return $conn;
}