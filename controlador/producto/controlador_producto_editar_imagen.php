<?php
    //copiado de registro
    require '../../modelo/modelo_producto.php';
    $MP = new Modelo_Producto();
    
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');

    if(is_array($_FILES) && count($_FILES)>0){//para ver si el input tiene datos, imagen
        if(move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombrearchivo)){//subida del archivo
            $ruta = 'controlador/producto/img/'.$nombrearchivo;
            $consulta = $MP->Editar_Foto_Producto($id, $ruta);
            echo $consulta;
        }else{
            echo 0;
        }
    }else{
        
        echo 0;
    }
    
?>