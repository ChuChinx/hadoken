<?php  
    require '../../modelo/modelo_persona.php';
    $MP = new Modelo_Persona();
    $error="";
    $contador=0;
    
    $id = htmlspecialchars(strtoupper($_POST['id']), ENT_QUOTES, 'UTF-8');
    $nombre = htmlspecialchars(strtoupper($_POST['nombre']), ENT_QUOTES, 'UTF-8');
    $paterno = htmlspecialchars(strtoupper($_POST['paterno']), ENT_QUOTES, 'UTF-8');
    $materno = htmlspecialchars(strtoupper($_POST['materno']), ENT_QUOTES, 'UTF-8');
    $ndocumentoactual = htmlspecialchars(strtoupper($_POST['ndocumentoactual']), ENT_QUOTES, 'UTF-8');
    $ndocumentonuevo = htmlspecialchars(strtoupper($_POST['ndocumentonuevo']), ENT_QUOTES, 'UTF-8');
    $tdocumento = htmlspecialchars(strtoupper($_POST['tdocumento']), ENT_QUOTES, 'UTF-8');
    $sexo = htmlspecialchars(strtoupper($_POST['sexo']), ENT_QUOTES, 'UTF-8');
    $telefono = htmlspecialchars(strtoupper($_POST['telefono']), ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars(strtoupper($_POST['status']), ENT_QUOTES, 'UTF-8');

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

    if(!preg_match("/^[[:digit:]\s]*$/", $ndocumentonuevo)){
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
        $consulta = $MP->Editar_Persona($id, $nombre, $paterno, $materno, $ndocumentoactual, $ndocumentonuevo, $tdocumento, $sexo, $telefono, $status);
        echo $consulta;
        //echo "1";
    }

    
    
    
?>