<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DE INSUMOS</div>
                <div class="ibox-tools" style="width: 50%;text-align: right;">
                    <button class="btn btn-primary btn-fix" style="cursor: pointer;width: 50%" onclick="AbrirModal()">Nuevo Registro</button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_insumo" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th><!-- 8 col entonces 8 en console-->
                            <th>Insumo</th>
                            <th>Categoria</th>
                            <th>U. Medida</th>
                            <th>Stock</th>
                            <th>Foto</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th><!-- 8col entonces 8 en console-->
                            <th>Insumo</th>
                            <th>Categoria</th>
                            <th>U. Medida</th>
                            <th>Stock</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro Insumo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
          <div class="row">
            <div class="col-lg-12">
                <label for="">Insumo</label>
                <input type="text" class="form-control" id="txt_insumo_registro"><br>
            </div>
            <div class="col-lg-12">
                <label for="">Categoría</label>
                <select class="js-example-basic-single" id="cbm_categoria_registro" style="width:100%;">
                    
                </select>
            </div>
            <div class="col-lg-12"><br>
                <label for="">U. Medida</label>
                <select class="js-example-basic-single" id="cbm_unidad_registro" style="width:100%;">
                    
                </select>
            </div>
            <div class="col-lg-12"><br>
                <label for="">Foto insumo</label>
                <input type="file" class="form-control" id="txt_foto_insumo" accept="image/*">
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
        <button type="button" class="btn btn-primary" onclick="Registrar_Insumo()">Guardar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Insumo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
              <label for="">Insumo</label>
              <input type="text" id="txt_insumo_id" hidden><br><!-- enviar al js click-->
              <input type="text" class="form-control" id="txt_insumo_nuevo_editar"><br>
          </div>
          <div class="col-lg-12">
              <label for="">Categoría</label>
              <select class="js-example-basic-single" id="cbm_categoria_editar" style="width:100%;">
                  
              </select>
          </div>
          <div class="col-lg-6"><br>
              <label for="">U. Medida</label>
              <select class="js-example-basic-single" id="cbm_unidad_editar" style="width:100%;">
                  
              </select>
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
                <label for="">Foto insumo</label>
                <input type="file" class="form-control" id="txt_foto_insumo_editar" accept="image/*">
            </div>
            <div class="col-lg-6">
              <button class="btn btn-success" onclick="Editar_Foto_Insumo()">Actualizar foto</button>
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
        <button type="button" class="btn btn-primary" onclick="Editar_Insumo()">Actualizar</button><!--Editar_Categoria() al console -->
      </div>
    </div>
  </div>
</div>

<script src="../js/console_insumo.js"></script>
<script>
  $(document).ready(function() {
      //$('#tabla_categoria').DataTable();
      $('.js-example-basic-single').select2();
      listar_insumo();
      categoria_combo();
      unidad_combo();
  });

  $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_insumo_registro').trigger('focus')
  })

  document.getElementById("txt_foto_insumo").addEventListener("change", () => { //para subir imagenes
      var fileName = document.getElementById("txt_foto_insumo").value;
      var idxDot = fileName.lastIndexOf(".") + 1;
      var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
      if(extFile=="jpg" || extFile=="jpeg" || extFile=="png"){

      }else{
          Swal.fire("MENSAJE DE ADVERTENCIA", "Solo se aceptan imagenes - subio un archivo con extension "+extFile,"warning");
          document.getElementById("txt_foto_insumo").value="";
      }
  });
</script>