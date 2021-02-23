<?php
    class Modelo_Combo{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Combo(){
            $sql = "call SP_LISTAR_COMBO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Combo($combo, $precioventa, $ruta){
            $sql = "call SP_REGISTRAR_COMBO('$combo', '$precioventa', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Combo($id, $combo, $precioventa, $status){
            $sql = "call SP_EDITAR_COMBO('$id', '$combo', '$precioventa', '$status')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Foto_Combo($id, $ruta){
            $sql = "call SP_EDITAR_COMBO_FOTO('$id', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Listar_ProductoDetalle($id){
            $sql = "call SP_LISTAR_PRODUCTO_DETALLE('$id')";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }
        
    }
?>