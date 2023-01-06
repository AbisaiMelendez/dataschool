<?php

include '../models/conexion.php';
  $codigoUser = $_GET['id'];
  echo $codigoUser;
  
  $consulta = $bd->prepare("SELECT * FROM users WHERE id=? limit 1");
  echo "<hr>";
  $consulta->execute([$codigoUser]);
  $respuesta = $consulta->fetch();

  echo "<pre>"; 
  print_r($respuesta);
  echo "</pre>";
  echo $respuesta['idState'];
  $value =$respuesta['idState'];
  if ($value == 1){
    $value = 2;
    
  }elseif($value == 2){
    $value = 1;
  }
  //echo $value;
  //exit();
$updateQuery = $bd->prepare(" UPDATE users SET idState = ? WHERE id = ? ");
$updateQuery->execute([$value,$codigoUser]);
  
if ($updateQuery) {
  header("location: ../index.php");
}else{

  echo "error en la actualizacion";
}

?>





