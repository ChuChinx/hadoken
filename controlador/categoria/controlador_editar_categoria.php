<?php  
    require '../../modelo/modelo_categoria.php';
    $MC = new Modelo_Categoria();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');//$_POST['id'], id de lo q llevamos al console ajax 1ero izq
    $categoriaactual = htmlspecialchars($_POST['categoriaactual'], ENT_QUOTES, 'UTF-8');
    $categorianuevo = htmlspecialchars($_POST['categorianuevo'], ENT_QUOTES, 'UTF-8');
    $status = htmlspecialchars($_POST['status'], ENT_QUOTES, 'UTF-8');
    $consulta = $MC->Modificar_Categoria($id, $categoriaactual, $categorianuevo, $status);
    echo $consulta;
    //luego la funcion Modificar_Categoria al modelo
?>