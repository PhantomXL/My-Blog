<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../functions/databaseFunctions.php';

$uploadDir = __DIR__ . '/../uploads/';
if(!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

if(isset($_FILES['image'])){
    $file = $_FILES['image'];
    $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
    $filename = uniqid('img_') . '.' . $ext;
    $destination = $uploadDir . $filename;

    if(move_uploaded_file($file['tmp_name'], $destination)){
        // Return relative URL
        $url = 'uploads/' . $filename;
        echo json_encode(['success'=>true, 'url'=>$url]);
        exit;
    }
}

echo json_encode(['success'=>false]);