<script src="../js/console_detallecombo.js?rev=<?php echo time();?>"></script>

<div class="row">
    <div class="col-md-12" id="registro_detallecombo">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">REGISTRO DETALLE - COMBO</div>
            </div>
            <div class="ibox-body">
                <div class="row">
                    <div class="col-lg-2">
                        <label for="">Id Combo</label>
                        <input type="text" class="form-control" id="txt_id_combo" disabled><br>
                    </div>
                    <div class="col-lg-8">
                        <label for="">Combo</label>
                        <input type="text" class="form-control" id="txt_combo" disabled><br>
                    </div>
                    <div class="col-lg-2" style="display: flex;align-items: center;">
                        <button class="btn btn-success" onclick="AbrirModal()" style="cursor: pointer;width: 100%;"><i class="fa fa-search"></i>Buscar Combo</button>
                    </div>
                    <div class="col-lg-12">
                        <input type="text" id="" hidden>
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
                <div class="ibox-title">PRODUCTOS</div>
                <div class="ibox-tools">
                </div>
            </div>
            <div class="ibox-body">
                <div class="row" style="margin: 0 0 35px;">
                    <div class="col-lg-6">
                        <label for="">Seleccionar producto</label>
                        <select class="js-example-basic-single" id="cbm_producto" style="width:100%;">
                        </select>
                    </div>
                    <!-- <div class="col-lg-2" style="">
                        <label for="" class="">Stock actual</label>
                        <input type="text" class="form-control" id="stock_insumo" disabled>
                    </div>-->
                    
                    <div class="col-lg-3" style="">
                        <label for="" class="">Cantidad Agregar</label>
                        <input type="number" class="form-control" onkeypress="return event.charCode>=48" min="1" id="txt_cantidad">
                    </div>
                    <div class="col-lg-3" style="align-items:flex-end;display: flex;">
                        <button class="btn btn-primary" onclick="Agregar_Producto()" style="cursor: pointer;width: 100%;"><i class="fa fa-plus-square"></i>&nbsp;Agregar</button>
                    </div>
                </div>
                <table id="tabla_combo_b" class="display" style="width:100%;text-align: center;">
                    <thead style="height: 35px;background: #374f65;color: #fff;">
                        <tr>
                            <th style="text-align: center;">Id</th><!-- 4 col entonces 4 en console-->
                            <th style="text-align: center;">Producto</th>
                            <th style="text-align: center;">Cantidad</th>
                            <th style="text-align: center;">Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody id="tbody_tabla_combo_add" style="background: #0679e31a;">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12" >
        <div class="col-lg-12" style="text-align: center;margin: ;padding: 15px;background: #fff;">
            <button class="btn btn-success btn-lg" onclick="Registrar_Detalle_Combox()" style="cursor: pointer;">REGISTRAR</button>
        </div>
    </div>
</div>

<div class="modal fade" id="modal_consulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">A&ntilde;adir Combo</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="ibox-body" style="overflow-x: scroll;">
                <table id="tabla_combo" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th><!-- 4 col entonces 4 en console-->
                            <th>Combo</th>
                            <th>Foto</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="">Guardar</button>
        </div>
    </div>
  </div>
</div>


<script>
    $(document).ready(function() {
        //$('#tabla_categoria').DataTable();
        $('.js-example-basic-single').select2();
        listar_detallecombo_combo();
        listar_producto_combo();
    
    });
    $("#cbm_producto").change(function () { //Funcion para el cambio de stock de acuerdo al cambio del select. id del js del select
        var id = $("#cbm_producto").val();
        //TraerStockInsumo(id);
    });

  
</script>