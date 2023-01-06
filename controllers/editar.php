<?php include '../templates/header.php'; ?>

<?php include '../models/conexion.php';

$codigoUser = $_GET['id'];

$consulta = $bd->prepare("SELECT * FROM users WHERE id= ?");
$sentenciaDos = $bd->query("SELECT * FROM states");
$sentenciaTres = $bd->query("SELECT * FROM rol");

$consulta->execute([$codigoUser]);

$users = $consulta->fetch(PDO::FETCH_OBJ);
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
    <div class="row justify-content-center ">
    <div class="card mb-4 ">
        <div class="card-header">Editar los datos del usuario</div>
        <form action="update.php" method="POST">
        <div class="mb-2 ml-2 mr-2">
            <label for="">Nombre</label>
            <input class="form-control" type="text" placeholder="Edite el nombre" name="inputName"  value="<?php echo $users->name?>" required>
        </div>
        
        <div class="mb-2 ml-2 mr-2">
            <label for="">Apellido</label>
            <input class="form-control" type="text" placeholder="Edite el apellido" name="inputLastName" 
            value="<?php echo $users->lastName?>"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">email</label>
            <input class="form-control" type="email" placeholder="Ingrese el correo" value="<?php echo $users->email?>" name="inputEmail"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Password</label>
            <input class="form-control" type="password" placeholder="Ingrese la contraseña" value="<?php echo $users->password?>" name="inputPassword"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Seleccione el rol</label>
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
            <label for="">Seleccione el estado</label>
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
            <input class="form-control" type="number" placeholder="Ingrese la contraseña" value="<?php echo $users->cantidad?>" name="inputCantidad"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Monto a cancelar</label>
            <input class="form-control" type="number" placeholder="Ingrese la contraseña" value="<?php echo $users->monto?>" name="inputMonto"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Fecha a cancelar</label>
            <input class="form-control" type="date"  value="<?php echo $users->fechaPago?>" name="inputDate"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Comentario</label>
            <input class="form-control" type="text" placeholder="Ingrese un comentario" value="<?php echo $users->comentario?>" name="inputComentario"  required>
        </div>
        <div class="mb-2 ml-2 mr-2">
            <label for="">Tipo de clase</label>
            <select class="form-control"  name="inputPago"  aria-label="default input example" value="<?php echo $users->estadoPago?>"required>
                <option>Sin Pagar</option>
                <option>Pagado</option>
            </select>
        </div>
        <br>
        <input type="hidden" name="id" value="<?php echo $users->id?>">
        <input type="submit" class="btn light-blue darken-2 mb-2 ml-2" value="Guardar"> </input>
        </form>
    </div>
    
    </div>
</div>







