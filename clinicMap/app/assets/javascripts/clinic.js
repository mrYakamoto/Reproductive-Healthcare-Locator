$('document').ready(function(){
  initMap();
});


function initMap(clinicObj){
  var customMapType = new google.maps.StyledMapType([
  {
    stylers: [
    {hue: '#890000'},
    {visibility: 'simplified'},
    {gamma: 0.5},
    {weight: 0.5}
    ]
  },
  {
    elementType: 'labels',
    stylers: [{visibility: 'off'}]
  },
  {
    featureType: 'water',
    stylers: [{color: '#890000'}]
  }
  ], {
    name: 'Custom Style'
  });
  var customMapTypeId = 'custom_style';

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: new google.maps.LatLng(37.09024, -95.712891),
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
    }
  });

  map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);


  loadFromDB();

  // var image = 'http://i65.tinypic.com/c3ktf.jpg';

  function createMarker(clinicObj){
    var clinicLoc = { lat: clinicObj.lat, lng: clinicObj.lng };
    var marker = new google.maps.Marker({
      position: clinicLoc,
      map: map,
      // animation: google.maps.Animation.DROP,
      title: clinicObj.name,
      // icon: image
    });
  }


// function to retrieve geolocation data from already formed DB
  function loadFromDB(){
    $.get("/", function(response){
      var arrayClinicObjects = response;
      var clinicCount = arrayClinicObjects.length;

      for (var i=1; i < arrayClinicObjects.length; i++){
        arrayClinicObjects[i].lat = parseFloat(arrayClinicObjects[i].lat)
        arrayClinicObjects[i].lng = parseFloat(arrayClinicObjects[i].lng)

        createMarker(arrayClinicObjects[i]);
      }
    })
  }

}
