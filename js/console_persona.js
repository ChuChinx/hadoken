var t_persona;
function listar_persona(){

    t_persona = $("#tabla_persona").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/persona/controlador_persona_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "persona"},
            {"data": "persona_nrodocumento"},
            {"data": "persona_tipodocumento"},
            {"data": "persona_sexo"},
            {"data": "persona_telefono"},
            {"data": "persona_status",
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
	t_persona.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_persona').DataTable().page.info();
        t_persona.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

//obtener datos de la tabla
$('#tabla_persona').on('click', '.editar', function(){//.editar igual al button class = editar de defaultContent de listar
    var data = t_persona.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_persona.row(this).child.isShown()){//cuando esta responsive
        var data = t_persona.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');//crear modal_editar
    document.getElementById('txtidpersona').value=data.persona_id;
    document.getElementById('txtnombre_editar').value=data.persona_nombre;//llamado dato de la BD data.dato
    document.getElementById('txtpaterno_editar').value=data.persona_paterno;//solamente se puede acceder a data si es q persona_ esta en el PA de listar
    document.getElementById('txtmaterno_editar').value=data.persona_materno;
    document.getElementById('txtnro_editar_actual').value=data.persona_nrodocumento;
    document.getElementById('txtnro_editar_nuevo').value=data.persona_nrodocumento;
    document.getElementById('txttelefono_editar').value=data.persona_telefono;
    $("#cbm_tdocumento_editar").val(data.persona_tipodocumento).trigger("change");//para los select
    $("#cbm_sexo_editar").val(data.persona_sexo).trigger("change");
    $("#cbm_status").val(data.persona_status).trigger("change");
    document.getElementById('div_error_editar').style.display="none";
})

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
    document.getElementById('div_error').style.display="none";
    limpiarmodal();
}

function Registrar_Persona(){
    var nombre = document.getElementById('txtnombre').value;
    var paterno = document.getElementById('txtpaterno').value;
    var materno = document.getElementById('txtmaterno').value;
    var ndocumento = document.getElementById('txtnro').value;
    var tdocumento = document.getElementById('cbm_tdocumento').value;
    var sexo = document.getElementById('cbm_sexo').value;
    var telefono = document.getElementById('txttelefono').value;
    if(nombre.length==0 || paterno.length==0 || materno.length==0 || ndocumento.length==0 || tdocumento.length==0 || sexo.length==0 || telefono.length==0){
        mensajeerror(nombre, paterno, materno, ndocumento, tdocumento, sexo, telefono, 'div_error');
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }

    $.ajax({
        url:'../controlador/persona/controlador_registro_persona.php',
        type:'POST',
        data:{
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
            document.getElementById('div_error').style.display="block";
            document.getElementById('div_error').innerHTML="<strong>Revise los siguientes campos:</strong><br>"+resp;
        }else{
            if(resp>0){
                document.getElementById('div_error').style.display="none";
                document.getElementById('div_error').innerHTML="";
                if(resp==1){
                    t_persona.ajax.reload();
                    limpiarmodal();
                    $("#modal_registro").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos guardados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El número de documento ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })
}

function Editar_Persona(){
    var id = document.getElementById('txtidpersona').value;
    var nombre = document.getElementById('txtnombre_editar').value;
    var paterno = document.getElementById('txtpaterno_editar').value;
    var materno = document.getElementById('txtmaterno_editar').value;
    var ndocumentoactual = document.getElementById('txtnro_editar_actual').value;
    var ndocumentonuevo = document.getElementById('txtnro_editar_nuevo').value;
    var tdocumento = document.getElementById('cbm_tdocumento_editar').value;
    var sexo = document.getElementById('cbm_sexo_editar').value;
    var telefono = document.getElementById('txttelefono_editar').value;
    var status = document.getElementById('cbm_status').value;
    if(id.length==0 || nombre.length==0 || paterno.length==0 || materno.length==0 || ndocumentoactual.length==0 || ndocumentonuevo.length==0 || tdocumento.length==0 || sexo.length==0 || telefono.length==0){
        mensajeerror(nombre, paterno, materno, ndocumentonuevo, tdocumento, sexo, telefono, 'div_error_editar');
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }

    $.ajax({
        url:'../controlador/persona/controlador_editar_persona.php',
        type:'POST',
        data:{
            id:id, //2do, id tiene q estar en controlador_editar_persona
            nombre:nombre,
            paterno:paterno,
            materno:materno,
            ndocumentoactual:ndocumentoactual,
            ndocumentonuevo:ndocumentonuevo,
            tdocumento:tdocumento,
            sexo:sexo,
            telefono:telefono,
            status:status
        }
    }).done(function(resp){
        //alert(resp);
        if(isNaN(resp)){
            document.getElementById('div_error_editar').style.display="block";
            document.getElementById('div_error_editar').innerHTML="<strong>Revise los siguientes campos:</strong><br>"+resp;
        }else{
            if(resp>0){
                
                if(resp==1){
                    t_persona.ajax.reload();
                    
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos Actualizados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El número de documento ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "La actualizacion no se pudo completar", "error");
            }
        }
    })
}

function mensajeerror(nombre, paterno, materno, ndocumento, tdocumento, sexo, telefono, id){
    var cadena = "";
    if(nombre.length==0){
        cadena+="El nombre no debe estar vacío.<br>"
    }
    if(paterno.length==0){
        cadena+="El apellido paterno no debe estar vacío.<br>"
    }
    if(materno.length==0){
        cadena+="El apellido materno no debe estar vacío.<br>"
    }
    if(ndocumento.length==0){
        cadena+="El número de documento no debe estar vacío.<br>"
    }
    if(tdocumento.length==0){
        cadena+="El tipo de documento no debe estar vacío.<br>"
    }
    if(sexo.length==0){
        cadena+="El campo sexo no debe estar vacío.<br>"
    }
    if(telefono.length==0){
        cadena+="El número de teléfono no debe estar vacío.<br>"
    }

    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML="<strong>Revise los siguientes campos:</strong><br>"+cadena;
}

function limpiarmodal(){
    document.getElementById('txtnombre').value="";
    document.getElementById('txtpaterno').value="";
    document.getElementById('txtmaterno').value="";
    document.getElementById('txtnro').value="";
    document.getElementById('txttelefono').value="";
}