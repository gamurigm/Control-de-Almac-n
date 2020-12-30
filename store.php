<?php

require_once 'config.php';
$result = false;

if(!empty($_POST)) {

    $id = $_POST['id'];
    $fecha_ingreso = $_POST['fecha_ingreso'];
    $fecha_egreso = $_POST['fecha_egreso'];
    $cantidad = $_POST['cantidad'];
    $id_producto = $_POST['id_producto'];
    $id_factura = $_POST['id_factura'];
    $id_usuario = $_POST['id_usuario'];
    $costo = $_POST['costo'];
    $pvp = $_POST['pvp'];
    $total_costo = $_POST['total_costo'];
    $total_pvp = $_POST['total_pvp'];
    
    
    $sql = "INSERT INTO productos(id, fecha_ingreso, fecha_egreso, cantidad, id_producto, id_factura, id_usuario
    costo, pvp, total_costo, total_pvp) 
            VALUES (:id, :fecha_ingreso, :fecha_egreso, :cantidad, :id_producto, :id_factura, :id_usuario
    :costo, :pvp, :total_costo, :total_pvp)";
    $query = $pdo->prepare($sql);
    $result = $query->execute([
        'id' => $id,
        'fecha_ingreso' => $fecha_ingreso, 
        'fecha_egreso' => $fecha_egreso, 
        'cantidad'=> $cantidad, 
        'id_producto' => $id_producto, 
        'id_factura' => $id_factura, 
        'id_usuario' => $id_usuario,
        'costo' => $costo, 
        ' pvp' => $pvp, 
        'total_costo' => $total_costo, 
        'total_pvp' => $total_pvp
        
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
      <h1>Añadir Usuario</h1>
      <br>
      <a href="index.php">Home</a>
      <br>
      <form action="store.php" method="POST">
      <?php
        if ($result) {
          echo '<div class="alert alert-success">Success!</div>';
        }
       
       ?>

        <input type="hidden" name="id" id="id">
        <br>
        <label for="">Fecha de Ingreso</label>
        <input type="date" name="fecha_ingreso" id="fecha_ingreso">
        <br>
        <label for="">Fecha de egreso</label>
        <input type="date" name="fecha_egreso" id="fecha_egreso">
        <br>
        <label for="">Cantidad</label>
        <input type="text" name="cantidad" id="cantidad">
        <br>
        <input type="hidden" name="id_producto" id="id_producto">
        <br>
        <input type="hidden" name="id_factura" id="id_factura">
        <br>
        <input type="hidden" name="id_usuario" id="id_usuario">
        <br>
        <label for="">Costo</label>
        <input type="text" name="costo" id="costo">
        <br>
        <label for="">PVP</label>
        <input type="text" name="pvp" id="pvp">
        <br>
        <label for="">Total Costo</label>
        <input type="text" name="total_costo" id="total_costo">
        <br>
        <label for="">Total PVP</label>
        <input type="text" name="total_pvp" id="total_pvp">
        <br>

        <input type="submit" value="Guardar">
  </form>

        
  </body>
</html>