<?php  
    require '../../modelo/modelo_combo.php';
    $MC = new Modelo_Combo();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');

    $consulta = $MC->Listar_ProductoDetalle($id);
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