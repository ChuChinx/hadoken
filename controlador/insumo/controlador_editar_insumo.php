<?php  
    require '../../modelo/modelo_insumo.php';
    $MI = new Modelo_Insumo();
    $error="";
    $contador=0;

    $id = htmlspecialchars(strtoupper($_POST['id']), ENT_QUOTES, 'UTF-8');
    $insumo = htmlspecialchars(strtoupper($_POST['insumo']), ENT_QUOTES, 'UTF-8');
    $categoria = htmlspecialchars(strtoupper($_POST['categoria']), ENT_QUOTES, 'UTF-8');
    $unidad = htmlspecialchars(strtoupper($_POST['unidad']), ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars(strtoupper($_POST['status']), ENT_QUOTES, 'UTF-8');
    

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $insumo)){
        $contador++;
        $error.="El insumo debe contener sólo letras.<br>";
    }

    if(!preg_match("/^[[:digit:]\s]*$/", $categoria)){
        $contador++;
        $error.="El id de la categoria debe contener sólo números.<br>";
    }

    if(!preg_match("/^[[:digit:]\s]*$/", $unidad)){
        $contador++;
        $error.="El id de la unidad de medida debe contener sólo números.<br>";
    }

    /*if(!preg_match("/^[0-9]*(\.?)[0-9]+$/", $precio)){//para los numeros decimales
        $contador++;
        $error.="El id de la unidad de medida debe contener sólo números.<br>";
    }*/

    if($contador>0){
        echo $error;
    }else{
        $consulta = $MI->Editar_Insumo($id, $insumo, $categoria, $unidad, $status);
        echo $consulta;
    }

    
    
    
?>