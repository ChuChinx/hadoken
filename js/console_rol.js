var t_rol;
function listar_rol(){

    t_rol = $("#tabla_rol").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/rol/controlador_rol_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "rol_nombre"},
            {"data": "rol_fechareg"},
            {"data": "rol_status",
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
	t_rol.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_rol').DataTable().page.info();
        t_rol.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

$('#tabla_rol').on('click', '.editar', function(){
    var data = t_rol.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_rol.row(this).child.isShown()){//cuando esta responsive
        var data = t_rol.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txtidrol').value=data.id_rol;
    document.getElementById('txt_rol_actual_editar').value=data.rol_nombre;
    document.getElementById('txt_rol_nuevo_editar').value=data.rol_nombre;
    $("#cbm_status").val(data.rol_status).trigger("change");
})

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
}

function Registrar_Rol(){
    var rol = document.getElementById('txt_rol').value;
    if(rol.length==0){
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }

    $.ajax({
        url:'../controlador/rol/controlador_registro_rol.php',
        type:'POST',
        data:{
            rol:rol
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){
                t_rol.ajax.reload();
                $("#modal_registro").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
            }else{
                Swal.fire("Mensaje de advertencia", "El rol ya se encuentra registrado", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
        }
    })
}

function Editar_Rol(){ 
    var id = document.getElementById('txtidrol').value;
    var rolactual = document.getElementById('txt_rol_actual_editar').value;
    var rolnuevo = document.getElementById('txt_rol_nuevo_editar').value;
    var status = document.getElementById('cbm_status').value;
    if(id.length==0 || rolactual.length==0 || rolnuevo.length==0 || status.length==0){
        Swal.fire("Mensaje de advertencia", "Llenar el campo vacio", "warning");
    }

    $.ajax({
        url:'../controlador/rol/controlador_editar_rol.php',
        type:'POST',
        data:{
            id:id,
            rolactual:rolactual,
            rolnuevo:rolnuevo,
            status:status
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){
                t_rol.ajax.reload();
                $("#modal_editar").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos actualizados", "success");
            }else{
                Swal.fire("Mensaje de advertencia", "El rol ya se encuentra registrado", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "La actualizacion no se pudo completar", "error");
        }
    })
}