<?php
    require '../../modelo/modelo_detalleproducto.php';
    $MD = new Modelo_DetalleProducto();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $consulta = $MD->TraerUnidadMedidaInsumo($id);
    echo json_encode($consulta);
    
    
?>