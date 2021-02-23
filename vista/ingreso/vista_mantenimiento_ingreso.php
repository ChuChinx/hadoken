<script src="../js/console_ingreso.js"></script>

<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO INGRESO</div>
                <div class="ibox-tools" style="width: 50%;text-align: right;">
                    <button class="btn btn-primary btn-fix" style="cursor: pointer;width: 50%" onclick="cargar_contenido('contenido_principal', 'ingreso/vista_ingreso_registro.php')">Nuevo Registro</button>
                </div>
            </div>
            <div class="ibox-body">
              <div class="row" style="padding: 0 0 20px;">
                <div class="col-lg-5">
                  <label for="" class=""><b>Fecha Inicio</b></label>
                  <input type="date" class="form-control" id="txt_finicio">
                </div>
                <div class="col-lg-5">
                  <label for="" class=""><b>Fecha Fin</b></label>
                  <input type="date" class="form-control" id="txt_ffin">
                </div>
                <div class="col-lg-2" style="display: flex; align-items: flex-end;">
                  <button class="btn btn-success" style="width: 100%;cursor: pointer;" onclick="listar_ingreso()"><i class="fa fa-search"></i>Buscar</button>
                </div>
              </div>
              <table id="tabla_ingreso" class="display" style="width:100%">
                  <thead>
                      <tr>
                          <th>#</th>
                          <th>Usuario</th>
                          <th>Proveedor</th>
                          <th>Tipo comprobante</th>
                          <th>Serie comprobante</th>
                          <th>Numero comprobante</th>
                          <th>Fecha</th>
                          <th>Total</th>
                          <th>Impuesto</th>
                          <th>Estado</th>
                          <th>Acci&oacute;n</th>
                      </tr>
                  </thead>
                  <tbody>
                  </tbody>
                  <tfoot>
                      <tr>
                          <th>#</th>
                          <th>Usuario</th>
                          <th>Proveedor</th>
                          <th>Tipo comprobante</th>
                          <th>Serie comprobante</th>
                          <th>Numero comprobante</th>
                          <th>Fecha</th>
                          <th>Total</th>
                          <th>Impuesto</th>
                          <th>Estado</th>
                          <th>Acci&oacute;n</th>
                      </tr>
                  </tfoot>
              </table>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar categoría</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div class="col-lg-12">
                <input type="text" id="txtidcategoria" hidden>
                <label for="">Categoría</label>
                <input type="text" id="txt_categoria_actual_editar" hidden>
                <input type="text" class="form-control" id="txt_categoria_nuevo_editar">
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
        <button type="button" class="btn btn-primary" onclick="Editar_Categoria()">Actualizar</button><!--Editar_Categoria() al console -->
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function() {
    //$('#tabla_categoria').DataTable();
    $('.js-example-basic-single').select2();
    
    var f = new Date();//traer fecha actual
    var anio = f.getFullYear();//traer anio
    var mes = f.getMonth()+1;
    var d = f.getDate();//dia 01 02 03
    if(d<10){
      d = '0'+d;
    }
    if(mes<10){
      mes = '0'+mes;
    }
    document.getElementById('txt_finicio').value=anio+"-"+mes+"-"+d;
    document.getElementById('txt_ffin').value=anio+"-"+mes+"-"+d;

    listar_ingreso();

});

$('#modal_registro').on('shown.bs.modal', function () {
  $('#txt_categoria').trigger('focus')
})
</script>