<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO UNIDAD DE MEDIDA</div>
                <div class="ibox-tools" style="width: 50%;text-align: right;">
                    <button class="btn btn-primary btn-fix" style="cursor: pointer;width: 50%" onclick="AbrirModal()">Nuevo Registro</button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_unidadmedida" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th><!-- 6 col entonces 6 en console-->
                            <th>Unidad de Medida</th>
                            <th>Abreviatura</th>
                            <th>Fecha Registro</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Unidad de Medida</th>
                            <th>Abreviatura</th>
                            <th>Fecha Registro</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro Unidad de Medida</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="">Unidad de Medida</label>
        <input type="text" class="form-control" id="txt_unidad"><br>
        <label for="">Abreviatura</label>
        <input type="text" class="form-control" id="txt_abreviatura">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="Registrar_Unidad()">Guardar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Unidad de Medida</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div class="col-lg-12">
                
                <label for="">Unidad de Medida</label>
                <input type="text" id="txt_unidad_actual_editar" hidden>
                <input type="text" id="txt_unidad_nuevo_editar" class="form-control">
                <input type="text" id="txtidunidad" hidden>
            </div>
            <div class="col-lg-12">
                
                <label for="">Abreviatura</label>
                <input type="text" class="form-control" id="txt_abreviatura_editar">
                
            </div>
            <div class="col-lg-12">
                <label for="" >Estatus</label>
                <select class="js-example-basic-single" id="cbm_status" style="width:100%;">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
                </select>
            </div>
       </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="Editar_Unidad()">Actualizar</button><!--Editar_Categoria() al console -->
      </div>
    </div>
  </div>
</div>

<script src="../js/console_unidadmedida.js"></script>
<script>
$(document).ready(function() {
    //$('#tabla_categoria').DataTable();
    $('.js-example-basic-single').select2();
    listar_unidadmedida();
});

$('#modal_registro').on('shown.bs.modal', function () {
  $('#txt_unidad').trigger('focus')
})
</script>