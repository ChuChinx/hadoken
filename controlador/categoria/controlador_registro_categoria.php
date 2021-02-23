<?php  
    require '../../modelo/modelo_categoria.php';
    $MC = new Modelo_Categoria();
    $categoria = htmlspecialchars($_POST['categoria'], ENT_QUOTES, 'UTF-8');//$_POST['categoria'] lo q llevamos al console ajax 1ero izq
    $consulta = $MC->Registrar_Categoria($categoria);//de ahi al modelo
    echo $consulta;
    
    
?>