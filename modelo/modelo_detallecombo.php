<?php
    class Modelo_DetalleCombo{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Combo(){
            $sql = "call SP_LISTAR_COMBO_ADD()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_producto(){
            $sql = "call SP_LISTAR_COMBO_PRODUCTO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_DetalleCombo($idcombo){
            $sql = "call SP_REGISTRAR_DETALLE_COMBO('$idcombo')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				if ($row = mysqli_fetch_array($consulta)) {
                        return $id= trim($row[0]);//retorna valores, retorna el id del detalleprod cada vez q registro con alert(resp) del js
				}
				$this->conexion->cerrar();
			}
			$this->conexion->cerrar();
		}

        function Registrar_Detalle_Producto($id,$arreglo_producto,$arreglo_cantidad){
            $sql = "call SP_REGISTRAR_DETALLE_PRODUCTO_ADD('$id','$arreglo_producto','$arreglo_cantidad')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				return 1;
			}else{
				return 0;
			}
			$this->conexion->cerrar();
		}

    }
?>