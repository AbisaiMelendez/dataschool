<?php
include '../models/conexion.php';
$consulta = $bd->prepare("SELECT * FROM users WHERE id= ?");
$sentencia = $bd->query("SELECT * FROM users  WHERE idState=1");
$sentenciaDos = $bd->query("SELECT * FROM states");

$users = $sentencia->fetchAll(PDO::FETCH_OBJ);
$estado = $sentenciaDos->fetchAll(PDO::FETCH_OBJ);
//print_r($menus);
?>
<head>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
 <nav>
    <div class="nav-wrapper light-blue darken-2">
      
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../index.php">login</a></li>
        <li><a href="../index.php">inicio</a></li>
      </ul>
    </div>
  </nav>
<?php
    include 'header.php';
?>
<div class="container ml-7" class="row ml-4" style="
text-align:center" >
    
<div class="row  col s8 ml-7" style="margin-left:4.9%; width: 90%;
text-align:center" >
        <h1 style="text-align: center; padding-bottom:4rem">Usuarios <b> registrados.</b></h1>
        <?php  foreach ($users as $dato){?> 
        <div class="col-lg-4">
            <div class="card  lighten-4" >
            <div class="card-content " >
                <span class="card-title"><h3><?php echo $dato->name?></h3></span>
                <p><?php echo $dato->lastName?></p>
                
                <p><?php echo $dato->email?></p>
                <br>
                <h5><b><?php echo "Tipo de clases: ". $dato->typeClass?></b></h5>
                <h5><b><?php echo "". $dato->cantidad . " horas trabajadas"?></b></h5>
                <h5><b><?php echo " ". $dato->comentario?></b></h5>
                <h3>monto USD $<b><?php echo $dato->monto?></b></h3>
                <span>fecha de pago <b><?php echo $dato->fechaPago?></b></span>
                
            </div>
            <div class="card-action">
              
            <?php 
                if ($dato->estadoPago == "Pagado"){
                  ?>
                  <a href="../index.php"  style="color: white " class="btn light-blue darken-2">Pagado</a>
                  <?php       
                } else {
                  ?>
                  <a href="../index.php" style="color: white "class="btn red lighten-1">Sin pagar</a>
                  <?php 
                }
            ?>
            </div>
        </div>
    </div>   
    <?php } ?>
    
    
</div>       
<br><br><br>
<?php
    include 'footer.php';
?>