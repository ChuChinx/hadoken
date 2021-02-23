<?php
    class Modelo_Producto{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Producto(){
            $sql = "call SP_LISTAR_PRODUCTO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Listar_InsumoDetalle($id){
            $sql = "call SP_LISTAR_INSUMO_DETALLE('$id')";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Producto($producto, $ruta){
            $sql = "call SP_REGISTRAR_PRODUCTO('$producto', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Producto($id, $producto, $status){
            $sql = "call SP_EDITAR_PRODUCTO('$id', '$producto', '$status')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Foto_Producto($id, $ruta){
            $sql = "call SP_EDITAR_PRODUCTO_FOTO('$id', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }
        
    }
?>