var locations = [];


const $latitude = 17.99,
		  $longitude = -102.16,
		  $map_zoom = 5;

const map_options = {
      	center: new google.maps.LatLng($latitude, $longitude),
      	zoom: $map_zoom,
      	panControl: false,
      	mapTypeControl: false,
      	streetViewControl: false,
      	mapTypeId: google.maps.MapTypeId.ROADMAP,
      	scrollwheel: false,
    }
	const map = new google.maps.Map(document.getElementById('map'), map_options);
	//add a custom marker to the map
	/*const marker = new google.maps.Marker({
	  	position: new google.maps.LatLng($latitude, $longitude),
	    map: map,
	    visible: true,
	});*/

	var infowindow = new google.maps.InfoWindow();

	var marker, i;

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
					//alert(this.responseText);
					var objJSON=JSON.parse(this.responseText);
					for (i in objJSON) {
						var idVehiculo=objJSON[i].idVehiculo;
						console.log("idVehiculo:"+objJSON[i].idVehiculo)
						var geo = objJSON[i].geoPunto.split(",");
						var geoX=geo[0];
						var geoY=geo[1];
						console.log("geoX"+geoX);
						locations.push([idVehiculo, geoX, geoY, i]);
					}
					for (i = 0; i < locations.length; i++) {
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(locations[i][1], locations[i][2]),
							map: map
						});
				
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
							return function() {
								infowindow.setContent(locations[i][0]);
								infowindow.open(map, marker);
							}
						})(marker, i));
					}
					console.log("locations:"+locations);
			}if(this.status == 400){
					alert("Error:"+this.responseText);
			}
};
xhttp.open("POST", "https://b2b-encontrack.com/api/rest/get/", true);
xhttp.setRequestHeader("Content-type", "application/json");
var credentials = JSON.stringify({"username":"T3L2TGNTW6DX39USCNFQ7I","password":"key_7hU4yfwLKebtQFTR4JD58"});
xhttp.send(credentials);


	
