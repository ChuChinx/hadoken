<?php
    require '../../modelo/modelo_ingreso.php';
    $MI = new Modelo_Ingreso();
    $consulta = $MI->listar_combo_insumo();
    echo json_encode($consulta);
    
    
?>