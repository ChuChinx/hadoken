<?php  
    require '../../modelo/modelo_unidadmedida.php';
    $MU = new Modelo_UnidadMedida();
    $unidad = htmlspecialchars($_POST['unidad'], ENT_QUOTES, 'UTF-8');//$_POST['unidad'] lo q llevamos al console ajax 1ero izq
    $abreviatura = htmlspecialchars($_POST['abreviatura'], ENT_QUOTES, 'UTF-8');
    $consulta = $MU->Registrar_UnidadMedida($unidad, $abreviatura);//de ahi al modelo
    echo $consulta;
    
    
?>