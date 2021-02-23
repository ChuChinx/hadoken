<?php
    require '../../modelo/modelo_detallecombo.php';
    $MD = new Modelo_DetalleCombo();

    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $idproducto = htmlspecialchars($_POST['idproducto'],ENT_QUOTES,'UTF-8');
    $cantidad = htmlspecialchars($_POST['cantidad'],ENT_QUOTES,'UTF-8');

    $arreglo_producto = explode(",",$idproducto);//Separo mis datos del arreglo capt. para luego hacer el insert
    $arreglo_cantidad = explode(",",$cantidad);//Separo mis datos 

    for($i=0;$i<count($arreglo_producto);$i++){
        $consulta = $MD->Registrar_Detalle_Producto($id,$arreglo_producto[$i],$arreglo_cantidad[$i]);
    }
  
    echo $consulta;

?>