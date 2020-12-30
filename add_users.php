<?php

require_once 'config.php';
$result = false;

if(!empty($_POST)) {

    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $ci = $_POST['ci'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $profesion = $_POST['profesion'];
    $pass = md5($_POST['pass']);
    $usuario = $_POST['usuario'];
    $departamento = $_POST['departamento'];
    $cargo = $_POST['cargo'];
    $institucion = $_POST['institucion'];
    
    $sql = "INSERT INTO usuarios(id, nombre, apellido, ci, email, teléfono, profesión, contraseña, usuario, departamento,
       cargo, institución
         ) 
        VALUES 
       (:id, :nombre, :apellido, :ci, :email, :telefono, :profesion, :pass, :usuario, :departamento, 
       :cargo, :institucion)";
    $query = $pdo->prepare($sql);
    $result = $query->execute([
        'id' => $id,
        'nombre' => $nombre,
        'apellido'=> $apellido,
        'ci' => $ci, 
        'email' => $email, 
        'telefono' => $telefono,
        'profesion' => $profesion, 
        'pass' => $pass, 
        'usuario' => $usuario, 
        'departamento' => $departamento,
        'cargo' => $cargo, 
        'institucion' => $institucion
    ]);
}

?>

<html>
  <head>
    <title>Base de Datos Almacen</title>
    <link rel="stylesheet" href='style.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
      <h1>Añadir Usuario</h1>
      <br>
      <a href="index.php">Home</a>
      <br>
      <form action="add_users.php" method="POST">
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
        <label for="">Apellido</label>
        <input type="text" name="apellido" id="apellido">
        <br>
        <label for="">CI</label>
        <input type="text" name="ci" id="ci">
        <br>
        <label for="">Email</label>
        <input type="text" name="email" id="email">
        <br>
        <label for="">Teléfono</label>
        <input type="text" name="telefono" id="telefono">
        <br>
        <label for="">Profesión</label>
        <input type="text" name="profesion" id="profesion">
        <br>
        <label for="">Contraseña</label>
        <input type="password" name="pass" id="pass">
        <br>
        <label for="">Usuario<label>
        <input type="text" name="usuario" id="usuario">
        <br>
        <label for="">Departamento</label>
        <input type="text" name="departamento" id="departamento">
        <br>
        <label for="">Cargo</label>
        <input type="text" name="cargo" id="cargo">
        <br>
        <label for="">Institución</label>
        <input type="text" name="institucion" id="institucion">
        <br>
        <input type="submit" value="Guardar">
  </form>
  <ul>
    <li>
      <a href="">List Users</a>
    </li>
    <li>
      <a href="">Add Users</a>
    </li>
  </ul>
  </div>
        
  </body>
</html>