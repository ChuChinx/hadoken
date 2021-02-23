function Verificar_Usuario(){
    var usu = document.getElementById('usuario').value;
    var pass = document.getElementById('password').value;
    //alert(usu+" - "+pass);
    if (usu.length==0 || pass.length==0){
        return Swal.fire("Mensaje de advertencia", "Llene los campos vacios", "warning");
    }

    $.ajax({
        url: '../controlador/usuario/controlador_verificar_usuario.php',
        type:'POST',
        data:{
            u:usu,
            p:pass
        }
    }).done(function(resp){
        //alert(resp);
        var data = JSON.parse(resp);
        if(resp==0){
            Swal.fire("Mensaje de advertencia", "Usuario y/o contraseña incorrecta", "warning");
        }else{
            if(data[0][5]==="ACTIVO"){
                $.ajax({
                    url:'../controlador/usuario/controlador_crear_session.php',
                    type: 'POST',
                    data:{
                        idusuario: data[0][0],
                        usuario: data[0][1],
                        rol: data[0][6]
                    }
                }).done(function (resp){
                    
                    let timerInterval
                    Swal.fire({
                    title: 'Bienvenido al sistema',
                    html: 'Sera redireccionado <b></b> milliseconds.',
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: () => {
                        Swal.showLoading()
                        timerInterval = setInterval(() => {
                        const content = Swal.getContent()
                        if (content) {
                            const b = content.querySelector('b')
                            if (b) {
                            b.textContent = Swal.getTimerLeft()
                            }
                        }
                        }, 100)
                    },
                    willClose: () => {
                        clearInterval(timerInterval)
                    }
                    }).then((result) => {
                    /* Read more about handling dismissals below */
                    if (result.dismiss === Swal.DismissReason.timer) {
                        location.reload();
                    }
                    })
                })
            }else{
                Swal.fire("Mensaje de advertencia", "El usuario se encuentra inactivo, comuníquese con el administrador", "warning");
            }
        }
    })

}

var t_usuario;
function listar_usuario(){

    t_usuario = $("#tabla_usuario").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/usuario/controlador_usuario_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "usuario_nombre"},
            {"data": "persona"}, //como esta en la BD
            {"data": "rol_nombre"},
            {"data": "usuario_email"},
            {"data": "usuario_imagen", 
                render: function(data, type, row){
                    return '<img src="../'+data+'" class="img-circle m-r-10" style="width:50px;height: 50px;">';
                }
            },
            {"data": "usuario_status",
                render: function(data, type, row){
                    if(data==="ACTIVO"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }else{
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }
                }
            },
            {"defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"}
		  
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[4]).css('text-align', 'left' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_usuario.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_usuario').DataTable().page.info();
        t_usuario.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
}

function listar_persona_combo(){
    $.ajax({
        url:"../controlador/usuario/controlador_persona_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_persona').innerHTML=cadena;
            document.getElementById('cbm_persona_editar').innerHTML=cadena;
        }else{
            document.getElementById('cbm_persona').innerHTML="No se encontraron elementos";
            document.getElementById('cbm_persona_editar').innerHTML="No se encontraron elementos";
        }
    })
}

function listar_rol_combo(){
    $.ajax({
        url:"../controlador/usuario/controlador_rol_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_rol').innerHTML=cadena;
            document.getElementById('cbm_rol_editar').innerHTML=cadena;
        }else{
            document.getElementById('cbm_rol').innerHTML="No se encontraron elementos";
            document.getElementById('cbm_rol_editar').innerHTML="No se encontraron elementos";
        }
    })
}

function Registrar_Usuario(){
    var usuario = document.getElementById('txt_usu').value;
    var pass = document.getElementById('txt_password').value;
    var idpersona = document.getElementById('cbm_persona').value;
    var email = document.getElementById('txt_email').value;
    var idrol = document.getElementById('cbm_rol').value;
    var archivo = document.getElementById('imagen').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#imagen")[0].files[0]; //para capturar el archivo img, object
    if(usuario.length==0 || pass.length==0 || email.length==0){
        //mensajeerror(usuario, pass, email, 'div_error');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    if(validar_email(email)){

    }else{
        return Swal.fire("Mensaje de advertencia", "El formato del email es incorrecto", "warning");
    }

    formData.append('usuario',usuario);
    formData.append('pass',pass);
    formData.append('idpersona',idpersona);
    formData.append('email',email);
    formData.append('idrol',idrol);
    formData.append('foto',foto);//object
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/usuario/controlador_usuario_registro.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(respuesta !=0){
                if(respuesta==1){
                    LimpiarCampos();
                    t_usuario.ajax.reload();
                    $("#modal_registro").modal('hide');
                    Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El usuario/email ya se encuentra registrado", "warning");
                }
            }
        }
    });
    return false;
}

