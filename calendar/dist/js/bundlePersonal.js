var tabla;
var g_datares;
var n_contador = 0;
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

function listadoPersonal() {
  var dat = JSON.stringify({
    proceso: 1,
    p1: 1,
    p2: 1,
    p3: 1,
    p4: 1,
    p5: 1,
  });
  $("#example1 tbody").empty();

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/personal.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        _datares.forEach((elemento, indice) => {
          if (elemento.estado == "ACTIVO") {
            $("#example1 tbody").append(
              "<tr>" +
                '<td><span class="badge bg-secondary text-dark" style="width: 100%;">' +
                elemento.idpersona +
                "</td>" +
                '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoPersonalId(' +
                elemento.idplaza +
                ')">' +
                elemento.idplaza +
                "</span></td>" +
                "<td>" +
                elemento.nombrecompleto +
                "</td>" +
                "<td>" +
                elemento.gruporiesgo +
                "</td>" +
                // '<td><span class="badge bg-success text-dark" style="width: 100%;">' +
                // elemento.estado +
                // "</td>" +
                "</tr>"
            );
          } else {
            $("#example1 tbody").append(
              "<tr>" +
                "<td>" +
                elemento.idpersona +
                "</td>" +
                '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoPersonalId(' +
                elemento.idplaza +
                ')">' +
                elemento.idplaza +
                "</span></td>" +
                "<td>" +
                elemento.nombrecompleto +
                "</td>" +
                "<td>" +
                elemento.gruporiesgo +
                "</td>" +
                // '<td><span class="badge bg-danger" style="width: 100%;">' +
                // elemento.estado +
                // "</td>" +
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

 

function listadoPersonalId(idPersonal) {
  var dat = JSON.stringify({
    proceso: 2,
    p1: idPersonal,
    p2: 2,
    p3: 1,
    p4: 1,
    p5: 1,
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/personal.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        // '<td><span class="badge bg-info text-dark">' + elemento.idplaza + "</span></td>" +
        // console.log(r.dataResult);
        $("#exampleModalForm").modal("show");
        _datares.forEach((elemento, indice) => {
          $("#idplaza").val(elemento.idplaza);
          $("#tipoplaza").val(elemento.tipoplaza);
          $("#apellidopaterno").val(elemento.apellidopaterno);
          $("#apellidomaterno").val(elemento.apellidomaterno);
          $("#nombreprimer").val(elemento.primernombre);
          $("#nombresegundo").val(elemento.segundonombre);
          $("#tipodocumento").val(elemento.tipodocumento);
          $("#numerodoc").val(elemento.nrodocumento);
          $("#fecnac").val(elemento.fechanacimiento);
          $("#genero").val(elemento.idsexo);
          $("#estadocivil").val(elemento.idestadocivil);
          $("#numeroruc").val(elemento.ruc);
          $("#direccion").val(elemento.direccion);
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

function limpiarModal() {
  $("#idplaza").val("");
  $("#tipoplaza").val("");
  $("#apellidopaterno").val("");
  $("#apellidomaterno").val("");
  $("#nombreprimer").val("");
  $("#nombresegundo").val("");
  $("#tipodocumento").val("");
  $("#numerodoc").val("");
  $("#fecnac").val("");
  $("#genero").val("");
  $("#estadocivil").val("");
  $("#numeroruc").val("");
  $("#direccion").val("");
}

listadoPersonal();
cargarMenu();


function registrarPersonal() {

  	if(isNaN($("#numerodoc").val())){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese un Número de Documento válido"
		});
		return;
	}
  
  if(isNaN($("#numeroruc").val())){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese un Número de RUC válido"
		});
		return;
	}
  
  if(isNaN($("#idplaza").val())){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese una plaza válida"
		});
		return;
	}

  	var dat = JSON.stringify({
 
    id: $("#idplaza").val(),
    tp: $("#tipoplaza").val(),
    ap: $("#apellidopaterno").val().toUpperCase(),
    am: $("#apellidomaterno").val().toUpperCase(),
    p1: $("#nombreprimer").val().toUpperCase(),
    p2: $("#nombresegundo").val().toUpperCase(),
    td: $("#tipodocumento").val(),
    nd: $("#numerodoc").val(),
    nf: $("#fecnac").val(),
    sex: $("#genero").val(),
    ec: $("#estadocivil").val(),
    dd: $("#direccion").val().toUpperCase(),
    ur: $("#numeroruc").val(),
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/registropersonal.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        msgbox("Los datos se registraron correctamente.");
        listadoPersonal();
        location.reload();
        $("#exampleModalForm").modal("hide");

      }  else {
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
  