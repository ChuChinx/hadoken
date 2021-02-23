<?php  
    require '../../modelo/modelo_unidadmedida.php';
    $MU = new Modelo_UnidadMedida();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');//$_POST['unidad'] lo q llevamos al console ajax 1ero izq
    $unidadactual = htmlspecialchars($_POST['unidadactual'], ENT_QUOTES, 'UTF-8');
    $unidadnueva = htmlspecialchars($_POST['unidadnueva'], ENT_QUOTES, 'UTF-8');
    $abreviatura = htmlspecialchars($_POST['abreviatura'], ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars($_POST['status'], ENT_QUOTES, 'UTF-8');
    $consulta = $MU->Modificar_UnidadMedida($id, $unidadactual, $unidadnueva, $abreviatura, $status);//de ahi al modelo
    echo $consulta;
    
    
?>