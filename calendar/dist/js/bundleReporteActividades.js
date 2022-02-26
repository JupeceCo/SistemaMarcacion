var tabla;
var g_datares;
var date = new Date();
var g_periodo = date.getFullYear();
let dias = ["Dom", "Lun", "Mar", "Mie", "Juv", "Vie", "Sab"];
var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);
$("#idmes").val(String(ultimoDia.getMonth() + 1).padStart(2, "0"));
//listadoReporteActividad();
listadoDepartamentos();
cargarMenu();
//listar();
$(".select2").select2();

function cargarMenu() {
  var dat = JSON.stringify({
    idtransaccion: g_idtransaccion,
    dcode: 1,
  });
  $("#idimagenuser").prop("src", g_avatar);
  $("#idmenu").empty();
  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/menu.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        _datares.forEach((elemento, indice) => {
          $("#idmenu").append(elemento.etiqueta);
        });
      } else {
        msgboxerror("Error...", r.mensaje);
      }
    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
}

function listadoDepartamentos() {
  var dat = JSON.stringify({
    proceso: 1,
    p1: 1,
    p2: 2,
    p3: 1,
    p4: 1,
    p5: 1,
  });

  // $("#cmbdepartamento option").remove();

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/listascombo.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {  
      // console.log(r);

      $('#cmbdepartamento').prepend("<option value>Selecciona Departamento</option>");
      $.each(r.dataResult, function(index, item) {
        $('#cmbdepartamento').append($('<option />', {
          text: item.descripcion,
          value: item.id
        }));
      });
      $(".select2").select2();

    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
}

function consultaReporteActividad() {

  if($("#cmbdepartamento").val() == ""){
    msgboxerror("Seleccione un departamento...");
    return;
  }

  var dat = JSON.stringify({
    proceso: 6,
    p1: $("#cmbdepartamento").val(),
    p2: "0",
    p3: "0",
    p4: "0",
    p5: $("#idmes").val(),
  });
  const departamento = $("#cmbdepartamento option:selected").text();
  // console.log(departamento);
  $("#example2 tbody").empty();
  var profile = localStorage.getItem("profile");
  // console.log(profile);
    // console.log(dat); 
  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/reporte.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      // console.log(r)
      if (r.success == true) {
        // console.log(r.dataResult.length);
        if (r.registros.length >= 1) {
          let _datares = r.registros;
          // console.log(_datares)
          _datares.forEach((elemento, indice) => {
        
            if (elemento.idestado1 == 0) {
            var boton1= `<button type="button" id="boton-validar" class="btn btn-warning"  >Por validar</button>`;
            }else if (elemento.idestado1 == 1) {
             var boton1= `<button type="button" class="btn btn-success">Terminado</button>`;
            }else if (elemento.idestado1 == 2) {
             var boton1= `<button type="button" class="btn btn-danger">Incompleto</button>`;
            }
            
            if( profile == "5") {
              var boton= `<button type="button" class="btn btn-warning">Validación del administrador</button>`;
            } else {
              if (elemento.idestado == 0 ) {
                var boton= `<button type="button" id="boton-validar" class="btn btn-warning"  >Por validar</button>`;
                }else if (elemento.idestado == 1) {
                 var boton= `<button type="button" class="btn btn-success">Conforme</button>`;
                }else if (elemento.idestado == 2) {
                 var boton= `<button type="button" class="btn btn-danger">No conforme</button>`;
                }
              }                   
              
              
              $("#example2 tbody").append("<tr>" +
              "<td>" +
              elemento.nrodocumento +
              "</td>" +
              "<td>" +
              elemento.nombrecompleto +
              "</td>" +
              "<td>" +
              elemento.puesto +
              "</td>" +
              "<td>" +
              elemento.actividades +
              "</td>" +
              "<td>" +
              elemento.dia +
              "</td>" +
              "<td>" +
              elemento.mes +
              "</td>" +
              "<td>" +boton1+
              "</td>" +
               "<td>" +boton+
              "</td>" +
              "</tr>");
            
          });
          listar();

        } else {
          msgboxerror(`No se encontraron registros de actividades en ${departamento}`);
        }
      } else {
        msgboxerror("Error...", r.mensaje);
      }
    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
}

function limpiar(){
 location.reload();
}

var msgbox = (Titulo, Mensaje) => {
  Swal.fire({
    icon: "success",
    title: Titulo,
    text: Mensaje,
    showConfirmButton: false,
    timer: 1500,
  });
};

var msgboxerror = (Titulo, Mensaje) => {
  Swal.fire({
    icon: "error",
    title: Titulo,
    text: Mensaje,
    showConfirmButton: false,
    timer: 1500,
  });
};

function listar() {
  tabla = $('#example2').dataTable({
    language: {
      zeroRecords: "No se encontraron resultados",
      sSearch: "Buscar:",
      info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      oPaginate: {
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      
    },
        "aProcessing": true, //activamos el procedimiento del datatable
        "aServerSide": true, //paginacion y filrado realizados por el server
        dom: 'Bfrtip', //definimos los elementos del control de la tabla
       //buttons: ['copyHtml5', 'excelHtml5', 'pdf', 'print'],
       buttons: [{
        text: '<i class="fas fa-file-excel"></i> ',
        extend: 'excelHtml5',
        titleAttr: "Exportar a Excel",
        className: "btn btn-success",
      }, 
      {
        text: '<i class="fas fa-file-csv"></i>',
        extend:   'csvHtml5',
        titleAttr: "Exportar a CSV",
        className: "btn btn-secondary",

      },
      {
        text: '<i class="fas fa-file-pdf"></i>',
        extend: 'pdf',
        titleAttr: "Exportar a PDF",
        className: "btn btn-danger",

      },
      {
        text: '<i class="fa fa-print"></i> ',
        extend: 'print',
        titleAttr: "Imprimir",
        className: "btn btn-info",

      },      
      ],
      "bDestroy": true,
        "iDisplayLength": 10, //paginacion
        "order": [
        [4, "asc"]
        ] //ordenar (columna, orden)
      });
      const botones = document.querySelectorAll("#boton-validar");
      botones.forEach((boton, i) =>{
        boton.addEventListener("click", ()=>{
            msgboxerror("Prohibido", "La validación debe ser realizada en la sección de reporte de actividad");
        });
      });
      
}
