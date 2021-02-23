<?php
    //copiado de registro
    require '../../modelo/modelo_insumo.php';
    $MI = new Modelo_Insumo();
    
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');

    if(is_array($_FILES) && count($_FILES)>0){//para ver si el input tiene datos, imagen
        if(move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombrearchivo)){//subida del archivo
            $ruta = 'controlador/insumo/img/'.$nombrearchivo;
            $consulta = $MI->Editar_Foto_Insumo($id, $ruta);
            echo $consulta;
        }else{
            echo 0;
        }
    }else{
        
        echo 0;
    }
    
?>