<div class="row">
  <div class="col-md-12">
    <div class="ibox ibox-default">
      <div class="ibox-head" style="display: grid;grid-template-columns: 1fr 1fr;height:120px">
        <div class="ibox-title">MANTENIMIENTO DE COMBOS</div>
        <div class="ibox-tools" style="text-align: end;">
          <button class="btn btn-primary btn-fix" style="cursor: pointer;width: 50%;" onclick="AbrirModal()">Nuevo Combo</button>   
        </div>
        <div class="">&nbsp;</div>
        <div class="ibox-tools" style="text-align: end;">
          <button class="btn btn-warning btn-fix" style="cursor: pointer;width: 50%;" onclick="cargar_contenido('contenido_principal', 'detallecombo/vista_mantenimiento_detallecombo.php')">Registro Detalles</button>
        </div>
      </div>
      <div class="ibox-body">
        <table id="tabla_combo" class="display" style="width:100%">
          <thead>
            <tr>
              <th>#</th><!-- 5 col entonces 5 en console-->
              <th>Combo</th>
              <th>Precio Venta</th>
              <th>Foto</th>
              <th>Estatus</th>
              <th>Acci&oacute;n</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
          <tfoot>
            <tr>
              <th>#</th><!-- 5 col entonces 5 en console-->
              <th>Combo</th>
              <th>Precio Venta</th>
              <th>Foto</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro Combo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
          <div class="row">
            <div class="col-lg-12">
                <label for="">Combo</label>
                <input type="text" class="form-control" id="txt_combo_registro">
            </div>

            <div class="col-lg-6"><br>
                <label for="">Precio venta</label>
                <input type="number" class="form-control" onkeypress="return filterFloat(event,this);" min="1" id="txt_precioventa_registro">
            </div>
            
            <div class="col-lg-6"><br>
                <label for="">Foto combo</label>
                <input type="file" class="form-control" id="txt_foto_combo" accept="image/*">
            </div>

            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" style="display:none;" id="div_error">
              </div>
            </div>

          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="Registrar_Combo()">Guardar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Combo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
              <label for="">Combo</label>
              <input type="text" id="txt_combo_id" hidden><br><!-- enviar al js click-->
              <input type="text" class="form-control" id="txt_combo_editar"><br>
          </div>
          <div class="col-lg-12">
              <label for="">Precio Venta</label>
              <input type="text" class="form-control" id="txt_precioventa_editar"><br>
          </div>
          <div class="col-lg-6"><br>
              <label for="">Estatus</label>
              <select class="js-example-basic-single" id="cbm_status" style="width:100%;">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
          </div>
          <form method="POST" action="#" enctype="multipart/form-data" onsubmit="return false" style="display: flex;width: 100%;align-items: end;text-align: center;">
            <div class="col-lg-6" style="text-align: initial;"><br>
                <label for="">Foto combo</label>
                <input type="file" class="form-control" id="txt_foto_combo_editar" accept="image/*">
            </div>
            <div class="col-lg-6">
              <button class="btn btn-success" onclick="Editar_Foto_Combo()">Actualizar foto</button>
            </div>
          </form>

          <div class="col-lg-12"><br>
            <div class="alert alert-danger alert-bordered" style="display:none;" id="div_error_editar">
            </div>
          </div>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="Editar_Combo()">Actualizar</button><!--Editar_Categoria() al console -->
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_detallar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg"role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Detalles del Combo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
              <label for="">Combo</label>
              <input type="text" id="txt_combo_id_detallar" hidden><br><!-- enviar al js click-->
              <input type="text" class="form-control" style="text-align: center;font-size: 20px;" id="txt_combo_detallar" disabled><br>
          </div>
          <div class="col-lg-12"><br>

            <table id="tabla_producto_detalle" class="display" style="width:100%;text-align: center;">
              <thead style="height: 35px;background: #374f65;color: #fff;">
                <tr>
                  <th style="text-align: center;">#</th><!-- 3 col entonces 3 en console-->
                  <th style="text-align: center;">Producto</th>
                  <th style="text-align: center;">Cantidad</th>
                  
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
              </tfoot>
            </table>
            
          </div>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div>
  </div>
</div>

<script src="../js/console_combo.js"></script>
<script>
  $(document).ready(function() {
      //$('#tabla_categoria').DataTable();
      $('.js-example-basic-single').select2();
      listar_combo();
  });

  $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_combo_registro').trigger('focus')
  })

  document.getElementById("txt_foto_combo").addEventListener("change", () => { //para subir imagenes
      var fileName = document.getElementById("txt_foto_combo").value;
      var idxDot = fileName.lastIndexOf(".") + 1;
      var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
      if(extFile=="jpg" || extFile=="jpeg" || extFile=="png"){

      }else{
          Swal.fire("MENSAJE DE ADVERTENCIA", "Solo se aceptan imagenes - subio un archivo con extension "+extFile,"warning");
          document.getElementById("txt_foto_combo").value="";
      }
  });

</script>

