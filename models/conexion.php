<?php

$nombre_bd= "dataschool";
$user = "root";
$password = "";
try{
    $bd= new PDO(
        'mysql:host=localhost; 
        dbname='.$nombre_bd,
        $user,
        $password
    );
}catch (Exception $e){
    //manejo del error
    echo "no funciono la conexion porque: ". $e->getMessage();
}

?>