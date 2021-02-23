<script src="../js/console_ingreso.js"></script>

<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO REGISTRO DE INGRESO</div>
            </div>
            <div class="ibox-body">
                <div class="row" style="padding: 0 0 20px;">
                    <div class="col-lg-8">
                        <label for="" >Proveedor</label>
                        <select class="js-example-basic-single" id="cbm_proveedor" style="width:100%;">
                        </select>
                    </div>
                    <div class="col-lg-4">
                        <label for="" style="display: block;">Impuesto (18% - 0.18)</label>
                        <input type="text" class="form-control" style="width: 100%;" id="txt_impuesto" disabled>
                    </div>
                    <div class="col-lg-6">
                        <label for="" >Tipo de comprobante</label>
                        <select class="js-example-basic-single" style="width:100%;" id="cbm_tipo">
                            <option value="BOLETA" class="">BOLETA</option>
                            <option value="FACTURA" class="">FACTURA</option>
                            <option value="TICKET" class="">TICKET</option>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label for="" >Serie comprobante</label>
                        <input type="text" class="form-control" style="width:100%;" id="txt_serie">
                    </div>
                    <div class="col-lg-3">
                        <label for="" >N&uacute;mero comprobante</label>
                        <input type="text" class="form-control" style="width:100%;" id="txt_numero">
                    </div>
                    <div class="col-lg-6">
                        <label for="" >Insumo</label>
                        <select class="js-example-basic-single" style="width:100%;" id="cbm_insumo">
                        </select>
                    </div>
                    <div class="col-lg-2">
                        <label for="" >Precio</label>
                        <input type="number" onkeypress="return filterFloat(event,this);" min="1" class="form-control" style="width:100%;" id="txt_precio">
                    </div>
                    <div class="col-lg-2">
                        <label for="" >Cantidad</label>
                        <input type="number" onkeypress="return event.charCode>=48" min="1" class="form-control" style="width:100%;" id="txt_cantidad">
                    </div>
                    <div class="col-lg-2">
                        <br>
                        <button class="btn btn-primary" style="cursor: pointer;width:100%" onclick="Agregar_Insumo_Detalle_Ingreso()"><i class="fa fa-plus-square"></i>&nbsp;Agregar Insumo</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">Detalles de Ingreso</div>
            </div>
            <div class="ibox-body" style="overflow-x: scroll;">
                <table id="detalle_ingreso" class="display" style="width:100%;text-align: center;">
                    <thead style="height: 35px;background: #374f65;color: #fff;">
                        <tr>
                            <th style="text-align: center;">Id</th><!-- 4 col entonces 4 en console-->
                            <th style="text-align: center;">Insumo</th>
                            <th style="text-align: center;">Precio</th>
                            <th style="text-align: center;">Cantidad</th>
                            <th style="text-align: center;">Sub Total</th>
                            <th style="text-align: center;">Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_detalle_ingreso" style="background: #0679e31a;">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
                <div class="row" style="margin: 15px;">
                    <div class="col-lg-9">
                    </div>
                    <div class="col-lg-3" style="display: grid;font-size: 20px;padding: 20px 0 0;">
                        <label for="" class="" style="display: grid;grid-template-columns: 1fr 1fr;" id="lb_subtotal"></label>
                        <label for="" class="" style="display: grid;grid-template-columns: 1fr 1fr;" id="lb_impuesto"></label>
                        <label for="" class="" style="display: grid;grid-template-columns: 1fr 1fr;" id="lb_totalneto"></label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12" >
        <div class="col-lg-12" style="text-align: center;margin: ;padding: 15px;background: #fff;">
            <button class="btn btn-success btn-lg" onclick="Registrar_Ingreso()" style="cursor: pointer;">REGISTRAR INGRESO</button>
        </div>
    </div>
</div>

<style>
    tbody tr{
        border-bottom:1px solid #bfbfbf;
    }
</style>

<script>
    $(document).ready(function() {
        
        $('.js-example-basic-single').select2();
        combo_proveedor();
        combo_insumo();
    });

    $('#cbm_tipo').on('select2:select', function(e){//funcion para desactivar o activar el input del impuesto
        let tipo = document.getElementById('cbm_tipo').value;
        if(tipo=="FACTURA"){
            document.getElementById('txt_impuesto').disabled=false;
        }else{
            document.getElementById('txt_impuesto').disabled=true;
        }
    })

    


</script>