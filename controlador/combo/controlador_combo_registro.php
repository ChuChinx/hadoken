<?php  
    require '../../modelo/modelo_combo.php';
    $MC = new Modelo_Combo();
    $error="";
    $contador=0;

    $combo = htmlspecialchars(strtoupper($_POST['combo']), ENT_QUOTES, 'UTF-8');
    $precioventa = htmlspecialchars(strtoupper($_POST['precioventa']), ENT_QUOTES, 'UTF-8');
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');
    

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $combo)){
        $contador++;
        $error.="El combo debe contener sólo letras.<br>";
    }
    
    if(!preg_match("/^[0-9]*(\.?)[0-9]+$/", $precioventa)){//para los numeros decimales
        $contador++;
        $error.="El precio de venta debe contener sólo números.<br>";
    }

    if($contador>0){
        echo $error;
    }else{
        if(is_array($_FILES) && count($_FILES)>0){//para ver si el input tiene datos, imagen
            if(move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombrearchivo)){//subida del archivo
                $ruta = 'controlador/combo/img/'.$nombrearchivo;
                $consulta = $MC->Registrar_Combo($combo, $precioventa, $ruta);
                echo $consulta;
            }else{
                echo 0;
            }
        }else{
            $ruta = 'controlador/combo/img/combo_defecto.png';
            $consulta = $MC->Registrar_Combo($combo, $precioventa, $ruta);
            echo $consulta;
        }
    }

    
    
    
?>