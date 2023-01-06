<?php 

print_r($_POST);

include '../models/conexion.php';

$codigoUser = $_POST['id'];
$name = $_POST['inputName'];
$lastName = $_POST['inputLastName'];
$email = $_POST['inputEmail'];
$password = $_POST['inputPassword'];
$idRol = $_POST['inputRol'];
$idState = $_POST['inputState'];
$typeClass = $_POST['inputTypeClass'];
$cantidad = $_POST['inputCantidad'];
$monto = $_POST['inputMonto'];
$fechaPago = $_POST['inputDate'];
$comentario = $_POST['inputComentario'];
$estadoPago = $_POST['inputPago'];



$consulta = $bd->prepare("UPDATE users SET name=?, lastName=?, email=?, password=?, idRol=?, idState=?, typeClass=?, cantidad=?, monto=?, fechaPago=?, comentario=?, estadoPago=? WHERE id=?");

$respuesta = $consulta->execute([$name, $lastName, $email, $password, $idRol, $idState, $typeClass, $cantidad, $monto, $fechaPago, $comentario, $estadoPago, $codigoUser]);

if ($respuesta) {
    header("location: ../index.php");
}else{

    echo "error en la actualizacion";
}


?>