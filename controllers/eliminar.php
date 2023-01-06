<?php

include '../models/conexion.php';

$codigoUser = $_GET['id'];

$consulta = $bd->prepare("DELETE FROM users WHERE id= ?");
$resultado = $consulta->execute([$codigoUser]);

if($resultado){
    header("Location: ../index.php");
}else{
    echo "Fallo su eliminacion";
}

?>