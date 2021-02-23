var t_combo;
function listar_detallecombo_combo(){

    t_combo = $("#tabla_combo").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/detallecombo/controlador_combo_listar.php",
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "combo_nombre"},
            {"data": "combo_foto", 
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
	t_combo.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_combo').DataTable().page.info();
        t_combo.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

function AbrirModal(){
    $("#modal_consulta").modal({backdrop: 'static', keyboard: false});
    $("#modal_consulta").modal('show');
    //document.getElementById('div_error').style.display="none";
    
}

$('#tabla_combo').on('click', '.enviar', function(){//para el envio
    var data = t_combo.row($(this).parents('tr')).data();//detecta a q fila hago click y captura datos a variable data
    if(t_combo.row(this).child.isShown()){//cuando esta responsive
        var data = t_combo.row(this).data();
    }
    
    $("#txt_combo").val(data.combo_nombre);
    $("#txt_id_combo").val(data.combo_id);
    $("#modal_consulta").modal('hide');
})

function listar_producto_combo(){
    $.ajax({
        url:"../controlador/detallecombo/controlador_producto_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            $("#cbm_producto").html(cadena);//de ahi el id a la vista con change
            var id = $("#cbm_producto").val();
            //TraerStockInsumo(id);
            
            
        }else{
            cadena+="<option value=''>NO SE ENCONTRARON REGISTROS</option>";
            $("#cbm_producto").html(cadena);
        }
    })
}

function Agregar_Producto(){
    var idproducto = $("#cbm_producto").val();//capturar el id del combo isnumos, del select
    var producto = $("#cbm_producto option:selected").text();//caputar el nombre
    //alert(idproducto+" - "+insumo);//para prueba, si me captura
    //var cantidadactual = $("#stock_insumo").val(); //stock q hay
    
    var cantidadingresada = $("#txt_cantidad").val(); //la q voy a ingresar

    if(cantidadingresada.length==0){//si no se inserta datos a cantidad, vacio
        return Swal.fire("Mensaje de advertencia", "Debe insertar la cantidad", "warning");
    }

    if(parseInt(cantidadingresada)<1){
        return Swal.fire("Mensaje de advertencia", "La cantidad debe ser mayor a 0", "warning");
    }

    if(idproducto == ""){
        return Swal.fire("Mensaje de advertencia", "No hay productos disponibles", "warning");
    }

    if(verificarid(idproducto)){
        return Swal.fire("Mensaje de advertencia", "El producto ya fue agregado a la tabla", "warning");
    }

    var datos_agregar = "<tr>";//variable para concatenar datos q voy a agregar a la tabla
    datos_agregar+="<td for='id'>"+idproducto+"</td>";//concatenando, for id para q traiga y verificar si no se encuentra en la tabla. 
    datos_agregar+="<td>"+producto+"</td>";//+ins+ para agregar en la tabla
    datos_agregar+="<td>"+cantidadingresada+"</td>";
    datos_agregar+="<td><button class='btn btn-danger' onclick='remove(this)'><i class='fa fa-trash'></i></button></td>";//func remove()
    datos_agregar+="</tr>";

    $("#tbody_tabla_combo_add").append(datos_agregar);//agregar datos de arriba al body de la tabla
}

function verificarid(id){//para no insertar mas de 1, el dato de producto en select
    let idverificar = document.querySelectorAll('#tabla_combo_b td[for="id"]');//(#id de la tabla) capturado en id (let)
    return [].filter.call(idverificar, td=>td.textContent === id).length===1;
}

function remove(t){
    var td = t.parentNode;
    var tr = td.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
}

function Registrar_Detalle_Combox(){
    var idcombo = $("#txt_id_combo").val();
    
    if(idcombo.length==0){
        return Swal.fire("Mensaje de Advertencia","No tiene un combo seleccionado","warning");
    }
    $.ajax({
        "url":"../controlador/detallecombo/controlador_detallecombo_registro.php",
        type:'POST',
        data:{
            idcombo:idcombo
            
        }
    }).done(function(resp){
        //alert(resp);//para ver cuadro de respuesta cada vez q registro, mostrando el combo_id
        if(resp>0){
            registrar_detalle_producto(parseInt(resp));
            Swal.fire("Mensaje De Confirmacion","Los datos se registraron con &enbsp;xito","success").then((value)=>{
                $("#contenido_principal").load("detallecombo/vista_mantenimiento_detallecombo.php");
            });
        }else{
            Swal.fire("Mensaje De Error","Lo sentimos el editar no se pudo completar","error");
        }
    })
}

function registrar_detalle_producto(id){
    var count=0;
    var arreglo_idproducto = new Array();
    var arreglo_cantidad = new Array();
    $("#tabla_combo_b tbody#tbody_tabla_combo_add tr").each(function(){ //id de la tabla, tbody#id del tbody tr, .each para q recorra
        arreglo_idproducto.push($(this).find('td').eq(0).text()); //posicion 0 para el id del producto
        arreglo_cantidad.push($(this).find('td').eq(2).text()); //posicion 2 para la cantidad de la tabla
        count++;
    })
    var idproducto= arreglo_idproducto.toString();//convertir el arreglo capturado en string para enviar al controlador
    var cantidad = arreglo_cantidad.toString();
    if(count==0){
        return ;
    }
     $.ajax({
         "url":"../controlador/detallecombo/controlador_detalle_producto_registro.php",
         type:'POST',
         data:{
             id:id,
             idproducto:idproducto,
             cantidad:cantidad
         }
     }).done(function(resp){
         console.log(resp);
     })
 }