var t_ingreso;
function listar_ingreso(){
    var finicio = document.getElementById('txt_finicio').value;
    var ffin = document.getElementById('txt_ffin').value;
    //return alert(finicio+" - "+ffin);
    t_ingreso = $("#tabla_ingreso").DataTable({
		"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
      "ajax":{
        "method":"POST",
		"url":"../controlador/ingreso/controlador_ingreso_listar.php",
        data:{
            finicio:finicio,
            ffin:ffin
        }
      },
      "columns":[
            {"defaultContent": ""},
            {"data": "usuario_nombre"},
            {"data": "proveedor"},
            {"data": "ingreso_ticomprobante"},
            {"data": "ingreso_seriecomprobante"},
            {"data": "ingreso_numcomprobante"},
            {"data": "ingreso_fecha"},
            {"data": "ingreso_total"},
            {"data": "ingreso_impuesto"},
            {"data": "ingreso_status",
                render: function(data, type, row){
                    if(data==="INGRESADO"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }else{
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                    }
                }
            },
            {"defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"}
		  
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[0]).css('text-align', 'left' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_ingreso.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_ingreso').DataTable().page.info();
        t_ingreso.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
    } );
  
}

function combo_proveedor(){
    $.ajax({
        url:"../controlador/ingreso/controlador_proveedor_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_proveedor').innerHTML=cadena;
            
        }else{
            document.getElementById('cbm_proveedor').innerHTML="No se encontraron elementos";
            
        }
    })
}

function combo_insumo(){
    $.ajax({
        url:"../controlador/ingreso/controlador_insumo_combo_listar.php",
        type: 'POST'
    }).done(function(resp){
        var data = JSON.parse(resp);
        var cadena = "";
        if(data.length>0){
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            document.getElementById('cbm_insumo').innerHTML=cadena;
            
        }else{
            document.getElementById('cbm_insumo').innerHTML="No se encontraron elementos";
            
        }
    })
}

function Agregar_Insumo_Detalle_Ingreso(){//1ero para agregar
    let idinsumo = document.getElementById('cbm_insumo').value;
    let insumo = $("#cbm_insumo option:selected").text();
    let cantidad = document.getElementById('txt_cantidad').value;
    let precio = document.getElementById('txt_precio').value;
    let impuesto = document.getElementById('txt_impuesto').value;
    let subtotal = precio*cantidad;
    let tipo = document.getElementById('cbm_tipo').value;
    if(tipo=="FACTURA"){
        if(impuesto.length==0){
            return Swal.fire("Mensaje de advertencia", "Debe insertar el IGV antes de agregar un insumo", "warning");
        }
        if(impuesto>1.00){
            return Swal.fire("Mensaje de advertencia", "No puede asignar ese valor de IGV", "warning");
        }
    }

    if(cantidad.length==0 || precio.length==0){//si no se inserta datos a cantidad, vacio
        return Swal.fire("Mensaje de advertencia", "Debe insertar la cantidad y/o precio", "warning");
    }

    if(parseInt(cantidad)<1){
        return Swal.fire("Mensaje de advertencia", "La cantidad debe ser mayor a 0", "warning");
    }
    if(parseFloat(precio)<0.1){
        return Swal.fire("Mensaje de advertencia", "El precio debe ser mayor a 0", "warning");
    }

    if(verificarid(idinsumo)){
        return Swal.fire("Mensaje de advertencia", "El insumo seleccionado ya fue agregado a la tabla", "warning");
    }

    let datos_agregar = "<tr>";//variable para concatenar datos q voy a agregar a la tabla
    //mirar datos de la tabla
    datos_agregar+="<td for='id'>"+idinsumo+"</td>";//concatenando, for id para q traiga y verificar si no se encuentra en la tabla. 
    datos_agregar+="<td>"+insumo+"</td>";//+ins+ para agregar en la tabla
    datos_agregar+="<td>"+precio+"</td>";
    datos_agregar+="<td>"+cantidad+"</td>";
    datos_agregar+="<td>"+subtotal+"</td>";
    datos_agregar+="<td><button class='btn btn-danger' onclick='remove(this)'><i class='fa fa-trash'></i></button></td>";//func remove()
    datos_agregar+="</tr>";

    $("#tbody_detalle_ingreso").append(datos_agregar);//agregar datos de arriba al body de la tabla
    SumarTotalneto();//5to
}

function verificarid(id){//para no insertar mas de 1, el dato de insumo en select.//2do para agregar
    let idverificar = document.querySelectorAll('#detalle_ingreso td[for="id"]');//(#id de la tabla) capturado en id (let)
    return [].filter.call(idverificar, td=>td.textContent === id).length===1;
}

function remove(t){//2do para agregar
    var td = t.parentNode;
    var tr = td.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    SumarTotalneto();//4to add
}

function SumarTotalneto(){//3ero, calcular total neto e impuesto
    let arreglo_total = new Array();
    let count = 0;
    let total = 0;
    let impuestototal=0;
    let impuesto = document.getElementById('txt_impuesto').value;
    let subtotal=0;
    

    $("#detalle_ingreso tbody#tbody_detalle_ingreso tr").each(function(){
        arreglo_total.push($(this).find('td').eq(4).text());//4 posicion del subtotal
        count++;
    })
    for(var i=0; i<count; i++){
        var suma = arreglo_total[i];
        subtotal = (parseFloat(subtotal) + parseFloat(suma)).toFixed(2);//2 decimales
        impuestototal = parseFloat(subtotal*impuesto).toFixed(2);
    };
    
    let tipo = document.getElementById('cbm_tipo').value;
    if(tipo=="FACTURA"){
        total = parseFloat(subtotal) + parseFloat(impuestototal);
        $('#lb_subtotal').html("<b>Sub Total: </b> S/."+subtotal);
        $('#lb_impuesto').html("<b>IGV ("+impuesto*100+"%): </b> S/."+impuestototal);
        $('#lb_totalneto').html("<b>Total: </b> S/."+total.toFixed(2));
    }else{
        total = parseFloat(subtotal);
        $('#lb_totalneto').html("<b>Total: </b> S/."+total.toFixed(2));
    }


}

function Registrar_Ingreso(){
    let idproveedor = document.getElementById('cbm_proveedor').value;
    let idusuario = document.getElementById('txt_codigo_principal').value;
    let tipo = document.getElementById('cbm_tipo').value;
    let serie = document.getElementById('txt_serie').value;
    let ncomprobante = document.getElementById('txt_numero').value;
    let total = document.getElementById('lb_totalneto').innerHTML.substr(18);//innerHTML por el id label, substr(18) para q me muestre los datos despues del 18 caracter, usando el contador de caracteres con el alert(total)
    let porcentaje = "";
    let impuesto = "";
    //alert(total);
    
    if(tipo=="FACTURA"){
        porcentaje = document.getElementById('txt_impuesto').value; 
        impuesto = document.getElementById('lb_impuesto').innerHTML.substr(22); 
        
    }else{
        porcentaje = "";
        impuesto = "";
    }//fin de 1era parte, captura de datos
    //copia ajax de categoria
    $.ajax({
        url:'../controlador/ingreso/controlador_registro_ingreso.php',
        type:'POST',
        data:{
            idproveedor:idproveedor,
            idusuario:idusuario,
            tipo:tipo,
            serie:serie,
            ncomprobante:ncomprobante,
            total:total,
            impuesto:impuesto,
            porcentaje:porcentaje
        }
    }).done(function(resp){
        alert(resp);
        if(resp>0){
            
        }else{
            
        }
    })
}