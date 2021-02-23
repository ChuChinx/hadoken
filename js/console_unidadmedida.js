var t_unidadmedida;
function listar_unidadmedida(){

    t_unidadmedida = $("#tabla_unidadmedida").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/unidadmedida/controlador_unidadmedida_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "unidad_nombre"},//del procedimiento alm
            {"data": "unidad_abreviatura"},//columnas exact. iguales al de la vista
            {"data": "unidad_fechareg"},
            {"data": "unidad_status",
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
	t_unidadmedida.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_unidadmedida').DataTable().page.info();
        t_unidadmedida.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

$('#tabla_unidadmedida').on('click', '.editar', function(){
    var data = t_unidadmedida.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_unidadmedida.row(this).child.isShown()){//cuando esta responsive
        var data = t_unidadmedida.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txtidunidad').value=data.unidad_id;//para llamar al data.id, el id tiene q estar en el procedimiento alm
    document.getElementById('txt_unidad_actual_editar').value=data.unidad_nombre;
    document.getElementById('txt_unidad_nuevo_editar').value=data.unidad_nombre;
    document.getElementById('txt_abreviatura_editar').value=data.unidad_abreviatura;
    $("#cbm_status").val(data.unidad_status).trigger("change");
})

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
}

function Registrar_Unidad(){
    var unidad = document.getElementById('txt_unidad').value;//id de la vista registro
    var abreviatura = document.getElementById('txt_abreviatura').value;
    if(unidad.length==0){
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío en unidad de medida", "warning");
    }

    if(abreviatura.length==0){
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío en abreviatura", "warning");
    }

    $.ajax({
        url:'../controlador/unidadmedida/controlador_registro_unidadmedida.php',
        type:'POST',
        data:{
            unidad:unidad, //llevar unidad(1ero) al controlador, al POST
            abreviatura:abreviatura
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){//del procedimiento SELECT 1; si es 1 hacer...
                t_unidadmedida.ajax.reload();
                $("#modal_registro").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
                document.getElementById('txt_unidad').value="";
                var abreviatura = document.getElementById('txt_abreviatura').value="";
            }else{//2 ya existe
                Swal.fire("Mensaje de advertencia", "La unidad de medida ya se encuentra registrada", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
        }
    })
}

function Editar_Unidad(){
    var id = document.getElementById('txtidunidad').value;
    var unidadactual = document.getElementById('txt_unidad_actual_editar').value;
    var unidadnueva = document.getElementById('txt_unidad_nuevo_editar').value;
    var abreviatura = document.getElementById('txt_abreviatura_editar').value;
    var status = document.getElementById('cbm_status').value;
    if(unidadactual.length==0 || unidadnueva.length==0){
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío en unidad de medida", "warning");
    }

    if(abreviatura.length==0){
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío en abreviatura", "warning");
    }

    if(status.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un estado", "warning");
    }

    if(id.length==0){
        return Swal.fire("Mensaje de advertencia", "El campo ID no existe", "warning");
    }

    $.ajax({
        url:'../controlador/unidadmedida/controlador_editar_unidadmedida.php',
        type:'POST',
        data:{
            id:id, //llevar unidad(1ero) al controlador, al POST
            unidadactual:unidadactual,
            unidadnueva:unidadnueva,
            abreviatura:abreviatura,
            status:status
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){//del procedimiento SELECT 1; si es 1 hacer...
                t_unidadmedida.ajax.reload();
                $("#modal_editar").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos actualizados", "success");
                
            }else{//2 ya existe
                Swal.fire("Mensaje de advertencia", "La unidad de medida ya se encuentra registrada", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
        }
    })
}

/*function Editar_Categoria(){ 
    var id = document.getElementById('txtidcategoria').value;//los ids de la vista_mantenimiento_categoria
    var categoriaactual = document.getElementById('txt_unidadmedida_actual_editar').value;
    var categorianuevo = document.getElementById('txt_unidadmedida_nuevo_editar').value;
    var status = document.getElementById('cbm_status').value;
    if(id.length==0 || categoriaactual.length==0 || categorianuevo.length==0 || status.length==0){
        Swal.fire("Mensaje de advertencia", "Llenar el campo vacio", "warning");
    }

    $.ajax({
        url:'../controlador/categoria/controlador_editar_categoria.php',
        type:'POST',
        data:{
            id:id,
            categoriaactual:categoriaactual,
            categorianuevo:categorianuevo,
            status:status
        }
    }).done(function(resp){
        //alert(resp);
        if(resp>0){
            if(resp==1){
                t_unidadmedida.ajax.reload();
                $("#modal_editar").modal('hide');
                Swal.fire("Mensaje de confirmacion", "Datos actualizados", "success");
            }else{
                Swal.fire("Mensaje de advertencia", "La categoria ya se encuentra registrada", "warning");
            }
        }else{
            Swal.fire("Mensaje de error", "La actualizacion no se pudo completar", "error");
        }
    })
}*/