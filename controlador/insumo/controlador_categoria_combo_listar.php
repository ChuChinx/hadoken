<?php
    require '../../modelo/modelo_insumo.php';
    $MI = new Modelo_Insumo();
    $consulta = $MI->listar_combo_categoria();
    echo json_encode($consulta);
    
    
?>