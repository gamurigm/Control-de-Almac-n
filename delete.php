<?php

include_once 'config.php';

$id = $_GET['id'];

$sql = 'DELETE FROM usuarios WHERE id=:id';
$query = $pdo->prepare($sql);
$query->execute([
    'id' => $id
]);

header("Location:user_list.php");

$sql = 'DELETE FROM productos WHERE id=:id';
$query = $pdo->prepare($sql);
$query->execute([
    'id' => $id
]);
header("location:product_list.php");

?>