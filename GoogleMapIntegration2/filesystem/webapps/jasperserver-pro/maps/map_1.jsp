<!-- Google Map Sample -->
<!-- by Guillaume AUTIER,Jaspersoft -->
<!-- Version 1.1 -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<!-- Here you can change the layout of the page -->
<!-- map represent the location where the map will be displayed -->
<!-- report represent the location where the report or dashboard will be displayed -->

<style type="text/css">
  html { height: 100% }
  
  body { 
  height: 100%;
  margin: 0px;
  padding: 0px 
  }
  
  #map { 
  top: 0px;
  left:0px;
  width: 500px;
  height: 535px;
  scrolling: 0;
  frameborder: 0;
  }
  
  #report {
  top: 0px;
  left: 505px;
  width: 650px; 
  height: 535px;
  position: absolute;  
  }
  
</style>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">

// ****** Variables *****

// The following variables defines map inital central point (mapLat and MapLng)
// mapZoom is an integer from 1 to 10
// mapType can be HYBRID,ROADMAP,SATTELITE,TERRAIN
mapLat = 41.7;
mapLng = -122.4;
mapZoom = 5;
mapType = "ROADMAP";

// This variable set the location of the icon used for the markers in the map
// Ensure the file exists in the map folder
mapIcon ="flag_blue.png";

// This table contains all our marker locations
// Table structure is : [value,Latitude,Longitude,Name]
// 'Value' will be returned as value for the report parameter
// 'Name'  will be displayed as a tooltip by the marker
mylocations = [
['Alameda',37.765278, -122.240556,'Shop Alameda'],
['Los Angeles',34.052222, -118.242778,'Shop Los Angeles'],
['San Diego',32.715278, -117.156389,'Shop San Diego'],
['San Francisco',37.775000, -122.418333,'Shop San Francisco'],
['Beverly Hills',34.073611, -118.399444,'Shop Beverly Hills'],
['Portland',45.523611, -122.675000,'Shop Portland'],
['Salem',44.943056, -123.033889,'Shop Salem'],
['Bellingham',48.759722,-122.486944,'Shop Bellingham'],
['Bremerton',47.567500,-122.631389,'Shop Bremerton'],
['Seattle',47.606389, -122.330833,'Shop Seattle'],
['Spokane',47.658889,-117.425000,'Shop Spokane'],
['Tacoma',47.253056,-122.443056,'Shop Tacoma'],
['Walla Walla',46.064722,-118.341944,'Shop Walla Walla'],
['Yakima',46.602222,-120.504722,'Shop Yakima']
];

// The folowing variables determines the report and the parameter to uses in a marker's links
report_url = "http://192.168.113.143:8080/jasperserver-pro/flow.html?_flowId=viewReportFlow&reportUnit=%2Fpublic%2FSESamples%2FGoogleMapIntegration2%2Ffoodstore";
report_param_name="Store_name";

// The folowing variables determines the report and the parameter values to use when initializing the map
// set leave default_report_param_name to "" if you don't want to use a parameter
default_report_url ="http://192.168.113.143:8080/jasperserver-pro/flow.html?_flowId=viewReportFlow&reportUnit=%2Fpublic%2FSamples%2FReports%2F08.UnitSalesDetailReport";
default_report_param_name="";
default_report_param_value="";



// ****** Functions ******

// This function calls the report/dashboard displayed when page load (could be different from the report used in markers links)
function initialize_report()
    {  

	if(default_report_param_name == "") 
		{
		var url = default_report_url+"&viewAsDashboardFrame=true";
		}
		else
		{
		var url = default_report_url+"&viewAsDashboardFrame=true"+"&"+default_report_param_name+"="+default_param_value;
		}
		       
	var frame = document.getElementById("report");
	if(frame == null)
    frame = window.report;   
    frame.src = url;
    }

// This function is used by markers to load the report and set it's parameter within the report frame
function replaceURL(param_value)
    {          
	var url = report_url+"&viewAsDashboardFrame=true"+"&"+report_param_name+"="+param_value;       
	var frame = document.getElementById("report");
	if(frame == null)
    frame = window.report;   
    frame.src = url;
    }
	
// This function defines the markers on the map.
// Markers are set using the table locations
function setMarkers(map,locations) 
	{
		var image = new google.maps.MarkerImage(mapIcon,
					new google.maps.Size(32, 32),
					new google.maps.Point(0,0),
					new google.maps.Point(0, 32));
  
		var shape = {
					coord: [1, 1, 1, 32, 32, 32, 32 , 1],
					type: 'poly'
					};
   
		for (var i = 0; i < locations.length; i++) 
			{
			var mylocations = locations[i];
			var mylocationpoint = mylocations[0];
			var myLatLng = new google.maps.LatLng(mylocations[1], mylocations[2]);
			var marker = new google.maps.Marker({
			position: myLatLng,
			map: map,
			icon: image,
			shape: shape,
			title: mylocations[3],
			zIndex: i+1,
			});
			createlink(marker,mylocationpoint);
			}
 	}
	
// This function set the listener (click) to call the function replaceURL
function createlink(marker,mylocationpoint)
	{
		google.maps.event.addListener(marker, 'click', function() {replaceURL(mylocationpoint);});
	}

// This function draws the map into the div called 'map'
function initialize_map() 
	{
		
	switch (mapType) 
		{
		case "ROADMAP":
			var myOptions = 
			{
			zoom: mapZoom,
			center: new google.maps.LatLng(mapLat, mapLng),
			mapTypeId: google.maps.MapTypeId.ROADMAP
			}
		break;
		
		case "HYBRID":
			var myOptions = 
			{
			zoom: mapZoom,
			center: new google.maps.LatLng(mapLat, mapLng),
			mapTypeId: google.maps.MapTypeId.HYBRID
			}
		break;
		
		case "TERRAIN":
			var myOptions = 
			{
			zoom: mapZoom,
			center: new google.maps.LatLng(mapLat, mapLng),
			mapTypeId: google.maps.MapTypeId.TERRAIN
			}
		break;
		
		case "SATELLITE":
			var myOptions = 
			{
			zoom: mapZoom,
			center: new google.maps.LatLng(mapLat, mapLng),
			mapTypeId: google.maps.MapTypeId.SATELLITE
			}
		break;
		
		default:
			var myOptions = 
			{
			zoom: mapZoom,
			center: new google.maps.LatLng(mapLat, mapLng),
			mapTypeId: google.maps.MapTypeId.ROADMAP
			}
		break;
		} 
		  
	var map = new google.maps.Map(document.getElementById("map"),myOptions);
	setMarkers(map, mylocations);
	initialize_report()
	}

</script>

<title>GoogleMap - Jaspersoft</title>
</head>

<body onload="initialize_map()" >
    	 <div name="map" id="map"></div>
	 <iframe name="report" id="report" scrolling="no" frameBorder="0"></> 

</body>
</html>
