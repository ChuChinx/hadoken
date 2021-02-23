<?php
    require '../../modelo/modelo_usuario.php';
    $MU = new Modelo_Usuario();
    //atributos de acuerdo con el Editar_Usuario() del console_usuario, 1er at. del ajax
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $idpersona = htmlspecialchars($_POST['idpersona'], ENT_QUOTES, 'UTF-8');
    $emailnuevo = htmlspecialchars($_POST['emailnuevo'], ENT_QUOTES, 'UTF-8');
    $idrol = htmlspecialchars($_POST['idrol'], ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars($_POST['status'], ENT_QUOTES, 'UTF-8');

    $consulta = $MU->Editar_Usuario($id, $idpersona, $emailnuevo, $idrol, $status);
    echo $consulta;
    
    //el Editar_Usuario($id, $usuarionuevo, $idpersona, $emailnuevo, $idrol, $status) tiene q estar en el modelo
?>