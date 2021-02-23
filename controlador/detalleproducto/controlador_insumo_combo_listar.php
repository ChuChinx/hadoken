<?php
    require '../../modelo/modelo_detalleproducto.php';
    $MD = new Modelo_DetalleProducto();
    $consulta = $MD->listar_combo_insumo();
    echo json_encode($consulta);
    
    
?>