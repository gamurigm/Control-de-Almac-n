<?php

require_once 'config.php';
$result = false;
$sql = "ALTER TABLE `productos` AUTO_INCREMENT = 1 ";
$query = $pdo->prepare($sql);
    $result1 = $query->execute();

if(!empty($_POST)) {

    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $sku = $_POST['sku'];
    $descripcion = $_POST['descripcion'];
    $id_usuario = $_POST['id_usuario'];
    
    
    
    $sql = "INSERT INTO productos(id, nombre, marca, modelo, sku, descripción, id_usuario) 
            VALUES (:id, :nombre, :marca, :modelo, :sku, :descripcion, :id_usuario)";
    $query = $pdo->prepare($sql);
    $result = $query->execute([
        'id' => $id,
        'nombre' => $nombre, 
        'marca' => $marca, 
        'modelo' => $modelo, 
        'sku' => $sku, 
        'descripcion' => $descripcion, 
        'id_usuario' => $id_usuario, 
        
    ]);
}

?>

<html>
  <head>
    <title>Base de Datos Almacen</title>
    <link rel="stylesheet" href='./style.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
      <h1>Añadir Producto</h1>
      <br>
      <a href="index.php">Home</a>
      <br>
      <form action="add_products.php" method="POST">
      <?php
        if ($result) {
          echo '<div class="alert alert-success">Success!</div>';
        }
       
       ?>

        <input type="hidden" name="id" id="id">
        <br>
        <label for="">Nombre</label>
        <input type="text" name="nombre" id="nombre">
        <br>
        <label for="">Marca</label>
        <input type="text" name="marca" id="marca">
        <br>
        <label for="">Modelo</label>
        <input type="text" name="modelo" id="modelo">
        <br>
        <label for="">SKU</label>
        <input type="text" name="sku" id="sku">
        <br>
        <label for="">Descripción</label>
        <input type="text" name="descripcion" id="descripcion">
        <br>

        <input type="hidden" name="id_usuario" id="id_usuario">
        <br>
      
        <input type="submit" value="Guardar">
  </form>
  <ul>
    <li>
      <a href="product_list.php">Lista de Productos</a>
    </li>
    <li>
      <a href="add_users.php">Añadir Usuarios</a>
    </li>
  </ul>
  </div>
        
  </body>
</html>