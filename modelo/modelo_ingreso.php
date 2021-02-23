<?php
    class Modelo_Ingreso{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Ingreso($finicio, $ffin){
            $sql = "call SP_LISTAR_INGRESO('$finicio','$ffin')";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Categoria($categoria){
            $sql = "call SP_REGISTRAR_CATEGORIA('$categoria')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Modificar_Categoria($id, $categoriaactual, $categorianuevo, $status){
            $sql = "call SP_EDITAR_CATEGORIA('$id', '$categoriaactual', '$categorianuevo', '$status')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function listar_combo_proveedor(){
            $sql = "call SP_LISTAR_COMBO_PROVEEDOR()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){//array buscar posiciones
                    $arreglo[] = $consulta_vu;      //assoc, inserta nombre del campo, tons 1 solo []
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }
        
        function listar_combo_insumo(){
            $sql = "call SP_LISTAR_COMBO_INSUMO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){//array buscar posiciones
                    $arreglo[] = $consulta_vu;      //assoc, inserta nombre del campo, tons 1 solo []
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Ingreso($idproveedor, $idusuario, $tipo, $serie, $ncomprobante, $total, $impuesto, $porcentaje){
            $sql = "call SP_REGISTRAR_INGRESO('$idproveedor', '$idusuario', '$tipo', '$serie', '$ncomprobante', '$total', '$impuesto', '$porcentaje')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }
    }
?>