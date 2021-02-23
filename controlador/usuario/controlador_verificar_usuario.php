<?php
    require '../../modelo/modelo_usuario.php';
    $MU = new Modelo_Usuario();

    $us = htmlspecialchars($_POST['u'], ENT_QUOTES, 'UTF-8');
    $pas = htmlspecialchars($_POST['p'], ENT_QUOTES, 'UTF-8');
    $consulta = $MU->Verificar_Usuario($us, $pas);
    $data = json_encode($consulta);
    if(count($consulta)>0){
        echo $data;
    }else{
        echo 0;
    }
?>