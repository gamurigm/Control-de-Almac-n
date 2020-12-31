<?php

require_once 'config.php';
$queryResult = $pdo->query("SELECT * FROM usuarios");

?>

<html>
  <head>
    <title>Base de Datos Almacen</title>
    <link rel="stylesheet" href='./style.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  </head>
  <body>
  <div class="container">
  <h1>Lista de Usuarios</h1>
      <a href="index.php">Home</a>
      <table class=table>
          <tr>
              <th>Id</th>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>CI</th>
              <th>Email</th>
              <th>Editar</th>
              <th>Eliminar</th>
          </tr>
          <?php
          while($row = $queryResult->fetch(PDO::FETCH_ASSOC)) {
              
              echo '<tr>';
              echo '<td>'.$row['id'].'</td>';
              echo '<td>'.$row['Nombre'].'</td>';
              echo '<td>'.$row['Apellido'].'</td>';
              echo '<td>'.$row['CI'].'</td>';
              echo '<td>'.$row['Email'].'</td>';
              echo '<td><a href="update.php?id='.$row['id'].'">Editar</a></td>';
              echo '<td><a href="delete.php?id='.$row['id'].'">Eliminar</a></td>';
              echo '</tr>';
          }
              ?>
              
      </table>
      <a href="product_list.php">Lista de productos</a>
  </div>
  </body>
</html>
