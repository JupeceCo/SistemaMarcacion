$("#btnlogin").click(function () {
  goin();
});

function goin() {
	//Para sacar cuantos se atendieron y los rechazados
	const dni = $("#txtdni").val();
	const password = $("#txtclave").val().toUpperCase();

	if(dni==""){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese un DNI"
		});
		return;
	}

	if(password==""){
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese una contraseña"
		});
		return;
	}

	if(isNaN(dni)){
		//alert("Ingrese un DNI válido")
		Swal.fire({
			icon: 'error',
			title: 'Error...',
			text: "Ingrese un DNI válido"
		});
		return;
	}
	
	var dat = JSON.stringify({
		email: dni,
		password
	});

	$.ajax({
		data: dat,
		url: localStorage.url + "apicalendar/api/login.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		processData: false,
		success: function (response) {
			if (response.success == true) {
				localStorage.idtransaccion = response.idtransaccion;
				localStorage.nombres = response.nombres;
				localStorage.avatar = response.avatar;
				localStorage.profile = response.profile;
				Swal.fire({
					icon: 'success',
					title: 'Bienvenid@ de nuevo',
					text: response.nombres
				});
				//alert(response.mensaje);
				setTimeout(() => {
					document.location.href = localStorage.url + "calendar/pages/principalf.php";
				}, 1000);
			} else {
				Swal.fire({
					icon: 'error',
					title: 'Error...',
					text: response.mensaje
				});
				//alert("Datos Incorrectos: " + response.mensaje);
			}
		},
		error: function () {
			//alert("Ocurrió un error en el servidor...");
			Swal.fire({
				icon: 'error',
				title: 'Error...',
				text: "Ocurrió un error en el servidor"
			});
		},
	});
}