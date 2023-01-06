<?php
print_r($_POST);


if(empty($_POST['inputName']) || empty($_POST['inputLastName']) || empty($_POST['inputEmail']) || empty($_POST['inputPassword']) || empty($_POST['inputRol'])|| empty($_POST['inputState']) || empty($_POST['inputTypeClass']) || empty($_POST['inputMonto']) || empty($_POST['inputDate']) || empty($_POST['inputMonto']) || empty($_POST['inputComentario'])|| empty($_POST['inputPago'])){
    echo "Error, complete todo el formulario";
    exit();
}

include '../models/conexion.php';

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


$consulta =$bd->prepare("INSERT INTO users(name, lastName, email, password, idRol, idState, typeClass, cantidad, monto, fechaPago, comentario, estadoPago) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");

$resultado = $consulta->execute([$name, $lastName, $email, $password, $idRol, $idState, $typeClass, $cantidad, $monto, $fechaPago, $comentario, $estadoPago]);

if($resultado){
    header("location:../index.php");
}else{
    echo "fallo la consulta";
}


?>