function LimpiarCampos(){
    document.getElementById('txt_usu').value="";
    document.getElementById('txt_password').value="";
    document.getElementById('txt_email').value="";
    document.getElementById('imagen').value="";
}

function validar_email(email){
    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email) ? true : false;
}

$('#tabla_usuario').on('click', '.editar', function(){//parar el editar
    var data = t_usuario.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_usuario.row(this).child.isShown()){//cuando esta responsive
        var data = t_usuario.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txt_usu_id').value=data.usuario_id;//puedo llamar si es q esta en el procedimiento alm
    document.getElementById('txt_usu_editar_actual').value=data.usuario_nombre;//usuario_nombre es del procedimiento alm
    document.getElementById('txt_email_editar_nuevo').value=data.usuario_email;//txt_email_editar_nuevo es el id de la vista
    $("#cbm_persona_editar").val(data.persona_id).trigger("change");//para los select
    $("#cbm_rol_editar").val(data.id_rol).trigger("change");
    $("#cbm_status").val(data.usuario_status).trigger("change");
})

function Editar_Usuario(){//copiado de registrar_usuario
    var id = document.getElementById('txt_usu_id').value;
    //var usuarioactual = document.getElementById('txt_usu_editar_actual').value;
    var idpersona = document.getElementById('cbm_persona_editar').value;
    //var emailactual = document.getElementById('txt_email_editar_actual').value;
    var emailnuevo = document.getElementById('txt_email_editar_nuevo').value;
    var idrol = document.getElementById('cbm_rol_editar').value;
    var status = document.getElementById('cbm_status').value;
    if(validar_email(emailnuevo)){

    }else{
        return Swal.fire("Mensaje de advertencia", "El formato del email es incorrecto", "warning");
    }
    
    $.ajax({
        url:'../controlador/usuario/controlador_usuario_editar.php',
        type:'POST',
        data:{ //todo lo de la primera parte debe estar aqui
            id:id,
            idpersona:idpersona,
            emailnuevo:emailnuevo,
            idrol:idrol,
            status:status
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){
                t_usuario.ajax.reload();
                $("#modal_editar").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos actualizados", "success");
            }else{
                Swal.fire("Mensaje de advertencia", "El email ya se encuentra registrado", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "La actualizacion no se pudo completar", "error");
        }
    })
}

function Editar_Foto(){
    var id = document.getElementById('txt_usu_id').value;
    var archivo = document.getElementById('imagen_editar').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#imagen_editar")[0].files[0];
    if(archivo.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un archivo", "warning");
    }
    formData.append('id',id);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/usuario/controlador_usuario_editar_imagen.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(respuesta !=0){
                if(respuesta==1){
                    
                    t_usuario.ajax.reload();
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmacion", "Foto actualizada", "success");
                }
            }
        }
    });
    return false;
}

function TraerDatosUsuario(){
    var id = document.getElementById('txt_codigo_principal').value;
    $.ajax({
        url:'../controlador/usuario/controlador_traerdatos_usuario.php',
        type:'POST',
        data:{ //todo lo de la primera parte debe estar aqui
            id:id,
        }
    }).done(function(resp){
        var data = JSON.parse(resp);
        if(data.length>0){
            document.getElementById('usu_sidebar').innerHTML=data[0][1];//1 por la posicion del usuario nombre del procedimiento alm
            document.getElementById('rol_sidebar').innerHTML=data[0][7];//7 por la posicion del rol nombre del procedimiento alm
        }
    })
}

