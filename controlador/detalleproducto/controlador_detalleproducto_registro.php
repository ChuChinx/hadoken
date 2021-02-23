<?php
    require '../../modelo/modelo_detalleproducto.php';
    $MD = new Modelo_DetalleProducto();
    $idproducto = htmlspecialchars($_POST['idproducto'],ENT_QUOTES,'UTF-8');
   
    $consulta = $MD->Registrar_DetalleProducto($idproducto);
    echo $consulta;

?>