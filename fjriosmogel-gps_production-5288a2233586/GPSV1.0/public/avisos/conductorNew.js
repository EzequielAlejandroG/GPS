var datosFormulario; //lo que se va a enviar
var nom;
var ape;
var curp;
var dir;
var cat;
var bas;
var lis;
var tip;
var exp;
var vig;
var nac;
var seg;
var fec;
$(function(){

	$("input:submit").click(function() {
		datosFormulario= $('#formNew');
		nom= document.getElementById('nom').value;
		ape= document.getElementById('ape').value;
		curp= document.getElementById('curp').value;
		dir= document.getElementById('dir').value;
		cat= document.getElementById('cat').value;
		bas= document.getElementById('bas').value;
		lis= document.getElementById('lis').value;
		tip= document.getElementById('tip').value;
		exp= document.getElementById('exp').value;
		vig= document.getElementById('vig').value;
		nac= document.getElementById('nac').value;
		seg= document.getElementById('seg').value;
		fec= document.getElementById('fec').value; 
		if(curp== "" ||  seg== ""){
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
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>operador ya existe!.</div>");
	        break;
	    case 2:
	        $("#aviso").html("<div class='alert alert-danger alert-dismissable'><button type='button' class='close'"
		 	+"data-dismiss='alert' aria-hidden='true'>&times;</button>Todos los campos son necesarios!</div>");
	        break;	
	}
}
function obtenerMensaje() {
	$.ajax({
        url: '/conductores/new',
        type: 'POST',
        data: datosFormulario.serialize(),
        success : function(data) {
        	var arreglo=Object.values(data);
        	if(arreglo[1]==3) window.location.replace("/conductores");
            mostrarAviso(arreglo[1]);
        }
    });
}