
<?php include '../templates/header.php'; ?>

<?php include '../models/conexion.php';



$sentencia = $bd->query("SELECT * FROM users");
$sentenciaDos = $bd->query("SELECT * FROM states");
$sentenciaTres = $bd->query("SELECT * FROM rol");

$users = $sentencia->fetchAll(PDO::FETCH_OBJ);
$estado = $sentenciaDos->fetchAll(PDO::FETCH_OBJ);
$rol = $sentenciaTres->fetchAll(PDO::FETCH_OBJ);

?>
<head>
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<div class="container">
    <div class="card">
        <div class="card-header">Ingrese los datos del usuario</div>

        <form class="ml-8" action="registro.php" method="POST">
        <div class="mb-2 ml-2 mr-6">
            <label for="">Nombre</label>
            <input class="form-control" type="text" placeholder="Ingrese nombre" name="inputName" aria-label="default input example" required>
        </div>
        
        <div class="mb-2 ml-2 mr-2">
            <label for="">Apellido</label>
            <input class="form-control" type="text" placeholder="Ingrese el apellido" name="inputLastName"  aria-label="default input example" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">email</label>
            <input class="form-control" type="email" placeholder="Ingrese el email"  name="inputEmail" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Password</label>
            <input class="form-control" type="password" placeholder="Ingrese la contraseña"  name="inputPassword" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Rol</label>
            <select class="form-control"  name="inputRol"  aria-label="default input example" required>
            <?php
                    //Iterando los departamentos de la bd
                    foreach($rol as $value){
                ?>
                    <option value="<?php echo $value->id?>"><?php echo $value->name?></option>
                <?php } ?>
            </select>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Estado</label>
            <select class="form-control"  name="inputState"  aria-label="default input example" required>
            <?php
                    //Iterando los departamentos de la bd
                    foreach($estado as $value){
                ?>
                    <option value="<?php echo $value->id?>"><?php echo $value->name?></option>
                <?php } ?>
            </select>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Tipo de clase</label>
            <select class="form-control"  name="inputTypeClass"  aria-label="default input example" required>
                <option>Presencial</option>
                <option>Online</option>
            </select>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Cantidad de horas</label>
            <input class="form-control" type="number" placeholder="Ingrese las horas asignadas"  name="inputCantidad" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Monto a cancelar</label>
            <input class="form-control" type="number" placeholder="Ingrese el monto a cancelar"  name="inputMonto" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Fecha de pago</label>
            <input class="form-control" type="date" placeholder="Ingrese la contraseña"  name="inputDate" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Comentario</label>
            <input class="form-control" type="text" placeholder="Ingrese su comentario"  name="inputComentario" value="" required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Tipo de clase</label>
            <select class="form-control"  name="inputPago"  aria-label="default input example" required>
                <option>Sin Pagar</option>
                <option>Pagado</option>
            </select>
        </div>
        <input type="submit" class="btn light-blue darken-2 mb-2 ml-2" value="Registrar"> </input>
        
        </form>
    </div>
</div>




