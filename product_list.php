<?php

require_once 'config.php';
$queryResult = $pdo->query("SELECT * FROM productos");

?>

<html>
  <head>
    <title>Base de Datos Almacen</title>
    <link rel="stylesheet" href='./style.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  </head>
  <body>
  <div class="container">
  <h1>Lista de Productos</h1>
      <a href="index.php">Home</a>
      <table class=table>
          <tr>
              <th>Id</th>
              <th>Nombre</th>
              <th>Marca</th>
              <th>Modelo</th>
              <th>SKU</th>
              <th>Descripción</th>
              <th>Id_Usuario</th>
              <th>Editar</th>
              <th>Eliminar</th>
          </tr>
          <?php
          while($row = $queryResult->fetch(PDO::FETCH_ASSOC)) {
              
              echo '<tr>';
              echo '<td>'.$row['Id'].'</td>';
              echo '<td>'.$row['Nombre'].'</td>';
              echo '<td>'.$row['Marca'].'</td>';
              echo '<td>'.$row['Modelo'].'</td>';
              echo '<td>'.$row['SKU'].'</td>';
              echo '<td>'.$row['Descripción'].'</td>';
              echo '<td>'.$row['Id_Usuario'].'</td>';
              echo '<td><a href="update.php?id='.$row['Id'].'">Editar</a></td>';
              echo '<td><a href="delete.php?id='.$row['Id'].'">Eliminar</a></td>';
              echo '</tr>';
          }
              ?>

      </table>
  </div>        
  </body>
</html>
