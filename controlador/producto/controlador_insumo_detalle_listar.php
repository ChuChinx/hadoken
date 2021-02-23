<?php  
    require '../../modelo/modelo_producto.php';
    $MP = new Modelo_Producto();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');

    $consulta = $MP->Listar_InsumoDetalle($id);
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData": []
        }';
    }
    
?>