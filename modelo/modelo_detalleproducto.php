<?php
    class Modelo_DetalleProducto{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Producto(){
            $sql = "call SP_LISTAR_PRODUCTO_ADD()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_insumo(){
            $sql = "call SP_LISTAR_COMBO_INSUMO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function TraerStockInsumo($id){
            $sql = "call SP_TRAER_STOCK_INSUMO($id)";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function TraerUnidadMedidaInsumo($id){
            $sql = "call SP_TRAER_UNIDADMEDIDA_INSUMO($id)";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }
        
        function Registrar_DetalleProducto($idproducto){
            $sql = "call SP_REGISTRAR_DETALLE_PRODUCTO('$idproducto')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				if ($row = mysqli_fetch_array($consulta)) {
                        return $id= trim($row[0]);//retorna valores, retorna el id del detalleprod cada vez q registro con alert(resp) del js
				}
				$this->conexion->cerrar();
			}
			$this->conexion->cerrar();
		}

        function Registrar_Detalle_Insumo($id,$arreglo_insumo,$arreglo_cantidad){
            $sql = "call SP_REGISTRAR_DETALLE_INSUMO('$id','$arreglo_insumo','$arreglo_cantidad')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				return 1;
			}else{
				return 0;
			}
			$this->conexion->cerrar();
		}

    }
?>