function TraerDatosPerfil(){
    var id = document.getElementById('txt_codigo_principal').value;
    $.ajax({
        url:'../controlador/usuario/controlador_traerdatos_usuario.php',
        type:'POST',
        data:{ //todo lo de la primera parte debe estar aqui
            id:id,
        }
    }).done(function(resp){
        var data = JSON.parse(resp);
        if(data.length>0){
            document.getElementById('txt_imagen_profile').src='../'+data[0][16];//16 por la posicion de la imagen del procedimiento alm ../salir
            document.getElementById('txt_persona_profile').innerHTML=data[0][8]+' '+data[0][9]+' '+data[0][10];//innerHTML, por ponerlo en una etiqueta h1,h2,...
            document.getElementById('txt_rol_profile').innerHTML=data[0][7];
            document.getElementById('txt_nombre_profile').value=data[0][8];//value, por insertar en un input
            document.getElementById('txt_paterno_profile').value=data[0][9];
            document.getElementById('txt_materno_profile').value=data[0][10];
            document.getElementById('txt_ndocumento_profile').value=data[0][11];
            $("#cbm_tdocumento_profile").val(data[0][12]).trigger("change");//select2
            $("#cbm_sexo_profile").val(data[0][13]).trigger("change");//select2
            document.getElementById('txt_telefono_profile').value=data[0][14];
        }
    })
}

function Editar_Foto_Profile(){
    var id = document.getElementById('txt_codigo_principal').value;
    var archivo = document.getElementById('imagen_profile').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#imagen_profile")[0].files[0];
    if(archivo.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un archivo", "warning");
    }
    formData.append('id',id);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/usuario/controlador_usuario_editar_imagen.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            //alert(respuesta);
            if(respuesta !=0){
                if(respuesta==1){
                    TraerDatosPerfil();
                    Swal.fire("Mensaje de confirmacion", "Foto actualizada", "success");
                }
            }
        }
    });
    return false;
}

function Datos_Actualizar(){
    var id = document.getElementById('txt_codigo_principal').value;
    var nombre = document.getElementById('txt_nombre_profile').value;
    var paterno = document.getElementById('txt_paterno_profile').value;
    var materno = document.getElementById('txt_materno_profile').value;
    var ndocumento = document.getElementById('txt_ndocumento_profile').value;
    var tdocumento = document.getElementById('cbm_tdocumento_profile').value;
    var sexo = document.getElementById('cbm_sexo_profile').value;
    var telefono = document.getElementById('txt_telefono_profile').value;
    //de reg persona
    if(nombre.length==0 || paterno.length==0 || materno.length==0 || ndocumento.length==0 || tdocumento.length==0 || sexo.length==0 || telefono.length==0){
        mensajeerror(nombre, paterno, materno, ndocumento, tdocumento, sexo, telefono);
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacio", "warning");
    }

    $.ajax({
        url:'../controlador/usuario/controlador_actualizar_datos_persona_profile.php',
        type:'POST',
        data:{
            id:id,
            nombre:nombre,
            paterno:paterno,
            materno:materno,
            ndocumento:ndocumento,
            tdocumento:tdocumento,
            sexo:sexo,
            telefono:telefono
        }
    }).done(function(resp){
        //alert(resp);
        if(isNaN(resp)){
            document.getElementById('div_error_profile').style.display="block";
            document.getElementById('div_error_profile').innerHTML="<strong>Revise los siguientes campos:</strong><br>"+resp;
        }else{
            if(resp>0){
                document.getElementById('div_error_profile').style.display="none";
                document.getElementById('div_error_profile').innerHTML="";
                if(resp==1){
                   Swal.fire("Mensaje de confirmación", "Datos guardados", "success");
                   TraerDatosPerfil();
                }else{
                    Swal.fire("Mensaje de advertencia", "El número de documento ingresado ya se encuentra registrado", "warning");
                }
            }else{
                
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })

}

/*function mensajeerror(usuario, pass, email, id){
    var cadena = "";
    if(usuario.length==0){
        cadena+="El nombre no debe estar vacío.<br>"
    }
    if(pass.length==0){
        cadena+="El apellido paterno no debe estar vacío.<br>"
    }
    if(email.length==0){
        cadena+="El apellido materno no debe estar vacío.<br>"
    }
    

    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML="<strong>Revise los siguientes campos:</strong><br>"+cadena;
}*/