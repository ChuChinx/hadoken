<?php
    require '../../modelo/modelo_usuario.php';
    $MU = new Modelo_Usuario();
    //atributos de acuerdo con el TraerDatosUsuario() del console_usuario, 1er at. del ajax
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $consulta = $MU->TraerDatosUsuario($id);
    echo json_encode($consulta);//json_encode por el mysqli_fetch_array en el modelo
    
    
    //el TraerDatosUsuario($id) tiene q estar en el modelo
?>