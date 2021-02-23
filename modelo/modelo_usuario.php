<?php
    class Modelo_Usuario{
        private $conexion;

        function __construct(){
            require_once 'modelo_conexion.php';
            $this->conexion = new conexion();
            $this->conexion->conectar();
        }

        function Listar_Usuario(){
            $sql = "call SP_LISTAR_USUARIO()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_assoc($consulta)){
                    $arreglo["data"][] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Verificar_Usuario($usuario, $password){
            $sql = "call SP_VERIFICAR_USUARIO('$usuario')";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    if(password_verify($password, $consulta_vu['usuario_password'])){
                        $arreglo[] = $consulta_vu;
                    }
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_persona(){
            $sql = "call SP_LISTAR_COMBO_PERSONA()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function listar_combo_rol(){
            $sql = "call SP_LISTAR_COMBO_ROL()";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Registrar_Usuario($usuario, $pass, $idpersona, $email, $idrol, $ruta){
            $sql = "call SP_REGISTRAR_USUARIO('$usuario', '$pass', '$idpersona', '$email', '$idrol', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Usuario($id, $idpersona, $emailnuevo, $idrol, $status){
            $sql = "call SP_EDITAR_USUARIO('$id', '$idpersona', '$emailnuevo', '$idrol', '$status')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function Editar_Foto($id, $ruta){
            $sql = "call SP_EDITAR_USUARIO_FOTO('$id', '$ruta')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }

        function TraerDatosUsuario($id){
            $sql = "call SP_TRAER_DATOS_USUARIO('$id')";
            $arreglo = array();
            if($consulta = $this->conexion->conexion->query($sql)){
                while($consulta_vu = mysqli_fetch_array($consulta)){//como es array tiene q haber json_encode en el controlador
                    $arreglo[] = $consulta_vu;
                }
                return $arreglo;
                $this->conexion->cerrar();
            }
        }

        function Actualizar_Datos_Profile($id, $nombre, $paterno, $materno, $ndocumento, $tdocumento, $sexo, $telefono){
            $sql = "call SP_ACTUALIZAR_DATOS_PERSONA_PROFILE('$id', '$nombre', '$paterno', '$materno', '$ndocumento', '$tdocumento', '$sexo', '$telefono')";
            if($consulta = $this->conexion->conexion->query($sql)){
                if($row = mysqli_fetch_array($consulta)){
                    return $respuesta = trim($row[0]);
                }
                
                $this->conexion->cerrar();
            }
        }
    }
?>