<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <title>La Marcación</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="../dist/img/icon.png" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- daterange picker -->
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" />
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- Select2 -->
    <link rel="stylesheet" href="../plugins/select2/css/select2.min.css" />
    <link rel="stylesheet" href="../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css" />
    <!-- Select2 -->
    <link rel="stylesheet" href="../plugins/select2/css/select2.min.css" />
    <link rel="stylesheet" href="../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- DataTables -->
    <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables/jquery.dataTables.min.css">
    <script>
        var g_url = localStorage.url;
        var g_idtransaccion = localStorage.idtransaccion;
        var g_avatar = localStorage.avatar;
        if (g_idtransaccion == undefined || g_idtransaccion == 0) {
            document.location.href = localStorage.url + "calendar/";
        }
    </script>
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">

    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light d-flex justify-content-between mb-3">
            <!-- Navbar Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button">
                        <i class="fas fa-bars"></i>
                        <div class="float-right d-none d-sm-block"><strong> &nbsp; HOSPITAL NACIONAL DOCENTE MADRE NIÑO SAN BARTOLOMÉ </strong></div>
                    </a>
                </li>
            </ul>
            <i class="fas fa-sign-out-alt" id="logout" style="margin-right: 50px; cursor: pointer;"></i>
            <!-- Navbar Links -->
        </nav>
        <!-- Navbar -->
        
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color: #011933">
            
            <!-- Brand Logo -->
            <a href="#" class="brand-link">
                <img src="../dist/img/icon.png" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: 0.8" />
                <span class="brand-text font-weight-light">La Marcación</span>
            </a>
            <!-- Brand Logo -->
            
            <!-- Sidebar -->
            <div class="sidebar">

                <!-- Sidebar User -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img id="idimagenuser" src="../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image"/>
                    </div>
                    <div class="info">
                        <a href="#" class="d-block" id="nombreuser">Admin</a>
                    </div>
                </div>
                <!-- Sidebar User -->
                
                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" id="idmenu"></ul>
                </nav>
                <!-- Sidebar Menu -->

            </div>
            <!-- Sidebar -->
        </aside>
        <!-- Main Sidebar Container -->
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Col -->
                        <div class="col-md-12">
                            <div class="card">
                                <div class="d-flex flex-column card-header">
                                    <h3 class="card-title mb-2">Relación de Departamentos</h3>
                                    <span class="btn  btn-primary btn-sm" style="width: 180px;" data-toggle="modal" data-target="#exampleModalForm" onclick="limpiarModal()">Agregar Departamento</span>
                                </div>

                                <div class="p-3 panel-body table-responsive" id="listasdepartamento">
                                    <table id="example1" class="table table-striped table-bordered table-condensed table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:50px">ID</th>
                                                <th>Descripción de Departamento</th>
                                                <th>Tipo</th>
                                                <th style="width:100px">Estado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Col -->
                    </div>
                </div>
            </section>
            <!-- Main content -->
        </div>
        <!-- Content Wrapper. Contains page content -->
        
        <!-- Form Modal Registro Departamento -->
        <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="padding: 0.2rem">
                        <h5 class="modal-title" id="exampleModalFormTitle" style="padding: 0.7rem">Registro de Departamento</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="font-size: 2rem">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="modalFormPlanilla">
                            <div class="row">
                                <div class="col-md-2 col-sm-12  form-group ">
                                    <label class="col-form-label">ID</label>
                                </div>
                                <div class="col-md-4 col-sm-12  form-group">
                                    <input type="text" placeholder="" class="form-control" disabled id="idundorganizacional">
                                </div>

                                <div class="col-md-2 col-sm-12  form-group">
                                    <label class="col-form-label  ">Estado</label>
                                </div>
                                <div class="col-md-4 col-sm-12  form-group">
                                    <select id="estado" name="estado" class="custom-select">
                                    <option value="0">Activo</option>
                                    <option value="1">Inactivo</option>
                                    </select>
                                </div>

                                <div class="col-md-2 col-sm-12  form-group">
                                    <label class="col-form-label">Tipo</label>
                                </div>
                                <div class="col-md-10 col-sm-12  form-group">
                                    <select id="tipo" name="tipo" class="custom-select">
                                    <option value="0">Unidad Orgánica</option>
                                    <option value="1">Unidad Funcional</option>
                                    </select>
                                </div> 

                                <div class="col-md-2 col-sm-12  form-group">
                                    <label class="col-form-label  ">Descripción</label>
                                </div>
                                <div class="col-md-10 col-sm-12  form-group">
                                    <input style="text-align: center; text-transform: uppercase;" placeholder="" id="descripcion" name="descripcion" class="form-control">
                                </div>
                            </div>

                            <div class="ln_solid"></div>

                            <div class="item form-group">
                                <div class="col-md-12 col-sm-12  offset-md-5">
                                    <button type="button" class="btn btn-primary " onclick="limpiarModal()"><i class="fa fa-file"></i> Nuevo</button>
                                    <button type="submit" class="btn btn-success "><i class="fa fa-save"></i> Guardar</button>
                                </div>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Form Modal Registro Departamento -->

        <!-- Footer -->
        <footer class="main-footer">

            <div class="float-right d-none d-sm-block"><strong>Version</strong> 1.0.0</div>
            <strong> Developed by<a href="#"> JD - TI</a>.</strong>

        </footer>
        <!-- Footer -->
            
        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->

            <!-- Control sidebar content goes here -->
        </aside>
        <!-- Control Sidebar -->

    </div>
    <!-- Site wrapper -->
            
    <!-- jQuery -->
    <script src="../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables  & Plugins -->
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="../plugins/jszip/jszip.min.js"></script>
    <script src="../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <!-- Select2 -->
    <script src="../plugins/select2/js/select2.full.min.js"></script>
    <!-- Bootstrap4 Duallistbox -->
    <script src="../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- InputMask -->
    <script src="../plugins/moment/moment.min.js"></script>
    <script src="../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
    <!-- date-range-picker -->
    <script src="../plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Bootstrap Switch -->
    <script src="../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
    <!-- SweetAlert2  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/app.js"></script>
    <!-- <script src="../dist/js/bundle.a.js"></script>     -->
    <script src="../dist/js/bundleDepartamento.js"></script>
    <script src="../plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="../plugins/jquery-validation/additional-methods.min.js"></script>
    <script>
        //Date range picker
        $("#reservationdate").datetimepicker({
            format: "DD/MM/YYYY HH:mm",
        });

        $("#timepicker").datetimepicker({
            format: "HH:mm",
        });
    
        $("#idimagenuser").prop('src', g_avatar);
        $("#idmenu").empty();
        $("#nombreuser").text(localStorage.nombres);

        $(function() {
            $.validator.setDefaults({
                submitHandler: function() {
                    registrarDepartamento();
                }
            });

            $('#modalFormPlanilla').validate({
                rules: {
                    descripcion: {
                        required: true
                    }
                },
                messages: {
                    descripcion: {
                        required: "Ingrese una descripción válida"
                    }
                },
                errorElement: 'span',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });

        $(document).on("click", "#logout", function () {
            Swal.fire({
            title: '¿Quieres cerrar sesión?',
            text: "Los cambios que no has guardado se perderán.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cerrar sesión',
            cancelButtonText: 'No, cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    localStorage.removeItem("nombres");
                    localStorage.removeItem("avatar");
                    localStorage.removeItem("idtransaccion");
                    localStorage.removeItem("profile");
                    // document.location.href = localStorage.url + "calendar/";
                    Swal.fire(
                        '¡Sesión Cerrada!',
                        'Tu sesión ha sido cerrada correctamente.',
                        'success'
                        )
                    setTimeout(() => {
                        location.reload();
                    }, 800);
                }
            })
        });
    </script>
</body>

</html>