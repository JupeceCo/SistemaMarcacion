var tabla;
var g_datares;
var g_periodo = 2021;
let dias = ["Dom", "Lun", "Mar", "Mie", "Juv", "Vie", "Sab"];
var date = new Date();
var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);
$("#idmes").val(String(ultimoDia.getMonth() + 1).padStart(2, "0"));

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
function listadoPerfil() {
  var dat = JSON.stringify({
    proceso: 1,
    p1: 1,
    p2: 1,
    p3: 1,
    p4: 1,
    p5: 1,
    p6: 1,
    p7: 1,
  });
  $("#example1 tbody").empty();

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/perfil.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        // '<td><span class="badge bg-info text-dark">' + elemento.idplaza + "</span></td>" +
        _datares.forEach((elemento, indice) => {
          if (elemento.estado == "ACTIVO") {
            $("#example1 tbody").append(
              "<tr>" +
                '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoPerfilId(' +
                elemento.id +
                ')">' +
                elemento.id +
                "</span></td>" +
                "<td>" +
                elemento.perfil +
                "</td>" +
                "<td>" +
                elemento.nombres +
                "</td>" +
                '<td><span class="badge bg-success text-dark" style="width: 100%;">' +
                elemento.estado +
                "</td>" +
                "</tr>"
            );
          } else {
            $("#example1 tbody").append(
              "<tr>" +
               '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoPerfilId(' +
                elemento.id +
                ')">' +
                elemento.id +
                "</span></td>" +
                "<td>" +
                elemento.perfil +
                "</td>" +
                "<td>" +
                elemento.nombres +
                "</td>" +
                '<td><span class="badge bg-danger text-dark" style="width: 100%;">' +
                elemento.estado +
                "</td>" +
                "</tr>"
            );
          }
        });
          listar();
      } else {
        msgboxerror("Error...", r.mensaje);
      }
    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
}



function listadoPerfilId(idusuario) {
  var dat = JSON.stringify({
    proceso: 2,
    p1: idusuario,
    p2: 2,
    p3: 1,
    p4: 1,
    p5: 1,
    p6: 1,
    p7: 1,
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/perfil.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        // '<td><span class="badge bg-info text-dark">' + elemento.idplaza + "</span></td>" +
        //console.log(r.dataResult);
        $("#exampleModalForm").modal("show");
        _datares.forEach((elemento, indice) => {
          $("#idusuario").val(elemento.id);
          $("#nombres").val(elemento.nombres);
          $("#perfil").val(elemento.perfil);
          $("#dni").val(elemento.dni);
          $("#contraseña").val(elemento.clave);
          $("#foto").val(elemento.foto);
          $("#estado").val(elemento.estado);
          $(".select2").select2();
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

// listadoDepartamentos();

// function listadoDepartamentos() {
//   var dat = JSON.stringify({
//     proceso: 1,
//     p1: 1,
//     p2: 2,
//     p3: 1,
//     p4: 1,
//     p5: 1,
//   });

//   $("#cmbdepartamento option").remove();

//   $.ajax({
//     data: dat,
//     url: g_url + "apicalendar/api/listascombo.php",
//     type: "POST",
//     dataType: "json",
//     contentType: "application/json",
//     processData: false,
//     success: function (r) {
//       if (r.success == true) {
//         let _datares = r.dataResult;
//         _datares.forEach((elemento, indice) => {
//           if (indice == 0) {
//             $("#cmbdepartamento").append(
//               '<option value="' +
//                 elemento.id +
//                 '" selected="selected">' +
//                 elemento.descripcion +
//                 "</option>"
//             );
//           } else {
//             $("#cmbdepartamento").append(
//               '<option value="' +
//                 elemento.id +
//                 '" >' +
//                 elemento.descripcion +
//                 "</option>"
//             );
//           }
//         });
//       } else {
//         alert("Ocurrio un error en el servidor .." + r.mensaje);
//       }
//     },
//     error: function () {
//       alert("Ocurrio un error en el servidor ..");
//     },
//   });
// }

function getperfil(){
        var dat = JSON.stringify({
    proceso: 11,
    p1: 1,
    p2: 2,
    p3: 3,
    p4: 4,
    p5: 5,
    p6: 6,
    p7: 7,
  });
    $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/listascombo.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
                //console.log(r);

          $('#perfil').prepend("<option value>Selecciona un Perfil</option>");
            $.each(r.dataResult, function(index, item) {
                $('#perfil').append($('<option />', {
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

function limpiarModal() {
  $("#idusuario").val("");
  $("#nombres").val("");
  $("#perfil").val('').trigger('change');
  $("#dni").val("");
  $("#contraseña").val("");
  //$("#foto").val("");
  $("#estado").val("1");
}

listadoPerfil();
cargarMenu();
getperfil();
$(".select2").select2();

function registrarPerfil() {

  if(isNaN($("#dni").val())){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese un DNI válido"
		});
		return;
	}

  var dat = JSON.stringify({
    proceso: 3,
    p1: $("#idusuario").val(),
    p2: $("#dni").val(),
    p3: $("#contraseña").val().toUpperCase(),
    p4: $("#nombres").val().toUpperCase(),
    p5: $("#estado").val(),
    p6: $("#perfil").val(),
    p7: $("#foto").val(),
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/perfil.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        msgbox("Los datos se registraron correctamente.");
        listadoPerfil();
        setTimeout(() => {
          location.reload();
        }, 1000);
        $("#exampleModalForm").modal("hide");
      } else {
        msgboxerror("Error...", r.mensaje);
      }
    },

    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
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
    tabla = $('#example1').dataTable({
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
        "iDisplayLength": 8, //paginacion
        "order": [
        [0, "desc"]
        ] //ordenar (columna, orden)
      }).DataTable();
  }
  