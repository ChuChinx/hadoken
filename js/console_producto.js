var t_producto;
function listar_producto(){

    t_producto = $("#tabla_producto").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/producto/controlador_producto_listar.php",
      },
      "columns":[
            {"defaultContent": ""},//col = vista
            {"data": "producto_nombre"},//de la BD procedimiento alm
            {"data": "producto_foto", 
                render: function(data, type, row){
                    return '<img src="../'+data+'" class="img-circle m-r-10" style="width:50px;height: 50px;">';
                }
            },
            {"data": "producto_status",
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
        	$($(nRow).find("td")[3]).css('text-align', 'initial' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_producto.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_producto').DataTable().page.info();
        t_producto.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

$('#tabla_producto').on('click', '.editar', function(){//parar el editar
    var data = t_producto.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_producto.row(this).child.isShown()){//cuando esta responsive
        var data = t_producto.row(this).data();
    }
    $("#modal_editar").modal({backdrop: 'static', keyboard: false});
    $("#modal_editar").modal('show');
    document.getElementById('txt_producto_id').value=data.producto_id;//data. puedo llamar si es q esta en el procedimiento alm
    document.getElementById('txt_producto_editar').value=data.producto_nombre;//usuario_nombre es del procedimiento alm
    document.getElementById('txt_foto_producto_editar').value=data.producto_foto;//txt_email_editar_nuevo es el id de la vista
    
    $("#cbm_status").val(data.producto_status).trigger("change");
    document.getElementById('div_error_editar').style.display="none";//limpiar
    document.getElementById('div_error_editar').innerHTML="";
})

$('#tabla_producto').on('click', '.detallar', function(){//parar el editar
    var data = t_producto.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_producto.row(this).child.isShown()){//cuando esta responsive
        var data = t_producto.row(this).data();
    }
    $("#modal_detallar").modal({backdrop: 'static', keyboard: false});
    $("#modal_detallar").modal('show');
    document.getElementById('txt_producto_detallar').value=data.producto_nombre;
    listar_insumo_detalle(data.producto_id);
    
})

function Registrar_Producto(){
    var producto = document.getElementById('txt_producto_registro').value;
    
    var archivo = document.getElementById('txt_foto_producto').value;
    if(producto.length==0){
        mensajeerror(producto, 'div_error');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "PRO"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_producto")[0].files[0]; //para capturar el archivo img, object
    
    formData.append('producto',producto);//id izq es como debo llamar en controlador, metodo POST
    
    formData.append('foto',foto);//object, foto y nombrearchivo no se lleva al controlador porq pueden ir vacios 
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/producto/controlador_producto_registro.php',
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
                        t_producto.ajax.reload();
                        $("#modal_registro").modal('hide');
                        Swal.fire("Mensaje de confirmacion", "Datos guardados", "success");
                    }else{
                        Swal.fire("Mensaje de advertencia", "El producto ya se encuentra registrado", "warning");
                    }
                }
            }
        }
    });
    return false;
}

function mensajeerror(producto, id){
    var cadena = "";
    if(producto.length==0){
        cadena+="El campo producto no debe estar vacío.<br>"
    }
    
    
    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML="<strong>Revise los siguientes campos:</strong><br>"+cadena;
}

function AbrirModal(){
    $("#modal_registro").modal({backdrop: 'static', keyboard: false});
    $("#modal_registro").modal('show');
    document.getElementById('div_error').style.display="none";
    
}

function Editar_Producto(){//cop del reg insumo
    var id = document.getElementById('txt_producto_id').value;
    var producto = document.getElementById('txt_producto_editar').value;
    
    var status = document.getElementById('cbm_status').value;
    
    if(id.length==0 || producto.length==0 || status.length==0){
        mensajeerror(producto, 'div_error_editar');//insertar funcion abajo
        return Swal.fire("Mensaje de advertencia", "Llenar el campo vacío", "warning");
    }
    
    $.ajax({//cop del reg persona
        url:'../controlador/producto/controlador_editar_producto.php',
        type:'POST',
        data:{
            id:id,//llevar 1er al controlador
            producto:producto,
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
                    t_producto.ajax.reload();
                    
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmación", "Datos actualizados", "success");
                }else{
                    Swal.fire("Mensaje de advertencia", "El producto ingresado ya se encuentra registrado", "warning");
                }
            }else{
                Swal.fire("Mensaje de error", "El registro no se pudo completar", "error");
            }
        }
    })
    
    return false;
}

function Editar_Foto_Producto(){
    var id = document.getElementById('txt_producto_id').value;
    var archivo = document.getElementById('txt_foto_producto_editar').value;
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "PRO"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
    var formData= new FormData();
    var foto = $("#txt_foto_producto_editar")[0].files[0];
    if(archivo.length==0){
        return Swal.fire("Mensaje de advertencia", "Debe seleccionar un archivo", "warning");
    }
    formData.append('id',id);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    $.ajax({
        url:'../controlador/producto/controlador_producto_editar_imagen.php',
        type:'post',
        data:formData,
        contentType:false,
        processData:false,
        success: function(respuesta){
            if(respuesta !=0){
                if(respuesta==1){
                    
                    t_producto.ajax.reload();
                    $("#modal_editar").modal('hide');
                    Swal.fire("Mensaje de confirmacion", "Foto actualizada", "success");
                }
            }
        }
    });
    return false;
}

var tableinsumo;
function listar_insumo_detalle(idproducto){

    tableinsumo = $("#tabla_insumo_detalle").DataTable({
        "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/producto/controlador_insumo_detalle_listar.php",
            type:'POST',
            data:{
                id:idproducto
            }
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"insumo_nombre"},
            {"data":"detalleproducto_cantidad"},
            {"data":"unidad_abreviatura"}
        ],
 
        "language":idioma_espanol,
        select: true
    });
 
 
    tableinsumo.on( 'draw.dt', function () {
         var PageInfo = $('#tabla_insumo_detalle').DataTable().page.info();
         tableinsumo.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                 cell.innerHTML = i + 1 + PageInfo.start;
             } );
         } );
  
}