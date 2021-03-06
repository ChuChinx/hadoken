var t_proveedor;
function listar_proveedor(){

    t_proveedor = $("#tabla_proveedor").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/proveedor/controlador_proveedor_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "persona"},
            {"data": "proveedor_contacto"},
            {"data": "proveedor_numcontacto"},
            {"data": "persona_nrodocumento"},
            {"data": "persona_tipodocumento"},
            {"data": "proveedor_razonsocial"},
            {"data": "persona_telefono"},
            {"data": "proveedor_status",
                render: function(data, type, row){
                    if(data==="ACTIVO"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }else{
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }
                }
            },
            {"data": "proveedor_status",
                render: function(data, type, row){
                    if(data==="ACTIVO"){
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btn btn-success' disabled><i class='fa fa-check'></i></button>&nbsp;<button class='desactivar btn btn-warning'><i class='fa fa-times-circle'></i></button>";
                    }else{
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='activar btn btn-success'><i class='fa fa-check'></i></button>&nbsp;<button class='btn btn-warning' disabled><i class='fa fa-times-circle'></i></button>";
                    }
                }
            }
        ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[5]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_proveedor.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_proveedor').DataTable().page.info();
        t_proveedor.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

$('#tabla_proveedor').on('click', '.activar', function(){//.editar igual al button class = editar de defaultContent de listar
    var data = t_proveedor.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_proveedor.row(this).child.isShown()){//cuando esta responsive
        var data = t_proveedor.row(this).data();
    }

    Swal.fire({
        title: 'Activar al proveedor',
        text: "Está seguro activar al proveedor?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí'
      }).then((result) => {
        Modificar_Estatus_Proveedor(data.proveedor_id, 'ACTIVO');//data.proveedor_id, proveedor_id debe estar en el PA
      })
   
})

$('#tabla_proveedor').on('click', '.desactivar', function(){//.editar igual al button class = editar de defaultContent de listar
    var data = t_proveedor.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_proveedor.row(this).child.isShown()){//cuando esta responsive
        var data = t_proveedor.row(this).data();
    }

    Swal.fire({
        title: 'Desactivar al proveedor',
        text: "Está seguro desactivar al proveedor?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí'
      }).then((result) => {
        Modificar_Estatus_Proveedor(data.proveedor_id, 'INACTIVO');//data.proveedor_id, proveedor_id debe estar en el PA
      })
   
})

$('#tabla_proveedor').on('click', '.editar', function(){//.editar igual al button class = editar de defaultContent de listar
    var data = t_proveedor.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_proveedor.row(this).child.isShown()){//cuando esta responsive
        var data = t_proveedor.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show'); 
    document.getElementById('txt_idproveedor').value=data.proveedor_id;
    document.getElementById('txt_razonsocial_editar').value=data.proveedor_razonsocial;
    document.getElementById('txt_nomcontacto_editar').value=data.proveedor_contacto;
    document.getElementById('txt_numcontacto_editar').value=data.proveedor_numcontacto;//ver en el listado del PA data.
   
})

function Modificar_Estatus_Proveedor(idproveedor, estatus){
    $.ajax({
        url:'../controlador/proveedor/controlador_actualizar_estatus_proveedor.php',
        type:'POST',
        data:{
            idproveedor:idproveedor,//al controlador (1ero)
            estatus:estatus
        }
    }).done(function(resp){
        if(resp>0){
            if(estatus=="ACTIVO"){
                Swal.fire("Mensaje de confirmación", "Proveedor activado correctamente", "success");
            }else{
                Swal.fire("Mensaje de confirmación", "Proveedor desactivado", "success");
            }
            t_proveedor.ajax.reload();
        }else{
            Swal.fire("Mensaje de error", "No se pudo actualizar los datos", "error");
        }
    })
}

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
    document.getElementById('div_error').style.display="none";
    //limpiarmodal();
}

function Registrar_Proveedor(){
    var nombre = document.getElementById('txtnombre').value;
    var razonsocial = document.getElementById('txt_razonsocial').value;
    var nomcontacto = document.getElementById('txt_nomcontacto').value;
    var numcontacto = document.getElementById('txt_numcontacto').value;
    var paterno = document.getElementById('txtpaterno').value;
    var materno = document.getElementById('txtmaterno').value;
    var ndocumento = document.getElementById('txtnro').value;
    var tdocumento = document.getElementById('cbm_tdocumento').value;
    var sexo = document.getElementById('cbm_sexo').value;
    var telefono = document.getElementById('txttelefono').value;
    if(nombre.length==0 || paterno.length==0 || materno.length==0 || ndocumento.length==0 || tdocumento.length==0 || sexo.length==0 || telefono.length==0 || razonsocial.length==0 || nomcontacto.length==0 || numcontacto.length==0){
        mensajeerror(nombre, paterno, materno, ndocumento, tdocumento, sexo, telefono, razonsocial, nomcontacto, numcontacto, 'div_error');
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }

    $.ajax({
        url:'../controlador/proveedor/controlador_registro_proveedor.php',
        type:'POST',
        data:{
            nombre:nombre,
            paterno:paterno,
            materno:materno,
            ndocumento:ndocumento,
            tdocumento:tdocumento,
            sexo:sexo,
            telefono:telefono,
            razonsocial:razonsocial,
            nomcontacto:nomcontacto,
            numcontacto:numcontacto
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
                    t_proveedor.ajax.reload();
                    limpiarmodal();
                    $("#modal_registro").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos guardados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El número de RUC ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })
}

function mensajeerror(nombre, paterno, materno, ndocumento, tdocumento, sexo, telefono, razonsocial, nomcontacto, numcontacto, id){
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
    if(razonsocial.length==0){
        cadena+="La razón social no debe estar vacía.<br>"
    }
    if(nomcontacto.length==0){
        cadena+="El nombre de contacto no debe estar vacío.<br>"
    }
    if(numcontacto.length==0){
        cadena+="El número de contacto no debe estar vacío.<br>"
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

function Editar_Proveedor(){
    var idproveedor = document.getElementById('txt_idproveedor').value;
    var razonsocial = document.getElementById('txt_razonsocial_editar').value;
    var nomcontacto = document.getElementById('txt_nomcontacto_editar').value;//del registro proveedor
    var numcontacto = document.getElementById('txt_numcontacto_editar').value;

    if(idproveedor.length==0 || razonsocial.length==0 || nomcontacto.length==0 || numcontacto.length==0){
        return Swal.fire("Mensaje de advertencia", "Llene los campos vacios", "warning");
    }
    $.ajax({
        url:'../controlador/proveedor/controlador_editar_proveedor.php',
        type:'POST',
        data:{
            idproveedor:idproveedor,//al controlador (1ero)
            razonsocial:razonsocial,
            nomcontacto:nomcontacto,
            numcontacto:numcontacto
        }
    }).done(function(resp){
        if(resp>0){
            $("#modal_editar").modal('hide');
            t_proveedor.ajax.reload();
            Swal.fire("Mensaje de confirmacion", "Datos actualizados", "success");
        }else{
            Swal.fire("Mensaje de error", "No se pudo actualizar los datos", "error");
        }
    })
}