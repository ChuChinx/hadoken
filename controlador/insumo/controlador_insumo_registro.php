<?php  
    require '../../modelo/modelo_insumo.php';
    $MI = new Modelo_Insumo();
    $error="";
    $contador=0;

    $insumo = htmlspecialchars(strtoupper($_POST['insumo']), ENT_QUOTES, 'UTF-8');
    $categoria = htmlspecialchars(strtoupper($_POST['categoria']), ENT_QUOTES, 'UTF-8');
    $unidad = htmlspecialchars(strtoupper($_POST['unidad']), ENT_QUOTES, 'UTF-8');
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');
    

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

    if($contador>0){
        echo $error;
    }else{
        if(is_array($_FILES) && count($_FILES)>0){//para ver si el input tiene datos, imagen
            if(move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombrearchivo)){//subida del archivo
                $ruta = 'controlador/insumo/img/'.$nombrearchivo;
                $consulta = $MI->Registrar_Insumo($insumo, $categoria, $unidad, $ruta);
                echo $consulta;
            }else{
                echo 0;
            }
        }else{
            $ruta = 'controlador/insumo/img/insumo_defecto.png';
            $consulta = $MI->Registrar_Insumo($insumo, $categoria, $unidad, $ruta);
            echo $consulta;
        }
    }

    
    
    
?>