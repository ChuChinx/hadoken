<?php  
    require '../../modelo/modelo_combo.php';
    $MC = new Modelo_Combo();
    $error="";
    $contador=0;

    $id = htmlspecialchars(strtoupper($_POST['id']), ENT_QUOTES, 'UTF-8');
    $combo = htmlspecialchars(strtoupper($_POST['combo']), ENT_QUOTES, 'UTF-8');
    $precioventa = htmlspecialchars(strtoupper($_POST['precioventa']), ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars(strtoupper($_POST['status']), ENT_QUOTES, 'UTF-8');
    
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
        $consulta = $MC->Editar_Combo($id, $combo, $precioventa, $status);
        echo $consulta;
    }

    
    
    
?>