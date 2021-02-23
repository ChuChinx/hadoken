<?php
    class Modelo_Insumo{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Insumo(){
            $sql = "call SP_LISTAR_INSUMO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_categoria(){
            $sql = "call SP_LISTAR_COMBO_CATEGORIA()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){//array buscar posiciones
                    $arreglo[] = $consulta_vu;      //assoc, inserta nombre del campo, tons 1 solo []
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_unidad(){
            $sql = "call SP_LISTAR_COMBO_UNIDAD()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){//array buscar posiciones
                    $arreglo[] = $consulta_vu;      //assoc, inserta nombre del campo, tons 1 solo []
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Insumo($insumo, $categoria, $unidad, $ruta){
            $sql = "call SP_REGISTRAR_INSUMO('$insumo', '$categoria', '$unidad', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Insumo($id, $insumo, $categoria, $unidad, $status){
            $sql = "call SP_EDITAR_INSUMO('$id', '$insumo', '$categoria', '$unidad', '$status')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Foto_Insumo($id, $ruta){
            $sql = "call SP_EDITAR_INSUMO_FOTO('$id', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }
        
    }
?>