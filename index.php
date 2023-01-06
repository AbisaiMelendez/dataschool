<?php include 'templates/header.php'?>
<?php
include 'models/conexion.php';

$consulta = $bd->prepare("SELECT * FROM users WHERE id= ?");
$sentencia = $bd->query("SELECT * FROM users");
$sentenciaDos = $bd->query("SELECT * FROM states");



$users = $sentencia->fetchAll(PDO::FETCH_OBJ);
$estado = $sentenciaDos->fetchAll(PDO::FETCH_OBJ);

?>
<head>
  <!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<div class="container " style="margin-bottom: 8rem;">
<a href="./controllers/guardar.php" class="btn light-blue darken-2">Ingresar usuario</a>
<a href="./templates/cards.php" class="btn halfway-fab waves-effect waves-light orange">Ir a usuarios</a>
<br>
<br>
<table class="table-responsive   justify-content-center">
  <thead class="table-responsive  table-sm justify-content-center">
    <tr>
      <th scope="col">#</th>
      <th scope="col">nombre</th>
      <th scope="col">apellido</th>
      <th scope="col">email</th>
      <th scope="col">password</th>
      <th scope="col">rol</th>
      <th scope="col">estado</th>
      <th scope="col">tipos/clases</th>
      <th scope="col">cantidad/horas</th>
      <th scope="col">monto</th>
      <th scope="col">fecha/pago</th>
      <th scope="col">comentario</th>
      <th scope="col">estado/pago</th>
      <th scope="col">Acciones</th>
      
    </tr>
  </thead>
  <tbody>
<?php 
    foreach ($users as $dato){?>
    <tr class="table   justify-content-center">
      <th scope="row"><?php echo $dato->id ?></th>
      <td ><?php echo $dato->name ?></td>
      <td><?php echo $dato->lastName ?></td>
      <td><?php echo $dato->email ?></td>
      <td><?php echo $dato->password ?></td>
      <td><?php echo $dato->idRol ?></td>
      <td><?php echo $dato->idState ?></td>
      <td><?php echo $dato->typeClass ?></td>
      <td><?php echo $dato->cantidad ?></td>
      <td><?php echo "$".$dato->monto ?></td>
      <td><?php echo $dato->fechaPago ?></td>
      <td><?php echo $dato->comentario ?></td>
      <td><?php echo $dato->estadoPago ?></td>
      <td>

<?php 
    if ($dato->idState == 1){
      ?>
      <a href="./controllers/estado.php?id=<?php echo $dato->id?>" class="btn light-blue darken-2">activo</a>
      <?php       
    } else {
      ?>
      <a href="./controllers/estado.php?id=<?php echo $dato->id?>" class="btn red lighten-1">inactivo</a>
      <?php 
    }
?>
    <td style="text-align:center; width: 25% ;">
        <a href="./controllers/editar.php?id=<?php echo $dato->id?>" class="btn light-blue darken-2">Editar</a>
        <a href="./controllers/eliminar.php?id=<?php echo $dato->id?>" class="btn pink darken-1">Eliminar</a>
        <input type="hidden" href="./controllers/estado.php?id=<?php echo $dato->id?>" class="btn light-green darken-2"/>
      </td>      
    </tr>
<?php }?>

  </tbody>
</table>
</div>


<?php include 'templates/footer.php'?>

