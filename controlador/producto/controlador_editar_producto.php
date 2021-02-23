<?php  
    require '../../modelo/modelo_producto.php';
    $MP = new Modelo_Producto();
    $error="";
    $contador=0;

    $id = htmlspecialchars(strtoupper($_POST['id']), ENT_QUOTES, 'UTF-8');
    $producto = htmlspecialchars(strtoupper($_POST['producto']), ENT_QUOTES, 'UTF-8');
    
    $status = htmlspecialchars(strtoupper($_POST['status']), ENT_QUOTES, 'UTF-8');
    

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/", $producto)){
        $contador++;
        $error.="El producto debe contener sólo letras.<br>";
    }

    

    /*if(!preg_match("/^[0-9]*(\.?)[0-9]+$/", $precio)){//para los numeros decimales
        $contador++;
        $error.="El id de la unidad de medida debe contener sólo números.<br>";
    }*/

    if($contador>0){
        echo $error;
    }else{
        $consulta = $MP->Editar_Producto($id, $producto, $status);
        echo $consulta;
    }

    
    
    
?>