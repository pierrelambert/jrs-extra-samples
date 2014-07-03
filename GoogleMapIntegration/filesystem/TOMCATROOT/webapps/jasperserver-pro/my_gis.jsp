<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px }
  #map_canvas { height: 100% }
</style>
<script type="text/javascript"
    src="https://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">
function replaceURL(param)
    {
              var url = "https://192.168.113.143/jasperserver-pro/flow.html?_flowId=viewReportFlow&reportUnit=%2Fpublic%2FSESamples%2FGoogleMapIntegration%2Ffoodstore&viewAsDashboardFrame=true&Store_name="+param;

           
var frame = document.getElementById("report");
       if(frame == null)
               frame = window.report;
       
       frame.src = url;
           }



var stores = [
['Alameda',37.765278, -122.240556],
['Los Angeles',34.052222, -118.242778],
['San Diego',32.715278, -117.156389],
['San Francisco',37.775000, -122.418333],
['Beverly Hills',34.073611, -118.399444],
['Portland',45.523611, -122.675000],
['Salem',44.943056, -123.033889],
['Bellingham',48.759722,-122.486944],
['Bremerton',47.567500,-122.631389],
['Seattle',47.606389, -122.330833],
['Spokane',47.658889,-117.425000],
['Tacoma',47.253056,-122.443056],
['Walla Walla',46.064722,-118.341944],
['Yakima',46.602222,-120.504722]
];

function setMarkers(map, locations) {

  var image = new google.maps.MarkerImage('images/map_icon.gif',
      new google.maps.Size(31, 28),
      new google.maps.Point(0,0),
      new google.maps.Point(0, 28));
  
      var shape = {
      coord: [1, 1, 1, 28, 31, 28, 31 , 1],
      type: 'poly'
  };
   
  for (var i = 0; i < locations.length; i++) {
    var store = locations[i];
    var state = store[0];
    var myLatLng = new google.maps.LatLng(store[1], store[2]);
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image,
        shape: shape,
        title: store[0],
        zIndex: i+1,
    });
    

		createlink(marker,state);
}
 
}

//create the link
		function createlink(marker,state)
		{
		google.maps.event.addListener(marker, 'click', function() {replaceURL(state);});
		}

function initialize() {
  var myOptions = {
    zoom: 5,
    center: new google.maps.LatLng(41.7, -122.4),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);

  setMarkers(map, stores);
}



</script>

<title>MyJSGIS Script v0.1</title>
</head>
<body onload="initialize()">
<body style="margin:0px; padding:0px;" onload="initialize()"> 
    <div id="map_canvas" style="width: 500px; height: 530px"></div> 



<iframe name="report" id="report" align="right" src="https://192.168.113.143/jasperserver-pro/flow.html?_flowId=dashboardRuntimeFlow&dashboardResource=%2Fpublic%2FSESamples%2FGoogleMapIntegration%2FGIS_START&viewAsDashboardFrame=true" width="750px" height="530px" style="position:absolute; top:0px; left:502px">  </iframe>

</body>
</html>
