var datosFormulario; //lo que se va a enviar
var nom;
var pla;
var user;
$(function(){

	$("input:submit").click(function() {
		datosFormulario= $('#formNew');
		nom= document.getElementById('nom').value;
		pla = document.getElementById('pla').value;
		user = document.getElementById('user').value; 
		if(nom== "" ||  pla== ""){
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
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>Las placas del remolque ya existen!.</div>");
	        break;
	    case 2:
	        $("#aviso").html("<div class='alert alert-danger alert-dismissable'><button type='button' class='close'"
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>Todos los campos son necesarios!</div>");
	        break;	
	}
}
function obtenerMensaje() {
	$.ajax({
        url: '/trailers/new',
        type: 'POST',
        data: datosFormulario.serialize(),
        success : function(data) {
        	var arreglo=Object.values(data);
        	if(arreglo[1]==3) window.location.replace("/trailers");
            mostrarAviso(arreglo[1]);
        }
    });
}