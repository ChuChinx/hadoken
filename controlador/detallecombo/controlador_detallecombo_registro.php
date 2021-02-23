<?php
    require '../../modelo/modelo_detallecombo.php';
    $MD = new Modelo_DetalleCombo();
    $idcombo = htmlspecialchars($_POST['idcombo'],ENT_QUOTES,'UTF-8');
   
    $consulta = $MD->Registrar_DetalleCombo($idcombo);
    echo $consulta;

?>