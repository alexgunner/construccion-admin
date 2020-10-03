// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min
//= require jquery.scrollUp.min
//= require price-range
//= require jquery.prettyPhoto
//= require main
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: -17.3821173, lng: -66.2065017};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map, title: "Estoy aquí"});

  infoWindow = new google.maps.InfoWindow();

  // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };
          infoWindow.setPosition(pos);
          infoWindow.open(map);
          
          var marker2 = new google.maps.Marker({position: pos, map: map, draggable: true, title: "Estoy aquí"});
          map.setCenter(pos);

          google.maps.event.addListener(marker2, 'dragend', function (evt) {
              document.getElementById('current').innerHTML = '<p>Las coordenadas son: ' + evt.latLng.lat().toFixed(3) + ', ' + evt.latLng.lng().toFixed(3) + '</p>';
          });

          google.maps.event.addListener(marker2, 'dragstart', function (evt) {
              document.getElementById('current').innerHTML = '<p>Buscando.....</p>';
          });
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(
      browserHasGeolocation
        ? "Error: The Geolocation service failed."
        : "Error: Your browser doesn't support geolocation."
    );
    infoWindow.open(map);
}


function get_values() {
	var name = document.getElementById("name").value;
	var lastname = document.getElementById("lastname").value;
	var phone = document.getElementById("phone").value;
	var nit = document.getElementById("nit").value;
	var departament = document.getElementById("departament").value;
	var city = document.getElementById("city").value;
	var reference = document.getElementById("reference").value;

	var span = document.getElementById("name_pay"); 
	span.textContent = name + " " + lastname;

	var span = document.getElementById("phone_pay"); 
	span.textContent = phone;

	var span = document.getElementById("nit_pay"); 
	span.textContent = nit;
}

function show_online_payment() {
	var deposit_info = document.getElementById("deposit_info");
	var online_payment = document.getElementById("online_payment");

	if (deposit_info.style.display === "none") {
		deposit_info.style.display = "block";
		online_payment.style.display = "none";
	} else {
		deposit_info.style.display = "none";
		online_payment.style.display = "block";
	}
}
