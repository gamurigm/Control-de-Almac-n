<?php

$dbHost = 'localhost';
$dbName = 'control_de_almacen';
$dbUser ='root';
$dbPass = '';

try {
    $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName","$dbUser","$dbPass");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(Exception $e) {
    echo $e->getMessage();
}
