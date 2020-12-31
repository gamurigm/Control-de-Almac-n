<?php

include_once 'config.php';
$result = false;

if(!empty($_POST)) {
    $id = $_POST['id'];
    $newName = $_POST['nombre'];
    $newLastname = $_POST['apellido'];

    $sql = "UPDATE usuarios SET nombre=:nombre, apellido=:apellido WHERE id=:id";
    $query = $pdo->prepare($sql);
    
    $result = $query->execute([
        'id' => $id,
        'nombre' => $newName,
        'apellido' => $newLastname
    ]);

    
    $nameValue = $newName;
    $lastnameValue = $newLastname;

} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM usuarios WHERE id=:id";
    $query = $pdo->prepare($sql);
    $query->execute([
      'id' => $id

]);

$row = $query->fetch(PDO::FETCH_ASSOC);
$nameValue = $row['nombre'];
$lastnameValue = $row['apellido'];

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
  <h1>Actualizar usuario</h1>
  <a href="list.php">atrás</a>
  <form action="update.php" method="post">
  <?php
        if ($result) {
          echo '<div class="alert alert-success">Success!</div>';
        }       
  ?>
        
        <br>
        <label for="">Nombre</label>
        <input type="text" name="nombre" id="nombre" value="<?php echo $nameValue ;?>">
        <br>
        <label for="">Apellido</label>
        <input type="text" name="apellido" id="apellido" value="<?php echo $lastnameValue; ?>">
        <br>
        
        <input type="hidden" name="id" value="<?php echo $id?>">
        
        <input type="submit" value="update">
        
  </form>
  <ul>
    
    <li>
      <a href="add_users.php">Añadir Usuarios</a>
    </li>
    
  </ul>
  </div>
        
  </body>
</html>
