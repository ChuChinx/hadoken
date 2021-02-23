var t_combo;
function listar_combo(){

    t_combo = $("#tabla_combo").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/combo/controlador_combo_listar.php",
      },
      "columns":[
            {"defaultContent": ""},//col = vista
            {"data": "combo_nombre"},//de la BD procedimiento alm
            {"data": "combo_precioventa"},
            {"data": "combo_foto", 
                render: function(data, type, row){
                    return '<img src="../'+data+'" class="img-circle m-r-10" style="width:50px;height: 50px;">';
                }
            },
            {"data": "combo_status",
                render: function(data, type, row){
                    if(data==="ACTIVO"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }else{
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }
                }
            },
            {"defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button> <button class='detallar btn btn-warning'><i class='fa fa-eye'></i></button>"}
		  
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[0]).css('text-align', 'initial' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_combo.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_combo').DataTable().page.info();
        t_combo.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

$('#tabla_combo').on('click', '.editar', function(){//parar el editar
    var data = t_combo.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_combo.row(this).child.isShown()){//cuando esta responsive
        var data = t_combo.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txt_combo_id').value=data.combo_id;//data. puedo llamar si es q esta en el procedimiento alm
    document.getElementById('txt_combo_editar').value=data.combo_nombre;
    document.getElementById('txt_precioventa_editar').value=data.combo_precioventa;//usuario_nombre es del procedimiento alm
    document.getElementById('txt_foto_combo_editar').value=data.combo_foto;//txt_email_editar_nuevo es el id de la vista
    $("#cbm_status").val(data.combo_status).trigger("change");
    document.getElementById('div_error_editar').style.display="none";//limpiar
    document.getElementById('div_error_editar').innerHTML="";
})

$('#tabla_combo').on('click', '.detallar', function(){//parar ver el detalle
    var data = t_combo.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_combo.row(this).child.isShown()){//cuando esta responsive
        var data = t_combo.row(this).data();
    }
    $("#modal_detallar").modal({backdrop: 'static', keyboard: false});
    $("#modal_detallar").modal('show');
    document.getElementById('txt_combo_detallar').value=data.combo_nombre;
    listar_producto_detalle(data.combo_id);
    
})

function Registrar_Combo(){
    var combo = document.getElementById('txt_combo_registro').value;
    var precioventa = document.getElementById('txt_precioventa_registro').value;
    var archivo = document.getElementById('txt_foto_combo').value;
    if(combo.length==0 || precioventa.length==0){
        mensajeerror(combo, precioventa, 'div_error');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "COMB"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_combo")[0].files[0]; //para capturar el archivo img, object
    
    formData.append('combo',combo);//id izq es como debo llamar en controlador, metodo POST
    formData.append('precioventa',precioventa);
    formData.append('foto',foto);//object, foto y nombrearchivo no se lleva al controlador porq pueden ir vacios 
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/combo/controlador_combo_registro.php',
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
                        limpiarmodal();
                        t_combo.ajax.reload();
                        $("#modal_registro").modal('hide');
                        Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
                    }else{
                        Swal.fire("Mensaje de advertencia", "El combo ya se encuentra registrado", "warning");
                    }
                }
            }
        }
    });
    return false;
}

function mensajeerror(combo, precioventa, id){
    var cadena = "";
    if(combo.length==0){
        cadena+="El campo combo no debe estar vacío.<br>"
    }
    if(precioventa.length==0){
        cadena+="El campo precio de venta no debe estar vacío.<br>"
    }
    
    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML="<strong>Revise los siguientes campos:</strong><br>"+cadena;
}

function limpiarmodal(){
    document.getElementById('txt_combo_registro').value="";
    document.getElementById('txt_precioventa_registro').value="";
    document.getElementById('txt_foto_combo').value="";
    
}

function Editar_Combo(){//cop del reg insumo
    var id = document.getElementById('txt_combo_id').value;
    var combo = document.getElementById('txt_combo_editar').value;
    var precioventa = document.getElementById('txt_precioventa_editar').value;
    var status = document.getElementById('cbm_status').value;
    
    if(id.length==0 || combo.length==0 || precioventa.length==0 || status.length==0){
        mensajeerror(combo, precioventa, 'div_error_editar');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    
    $.ajax({//cop del reg persona
        url:'../controlador/combo/controlador_editar_combo.php',
        type:'POST',
        data:{
            id:id,//llevar 1er al controlador
            combo:combo,
            precioventa:precioventa,
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
                    t_combo.ajax.reload();
                    
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos actualizados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El combo ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })
    
    return false;
}

function Editar_Foto_Combo(){
    var id = document.getElementById('txt_combo_id').value;
    var archivo = document.getElementById('txt_foto_combo_editar').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "COMB"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_combo_editar")[0].files[0];
    if(archivo.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un archivo", "warning");
    }
    formData.append('id',id);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/combo/controlador_combo_editar_imagen.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(respuesta !=0){
                if(respuesta==1){
                    
                    t_combo.ajax.reload();
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmacion", "Foto actualizada", "success");
                }
            }
        }
    });
    return false;
}

var tableproducto;
function listar_producto_detalle(idcombo){

    tableproducto = $("#tabla_producto_detalle").DataTable({
        "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/combo/controlador_producto_detalle_listar.php",
            type:'POST',
            data:{
                id:idcombo
            }
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"producto_nombre"},
            {"data":"detallecombo_cantidad"}
            
        ],
 
        "language":idioma_espanol,
        select: true
    });
 
 
    tableproducto.on( 'draw.dt', function () {
         var PageInfo = $('#tabla_producto_detalle').DataTable().page.info();
         tableproducto.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                 cell.innerHTML = i + 1 + PageInfo.start;
             } );
         } );
  
}