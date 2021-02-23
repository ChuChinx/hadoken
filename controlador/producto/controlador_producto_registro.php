<?php  
    require '../../modelo/modelo_producto.php';
    $MP = new Modelo_Producto();
    $error="";
    $contador=0;

    $producto = htmlspecialchars(strtoupper($_POST['producto']), ENT_QUOTES, 'UTF-8');
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');
    

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $producto)){
        $contador++;
        $error.="El producto debe contener sólo letras.<br>";
    }

    if($contador>0){
        echo $error;
    }else{
        if(is_array($_FILES) && count($_FILES)>0){//para ver si el input tiene datos, imagen
            if(move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombrearchivo)){//subida del archivo
                $ruta = 'controlador/producto/img/'.$nombrearchivo;
                $consulta = $MP->Registrar_Producto($producto, $ruta);
                echo $consulta;
            }else{
                echo 0;
            }
        }else{
            $ruta = 'controlador/producto/img/producto_defecto.png';
            $consulta = $MP->Registrar_Producto($producto, $ruta);
            echo $consulta;
        }
    }

    
    
    
?>