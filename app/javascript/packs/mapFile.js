document.addEventListener("turbolinks:load", function() {

    var map = new GMaps({
        div: '#map',
        lat: 51.509865,
        lng: -0.118092
    });
    window.map = map;

    var markers = JSON.parse(document.querySelector("#map").dataset.transactions);
    window.markers = markers;

    var bounds = new google.maps.LatLngBounds();

    markers.forEach(function(transaction) {
      if (transaction.latitude && transaction.longitude) {
        var marker = map.addMarker({
          lat: transaction.latitude,
          lng: transaction.longitude,
          title: transaction.address,
          infoWindow: {
            content: `<h5>${transaction.name}</h5>
                      <p>${transaction.address}</p><br />
                      <a href='${transaction.website}' class="btn btn_dark" style="margin-right: 1rem;" target="_blank">Visit Website</a>
                      <a href='${transaction.tickets}' class="btn btn_highlight" style="margin-right: 1rem;" target="_blank">Buy Tickets</a>
                      <a href='${transaction.navigation}' class="btn btn_dark" target="_blank">Navigate Me</a>`
          }
        });

        bounds.extend(marker.position);
      }
    });

    map.fitBounds(bounds);
});