
var g_datares;  
var currentYear = new Date();
var g_periodo = currentYear.getFullYear();
let dias = ["Dom", "Lun", "Mar", "Mie", "Juv", "Vie", "Sab"];
var date = new Date();
var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);
$("#idmes").val(String(ultimoDia.getMonth() + 1).padStart(2, "0"));


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
      // alert("Ocurrio un error en el servidor .." + r.mensaje);
      Swal.fire({
        icon: 'error',
        title: 'Error...',
        text: r.mensaje
      });
    }
  },
  error: function () {
    // alert("Ocurrio un error en el servidor ..listaMenu");
    Swal.fire({
      icon: 'error',
      title: 'Error...',
      text: 'Ocurrió un error en el servidor'
    });
  },
});

// $("#idcheckin").click(function () {
//   una();
// });
// $("#idcheckout").click(function () {
//   dos();
//   location.reload();
// });


listarRegistros();

function listarRegistros() {

  var dat = JSON.stringify({
    proceso: 5,
    p1: 1,
    p2: 1,
    p3: 1,
    p4: 1,
    p5: 1,
  });

  $.ajax({
    data: dat,
    url: g_url + "apicalendar/api/reporte.php",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    processData: false,
    success: function (r) {
      if (r.success == true) {
        // console.log(r);
        //Destructuring
        const {planillas: {totalplanillas}, personal: {totalpersonal}, programaciones: {totalprogramacion}, actividades: {totalactividad}, departamento: {totaldepartamentos}, servicio: {totalservicios}, area: {totalareas}, grupo: {totalgrupos}, puesto: {totalpuestos}, usuario: {totalusuarios}} = r;
        
        $(".info-box-number.programacion").text(totalprogramacion);
        $(".info-box-number.personal").text(totalpersonal);
        $(".info-box-number.planilla").text(totalplanillas);
        $(".info-box-number.actividad").text(totalactividad);
        $(".info-box-number.departamento").text(totaldepartamentos);
        $(".info-box-number.servicio").text(totalservicios);
        $(".info-box-number.area").text(totalareas);
        $(".info-box-number.grupo").text(totalgrupos);
        $(".info-box-number.puesto").text(totalpuestos);
        $(".info-box-number.usuario").text(totalusuarios);

        // console.log(totalplanillas, "/", totalpersonal, "/", totalprogramacion, "/", totalactividad)

      } else {
        Swal.fire({
          icon: 'error',
          title: 'Error...',
          text: r.mensaje
        });
      }
    },
    error: function () {
      Swal.fire({
        icon: 'error',
        title: 'Error...',
        text: 'Ocurrió un error en el servidor'
      });
    },
  });
  
}