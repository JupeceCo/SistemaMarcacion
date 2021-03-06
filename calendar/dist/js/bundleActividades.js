var tabla;
var g_datares;
var g_periodo = 2021;
let dias = ["Dom", "Lun", "Mar", "Mie", "Juv", "Vie", "Sab"];
var date = new Date();
var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);
$("#idmes").val(String(ultimoDia.getMonth() + 1).padStart(2, "0"));


function cargarMenu(){
var dat = JSON.stringify({
  idtransaccion: g_idtransaccion,
  dcode: 1,
});
$("#idimagenuser").prop('src', g_avatar);
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
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    }
  },
  error: function () {
    msgboxerror("Error...", "Ocurrió un error en el servidor...");
  },
});
}

function listadoActividades() {
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
    url: g_url + "apicalendar/api/actividades.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        let _datares = r.dataResult;
        // '<td><span class="badge bg-info text-dark">' + elemento.idplaza + "</span></td>" +
        _datares.forEach((elemento, indice) => {
          if(elemento.estado=="ACTIVO"){
            $("#example1 tbody").append(
              "<tr>" +
              '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoActividadesId('+ elemento.id+ ')">' + elemento.id + "</span></td>" +
              "<td>" + elemento.descripcion + "</td>" +
              "<td>" + elemento.servicio + "</td>" +
              '<td><span class="badge bg-success text-dark" style="width: 100%;">' + elemento.estado + "</td>" +
              "</tr>"
            );
          }else{
            $("#example1 tbody").append(
              "<tr>" +
              '<td><span class="badge bg-primary" style="width: 100%;" onclick="listadoActividadesId('+ elemento.id+ ')">' + elemento.id + "</span></td>" +
              "<td>" + elemento.descripcion + "</td>" +
              "<td>" + elemento.servicio + "</td>" +
              '<td><span class="badge bg-danger" style="width: 100%;">' + elemento.estado + "</td>" +
              "</tr>"
            );
          }
          
        });
     
        listar();
      } else {
        msgboxerror("Error...", "Ocurrió un error en el servidor...");
      }
    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });

}

function listadoActividadesId(idactividades){
  var dat = JSON.stringify({
    proceso: 2,
    p1: idactividades,
    p2: 2,
    p3: 1,
    p4: 1,
    p5: 1,
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/actividades.php",
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
         
          $("#idactividades").val(elemento.id);
          $("#descripcion").val(elemento.descripcion);
          $("#servicio").val(elemento.servicio);
          $("#estado").val(elemento.estado);
           $(".select2").select2();
        });
      
       
      } else {
        msgboxerror("Error...", "Ocurrió un error en el servidor...");
      }
    },
    error: function () {
      msgboxerror("Error...", "Ocurrió un error en el servidor...");
    },
  });
}

function getPuesto(){
        var dat = JSON.stringify({
    proceso: 5,
    p1: 1,
    p2: 2,
    p3: 3,
    p4: 4,
    p5: 5,
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

          $('#servicio').prepend("<option value>Selecciona el Servicio</option>");
            $.each(r.dataResult, function(index, item) {
                $('#servicio').append($('<option />', {
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

function limpiarModal(){
  $("#idactividades").val("");
  $("#descripcion").val("");
  $("#servicio").val('').trigger('change');
  $("#estado").val("0");
 
}

listadoActividades();
cargarMenu();
getPuesto();
 $(".select2").select2();

  function registrarActividades()
{
 
  var dat = JSON.stringify({
    proceso: 3,
    p1: $("#idactividades").val(), 
    p2: $("#servicio").val(),
    p3: $("#descripcion").val().toUpperCase(), 
    p4: $("#estado").val(), 
    p5: 0,
    
  });

    $.ajax({
      data: dat,
      url: g_url + "apicalendar/api/actividades.php",
      type: "POST",
      dataType: "json",
      contentType: "application/json",
      processData: false,
      success: function (r) {
        if (r.success == true) {     
          msgbox("Se registraron los datos correctamente");
          listadoActividades();
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
      timer: 1700,
    });
  };
  
  var msgboxerror = (Titulo, Mensaje) => {
    Swal.fire({
      icon: 'error',
      title: Titulo,
      text: Mensaje,
      showConfirmButton: false,
      timer: 1700  
    })
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
  
