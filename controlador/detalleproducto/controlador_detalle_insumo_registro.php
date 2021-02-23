<?php
    require '../../modelo/modelo_detalleproducto.php';
    $MD = new Modelo_DetalleProducto();//Instanciamos

    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $idinsumo = htmlspecialchars($_POST['idinsumo'],ENT_QUOTES,'UTF-8');
    $cantidad = htmlspecialchars($_POST['cantidad'],ENT_QUOTES,'UTF-8');

    $arreglo_insumo = explode(",",$idinsumo);//Separo mis datos del arreglo capt. para luego hacer el insert
    $arreglo_cantidad = explode(",",$cantidad);//Separo mis datos 

    for($i=0;$i<count($arreglo_insumo);$i++){
        $consulta = $MD->Registrar_Detalle_Insumo($id,$arreglo_insumo[$i],$arreglo_cantidad[$i]);
    }
  
    echo $consulta;

?>