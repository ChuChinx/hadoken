<?php  
    require '../../modelo/modelo_combo.php';
    $MC = new Modelo_Combo();
    $consulta = $MC->Listar_Combo();
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