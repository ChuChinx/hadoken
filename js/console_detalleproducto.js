
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
		"url":"../controlador/detalleproducto/controlador_producto_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "producto_nombre"},
            {"data": "producto_foto", 
                render: function(data, type, row){
                    return '<img src="../'+data+'" class="img-circle m-r-10" style="width:50px;height: 50px;">';
                }
            },
            {"defaultContent": "<button class='enviar btn btn-warning'><i class='fa fa-sign-in'></i>&nbsp;Enviar</button>"}
		  
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[0]).css('text-align', 'center' );
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

function AbrirModal(){
    $("#modal_consulta").modal({backdrop: 'static', keyboard: false});
    $("#modal_consulta").modal('show');
    //document.getElementById('div_error').style.display="none";
    
}

$('#tabla_producto').on('click', '.enviar', function(){//para el envio
    var data = t_producto.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_producto.row(this).child.isShown()){//cuando esta responsive
        var data = t_producto.row(this).data();
    }
    $("#txt_id_detalleproducto").val(data.detalleproducto_id);
    $("#txt_producto").val(data.producto_nombre);
    $("#txt_id_producto").val(data.producto_id);
    $("#modal_consulta").modal('hide');
})

function listar_insumo_combo(){
    $.ajax({
        url:"../controlador/detalleproducto/controlador_insumo_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            $("#cbm_insumo").html(cadena);//de ahi el id a la vista con change
            var id = $("#cbm_insumo").val();
            TraerStockInsumo(id);
            
            
        }else{
            cadena+="<option value=''>NO SE ENCONTRARON REGISTROS</option>";
            $("#cbm_insumo").html(cadena);
        }
    })
}

function Agregar_Insumo(){
    var idinsumo = $("#cbm_insumo").val();//capturar el id del combo isnumos, del select
    var insumo = $("#cbm_insumo option:selected").text();//caputar el nombre
    //alert(idinsumo+" - "+insumo);//para prueba, si me captura
    var cantidadactual = $("#stock_insumo").val(); //stock q hay
    
    var cantidadingresada = $("#txt_cantidad").val(); //la q voy a ingresar

    if(cantidadingresada.length==0){//si no se inserta datos a cantidad, vacio
        return Swal.fire("Mensaje de advertencia", "Debe insertar la cantidad", "warning");
    }

    if(parseInt(cantidadingresada)<1){
        return Swal.fire("Mensaje de advertencia", "La cantidad debe ser mayor a 0", "warning");
    }

    if(parseInt(cantidadingresada)>parseInt(cantidadactual)){
        return Swal.fire("Mensaje de advertencia", "No hay stock suficiente de insumos", "warning");
    }

    if(idinsumo == ""){
        return Swal.fire("Mensaje de advertencia", "No hay insumos disponibles", "warning");
    }

    if(verificarid(idinsumo)){
        return Swal.fire("Mensaje de advertencia", "El insumo ya fue agregado a la tabla", "warning");
    }

    var datos_agregar = "<tr>";//variable para concatenar datos q voy a agregar a la tabla
    datos_agregar+="<td for='id'>"+idinsumo+"</td>";//concatenando, for id para q traiga y verificar si no se encuentra en la tabla. 
    datos_agregar+="<td>"+insumo+"</td>";//+ins+ para agregar en la tabla
    datos_agregar+="<td>"+cantidadingresada+"</td>";
    datos_agregar+="<td><button class='btn btn-danger' onclick='remove(this)'><i class='fa fa-trash'></i></button></td>";//func remove()
    datos_agregar+="</tr>";

    $("#tbody_tabla_insumo").append(datos_agregar);//agregar datos de arriba al body de la tabla
}

function verificarid(id){//para no insertar mas de 1, el dato de insumo en select
    let idverificar = document.querySelectorAll('#tabla_insumo td[for="id"]');//(#id de la tabla) capturado en id (let)
    return [].filter.call(idverificar, td=>td.textContent === id).length===1;
}

function remove(t){
    var td = t.parentNode;
    var tr = td.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
}

function TraerStockInsumo(idinsumo){//al change de la vista
    $.ajax({
        url:"../controlador/detalleproducto/controlador_traer_stock_insumo.php",
        type: 'POST',
        data: {
            id:idinsumo //id al controlador
        }
    }).done(function(resp){
        //alert(resp); //para ver si captura datos al entrar a la vista
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            $("#stock_insumo").val(data[0][1]);//pasar el id data[1dato][posicion del stock]
        }else{
            Swal.fire("Mensaje de error", "No se pudo traer el stock", "error");
        }
    })
}

function Registrar_Detalle_Producto(){
    var idproducto = $("#txt_id_producto").val();
    
    if(idproducto.length==0){
        return Swal.fire("Mensaje de Advertencia","No tiene un producto seleccionado","warning");
    }
    $.ajax({
        "url":"../controlador/detalleproducto/controlador_detalleproducto_registro.php",
        type:'POST',
        data:{
            idproducto:idproducto
            
        }
    }).done(function(resp){
        //alert(resp);//para ver cuadro de respuesta cada vez q registro, mostrando el producto_id
        if(resp>0){
            registrar_detalle_insumo(parseInt(resp));
            Swal.fire("Mensaje De Confirmacion","Los datos se registraron con exito","success").then((value)=>{
                $("#contenido_principal").load("detalleproducto/vista_mantenimiento_detalleproducto.php");
            });
        }else{
            Swal.fire("Mensaje De Error","Lo sentimos el editar no se pudo completar","error");
        }
    })
}

function registrar_detalle_insumo(id){
    var count=0;
    var arreglo_idinsumo = new Array();
    var arreglo_cantidad = new Array();
    $("#tabla_insumo tbody#tbody_tabla_insumo tr").each(function(){ //id de la tabla, tbody#id del tbody tr, .each para q recorra
        arreglo_idinsumo.push($(this).find('td').eq(0).text()); //posicion 0 para el id del insumo
        arreglo_cantidad.push($(this).find('td').eq(2).text()); //posicion 2 para la cantidad de la tabla
        count++;
    })
    var idinsumo= arreglo_idinsumo.toString();//convertir el arreglo capturado en string para enviar al controlador
    var cantidad = arreglo_cantidad.toString();
    if(count==0){
        return ;
    }
     $.ajax({
         "url":"../controlador/detalleproducto/controlador_detalle_insumo_registro.php",
         type:'POST',
         data:{
             id:id,
             idinsumo:idinsumo,
             cantidad:cantidad
         }
     }).done(function(resp){
         console.log(resp);
     })
 }