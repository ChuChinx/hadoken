<?php
    require '../../modelo/modelo_detallecombo.php';
    $MD = new Modelo_DetalleCombo();
    $consulta = $MD->listar_combo_producto();
    echo json_encode($consulta);
    
    
?>