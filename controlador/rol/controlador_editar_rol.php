<?php  
    require '../../modelo/modelo_rol.php';
    $MR = new Modelo_Rol();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $rolactual = htmlspecialchars($_POST['rolactual'], ENT_QUOTES, 'UTF-8');
    $rolnuevo = htmlspecialchars($_POST['rolnuevo'], ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars($_POST['status'], ENT_QUOTES, 'UTF-8');
    $consulta = $MR->Modificar_Rol($id, $rolactual, $rolnuevo, $status);
    echo $consulta;
?>