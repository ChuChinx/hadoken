<div class="row">
    <div class="col-lg-3 col-md-4">
        <div class="ibox">
            <div class="ibox-body text-center">
                <form method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="m-t-20">
                        <img class="img-circle" style="width: 70%;" id="txt_imagen_profile"/>
                    </div>
                    <h5 class="font-strong m-b-10 m-t-10" id="txt_persona_profile"></h5><!--en vez del nombre(escrito), quitar, y poner id nombre de la persona-->
                    <div class="m-b-20 text-muted" id="txt_rol_profile"></div><!--en vez del nombre(escrito), quitar, y poner id rol-->
                    <div class="profile-social m-b-20">
                        <input type="file" class="form-control" accept="image/*" id="imagen_profile">
                    </div>
                    <div>
                        <button class="btn btn-info btn-rounded m-b-5" onclick="Editar_Foto_Profile()"><i class="fa fa-refresh"></i> Actualizar Foto</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-9 col-md-8">
        <div class="ibox">
            <div class="ibox-body">
                <ul class="nav nav-tabs tabs-line">
                    <li class="nav-item">
                        <a class="nav-link active" href="#tab-2" data-toggle="tab"><i class="ti-settings"></i> Datos Personales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab-3" data-toggle="tab"><i class="ti-announcement"></i> Feeds</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-2">
                        
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label>Nombre</label>
                                <input class="form-control" type="text" id="txt_nombre_profile">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Apellido Paterno</label>
                                <input class="form-control" type="text" id="txt_paterno_profile">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Apellido Materno</label>
                                <input class="form-control" type="text" id="txt_materno_profile">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>N&uacute;mero de Documento</label>
                                <input class="form-control" type="text" id="txt_ndocumento_profile">
                            </div>
                            <div class="col-sm-6">
                                <label for="">Tipo de Documento</label>
                                <select class="js-example-basic-single" style="width:100%;" id="cbm_tdocumento_profile">
                                    <option value="DNI" class="">DNI</option>
                                    <option value="PASAPORTE" class="">PASAPORTE</option>
                                    <option value="RUC" class="">RUC</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label for="">Sexo</label>
                                <select class="js-example-basic-single" style="width:100%;" id="cbm_sexo_profile">
                                    <option value="MASCULINO" class="">MASCULINO</option>
                                    <option value="FEMENINO" class="">FEMENINO</option>
                                </select>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Nro. Tel&eacute;fono</label>
                                <input class="form-control" type="text" id="txt_telefono_profile" onkeypress="return soloNumeros(event)">
                            </div>
                            <div class="col-lg-12"><br>
                                <div class="alert alert-danger alert-bordered" style="display:none;" id="div_error_profile">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group" style="text-align: center;">
                            <button class="btn btn-success" type="button" onclick="Datos_Actualizar()">Actualizar datos</button>
                        </div>
                        
                    </div>
                    <div class="tab-pane fade" id="tab-3">
                        <h1>TAB 3</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/console_usuario.js"></script>
<script>
    TraerDatosPerfil();
    $(document).ready(function() {
        $('.js-example-basic-single').select2();
    });

    document.getElementById("imagen_profile").addEventListener("change", () => {
        var fileName = document.getElementById("imagen_profile").value;
        var idxDot = fileName.lastIndexOf(".") + 1;
        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        if(extFile=="jpg" || extFile=="jpeg" || extFile=="png"){

        }else{
            Swal.fire("MENSAJE DE ADVERTENCIA", "Solo se aceptan imagenes - subio un archivo con extension "+extFile,"warning");
            document.getElementById("imagen_profile").value="";
        }
    });
</script>

