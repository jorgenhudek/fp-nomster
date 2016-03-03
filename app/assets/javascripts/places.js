// This is the callback function used by the Google Maps script below
function initMap() {
	var mapDiv = document.getElementById('map');

	var myLatLng = {lat: parseFloat(mapDiv.dataset.latitude), lng: parseFloat(mapDiv.dataset.longitude)};

    var map = new google.maps.Map(mapDiv, {
	    zoom: 15,
	    center: myLatLng
    });

    var marker = new google.maps.Marker({
		position: myLatLng,
		map: map,
    });
}

// Call the Google Maps API when the page has finished loading via Turbolinks and the view has a map
$(document).on("page:change", function() {
	if ($("#map").length > 0) {
		$.getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyBRTbj1_EjjM29hykn5ZXfGVsvfSAtCgDo&signed_in=true&callback=initMap")
	}
});