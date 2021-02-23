<?php  
    require '../../modelo/modelo_cliente.php';
    $MC = new Modelo_Cliente();
    $error="";
    $contador=0;

    $nombre = htmlspecialchars(strtoupper($_POST['nombre']), ENT_QUOTES, 'UTF-8');
    $paterno = htmlspecialchars(strtoupper($_POST['paterno']), ENT_QUOTES, 'UTF-8');
    $materno = htmlspecialchars(strtoupper($_POST['materno']), ENT_QUOTES, 'UTF-8');
    $ndocumento = htmlspecialchars(strtoupper($_POST['ndocumento']), ENT_QUOTES, 'UTF-8');
    $tdocumento = htmlspecialchars(strtoupper($_POST['tdocumento']), ENT_QUOTES, 'UTF-8');
    $sexo = htmlspecialchars(strtoupper($_POST['sexo']), ENT_QUOTES, 'UTF-8');
    $telefono = htmlspecialchars(strtoupper($_POST['telefono']), ENT_QUOTES, 'UTF-8');

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $nombre)){
        $contador++;
        $error.="El nombre debe contener sólo letras.<br>";
    }

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $paterno)){
        $contador++;
        $error.="El apellido paterno debe contener sólo letras.<br>";
    }

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $materno)){
        $contador++;
        $error.="El apellido materno debe contener sólo letras.<br>";
    }

    if(!preg_match("/^[[:digit:]\s]*$/", $ndocumento)){
        $contador++;
        $error.="El número de documento debe contener sólo números.<br>";
    }

    if(!preg_match("/^[[:digit:]\s]*$/", $telefono)){
        $contador++;
        $error.="El número de teléfono debe contener sólo números.<br>";
    }

    if($contador>0){
        echo $error;
    }else{
        $consulta = $MC->Registrar_Cliente($nombre, $paterno, $materno, $ndocumento, $tdocumento, $sexo, $telefono);
        //echo 1;
        echo $consulta;
    }

    
    
    
?>