<?php  
    require '../../modelo/modelo_detallecombo.php';
    $MD = new Modelo_DetalleCombo();
    $consulta = $MD->Listar_Combo();
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