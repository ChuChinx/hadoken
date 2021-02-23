var t_insumo;
function listar_insumo(){

    t_insumo = $("#tabla_insumo").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/insumo/controlador_insumo_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "insumo_nombre"},
            {"data": "categoria_nombre"},
            {"data": "unidad_nombre"},
            {"data": "insumo_stock"},
            {"data": "insumo_foto", 
                render: function(data, type, row){
                    return '<img src="../'+data+'" class="img-circle m-r-10" style="width:50px;height: 50px;">';
                }
            },
            {"data": "insumo_status",
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
        	$($(nRow).find("td")[3]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_insumo.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_insumo').DataTable().page.info();
        t_insumo.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

function categoria_combo(){
    $.ajax({
        url:"../controlador/insumo/controlador_categoria_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_categoria_registro').innerHTML=cadena;
            document.getElementById('cbm_categoria_editar').innerHTML=cadena;
        }else{
            document.getElementById('cbm_categoria_registro').innerHTML="No se encontraron elementos";
            document.getElementById('cbm_categoria_editar').innerHTML="No se encontraron elementos";
        }
    })
}

function unidad_combo(){
    $.ajax({
        url:"../controlador/insumo/controlador_unidad_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_unidad_registro').innerHTML=cadena;
            document.getElementById('cbm_unidad_editar').innerHTML=cadena;
        }else{
            document.getElementById('cbm_unidad_registro').innerHTML="No se encontraron elementos";
            document.getElementById('cbm_unidad_editar').innerHTML="No se encontraron elementos";
        }
    })
}

function Registrar_Insumo(){
    var insumo = document.getElementById('txt_insumo_registro').value;
    var categoria = document.getElementById('cbm_categoria_registro').value;
    var unidad = document.getElementById('cbm_unidad_registro').value;
    var archivo = document.getElementById('txt_foto_insumo').value;
    if(insumo.length==0 || categoria.length==0 || unidad.length==0){
        mensajeerror(insumo, categoria, unidad, 'div_error');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "INS"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_insumo")[0].files[0]; //para capturar el archivo img, object
    
    formData.append('insumo',insumo);//id izq es como debo llamar en controlador, metodo POST
    formData.append('categoria',categoria);
    formData.append('unidad',unidad);
    formData.append('foto',foto);//object, foto y nombrearchivo no se lleva al controlador porq pueden ir vacios 
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/insumo/controlador_insumo_registro.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(isNaN(respuesta)){
                document.getElementById('div_error').style.display="block";
                document.getElementById('div_error').innerHTML="<strong>Revise los siguientes campos:</strong><br>"+respuesta;
            }else{
                if(respuesta>0){
                    if(respuesta==1){
                        //LimpiarCampos();
                        t_insumo.ajax.reload();
                        $("#modal_registro").modal('hide');
                        Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
                    }else{
                        Swal.fire("Mensaje de advertencia", "El insumo ya se encuentra registrado", "warning");
                    }
                }
            }
        }
    });
    return false;
}

function mensajeerror(insumo, categoria, unidad, id){
    var cadena = "";
    if(insumo.length==0){
        cadena+="El campo insumo no debe estar vacío.<br>"
    }
    if(categoria.length==0){
        cadena+="El campo categoría no debe estar vacío.<br>"
    }
    if(unidad.length==0){
        cadena+="El campo unidad de medida no debe estar vacío.<br>"
    }
    
    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML="<strong>Revise los siguientes campos:</strong><br>"+cadena;
}

$('#tabla_insumo').on('click', '.editar', function(){//parar el editar
    var data = t_insumo.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_insumo.row(this).child.isShown()){//cuando esta responsive
        var data = t_insumo.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txt_insumo_id').value=data.insumo_id;//data. puedo llamar si es q esta en el procedimiento alm
    document.getElementById('txt_insumo_nuevo_editar').value=data.insumo_nombre;//usuario_nombre es del procedimiento alm
    document.getElementById('txt_foto_insumo_editar').value=data.insumo_foto;//txt_email_editar_nuevo es el id de la vista
    $("#cbm_categoria_editar").val(data.categoria_id).trigger("change");//para los select
    $("#cbm_unidad_editar").val(data.unidad_id).trigger("change");
    $("#cbm_status").val(data.insumo_status).trigger("change");
    document.getElementById('div_error_editar').style.display="none";//limpiar
    document.getElementById('div_error_editar').innerHTML="";
})

function Editar_Insumo(){//cop del reg insumo
    var id = document.getElementById('txt_insumo_id').value;
    var insumo = document.getElementById('txt_insumo_nuevo_editar').value;
    var categoria = document.getElementById('cbm_categoria_editar').value;
    var unidad = document.getElementById('cbm_unidad_editar').value;
    var status = document.getElementById('cbm_status').value;
    
    if(id.length==0 || insumo.length==0 || categoria.length==0 || unidad.length==0 || status.length==0){
        mensajeerror(insumo, categoria, unidad, 'div_error_editar');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    
    $.ajax({//cop del reg persona
        url:'../controlador/insumo/controlador_editar_insumo.php',
        type:'POST',
        data:{
            id:id,//llevar 1er al controlador
            insumo:insumo,
            categoria:categoria,
            unidad:unidad,
            status:status
            
        }
    }).done(function(resp){
        //alert(resp);
        if(isNaN(resp)){
            document.getElementById('div_error_editar').style.display="block";
            document.getElementById('div_error_editar').innerHTML="<strong>Revise los siguientes campos:</strong><br>"+resp;
        }else{
            if(resp>0){
                document.getElementById('div_error_editar').style.display="none";
                document.getElementById('div_error_editar').innerHTML="";
                if(resp==1){
                    t_insumo.ajax.reload();
                    
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos actualizados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El insumo ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })
    
    return false;
}

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
    document.getElementById('div_error').style.display="none";
    
}

function Editar_Foto_Insumo(){
    var id = document.getElementById('txt_insumo_id').value;
    var archivo = document.getElementById('txt_foto_insumo_editar').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "INS"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_insumo_editar")[0].files[0];
    if(archivo.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un archivo", "warning");
    }
    formData.append('id',id);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/insumo/controlador_insumo_editar_imagen.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(respuesta !=0){
                if(respuesta==1){
                    
                    t_insumo.ajax.reload();
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmacion", "Foto actualizada", "success");
                }
            }
        }
    });
    return false;
}