var datosFormulario; //lo que se va a enviar
var raz;
var rfc;
var domf;
var stat;
var user;
$(function(){

	$("input:submit").click(function() {
		datosFormulario= $('#formNew');
		raz = document.getElementById('raz').value;
		rfc = document.getElementById('rfc').value;
		domf = document.getElementById('domf').value;
		stat = document.getElementById('stat').value;
		user = document.getElementById('user').value; 
		if(raz== "" ||  rfc== "" ||  domf== "" ||  stat== ""){
			mostrarAviso(2);
			return false;
		}
		obtenerMensaje();
		return false;
	});

});
function mostrarAviso(error){
	switch(error) {
	    case 1:
	        $("#aviso").html("<div class='alert alert-danger alert-dismissable'><button type='button' class='close'"
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>El cliente ya existe!.</div>");
	        break;
	    case 2:
	        $("#aviso").html("<div class='alert alert-danger alert-dismissable'><button type='button' class='close'"
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>Todos los campos son necesarios!</div>");
	        break;	
	}
}
function obtenerMensaje() {
	$.ajax({
        url: '/customers/new',
        type: 'POST',
        data: datosFormulario.serialize(),
        success : function(data) {
        	var arreglo=Object.values(data);
        	if(arreglo[1]==3) window.location.replace("/customers");
            mostrarAviso(arreglo[1]);
        }
    });
}