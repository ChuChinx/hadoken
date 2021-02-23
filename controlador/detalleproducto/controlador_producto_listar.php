<?php  
    require '../../modelo/modelo_detalleproducto.php';
    $MD = new Modelo_DetalleProducto();
    $consulta = $MD->Listar_Producto();
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