var map;
var lat, lon, lat1, lon1,url;
var markers = [];
var iterator = 0;
var mapZoom;
var geocoder;
var startLocation;
var infoWindow = new google.maps.InfoWindow;
var dist;
function load() {
    initialize();
    map = new google.maps.Map(document.getElementById("map"), {
        center: new google.maps.LatLng(37.8575071562503,-102.041015625),
        zoom: 2,
        mapTypeId: 'roadmap'
    });
    map.enableKeyDragZoom();
    var dz = map.getDragZoomObject();

    //--resize map and set center when window resize
    google.maps.event.addDomListener(window, "resize", function() {
        var center = map.getCenter();
        google.maps.event.trigger(map, "resize");
        map.setCenter(center); 
    });

    google.maps.event.addListener(map, 'click', function(event) {
        mapZoom = map.getZoom();
        startLocation = event.latLng;
    });
}
function bindInfoWindow(marker, map, infoWindow, html) {
    google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
        lat1 = marker.getPosition().lat();
        lon1 = marker.getPosition().lng();
        url=html;
        document.getElementById("btn1").click();
    });

}

function drop() {
    for (var i = 0; i < neighborhoods.length; i++) {
            addMarker();
    }
}
function addMarker() {
    var tempHTML = markerHTML[iterator];
    var markerINFO = new google.maps.Marker({
        position: neighborhoods[iterator],
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP
    });
    bindInfoWindow(markerINFO, map, infoWindow, tempHTML);
    markers.push(markerINFO);
    iterator++;
}


function initialize() {
    geocoder = new google.maps.Geocoder();
}

function codeAddress() {
    var address = document.getElementById("address").value;
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
//            $('#lat').val(results[0].geometry.location.lat());
//            $('#lng').val(results[0].geometry.location.lng());
            map.setZoom(15);
            map.setCenter(results[0].geometry.location);
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

function toggleFilter(){
    //set proper classes for display filter/minibar
    if($("#filter-container").hasClass("hidden")){
        $("#filter-container").removeClass("hidden");
        $("button.toggleButton").html("<span class='glyphicon glyphicon-minus'></span>");
        $("div.side-bar").addClass("showFilter");
        $("div.side-bar").removeClass("showMinibar");
 
    }else{
    //    $("#filter-container").removeClass("shown");
        $("#filter-container").addClass("hidden");
        $("button.toggleButton").html("<span class='glyphicon glyphicon-plus'></span>");
        $("div.side-bar").removeClass("showFilter");
        $("div.side-bar").addClass("showMinibar");

    }
    
    $("#filter-container").toggle();    //toggle hide or show filter
    $("#filter-container").css("display","block");

}

//set the height of map, have to specify the size, otherwise its an empty div
$(document).ready(function(){
    $('#google.maps').height($(window).height());
});


function updateSlider(slideAmount, rangeFrom, rangeTo) {
    var miles = document.getElementById("chosen");
//show the amount
    miles.innerHTML=slideAmount;
}