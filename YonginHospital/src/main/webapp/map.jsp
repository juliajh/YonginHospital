<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>map</title>
<link href="css/map.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPUawaCdEV4yywr10s5MCKcCHwiBOfbUo&sensor=false&language=kr"></script> 
	<script> 
		function initialize() { 
			var myLatlng = new google.maps.LatLng(37.544440974363575, 127.20878534137019 ); // 좌표값
	  		var mapOptions = { 
	        	zoom: 16, // 지도 확대레벨 조정
	        	center: myLatlng, 
	        	mapTypeId: google.maps.MapTypeId.ROADMAP 
	  		} 
	
	  		var map = new google.maps.Map(document.getElementById('map'), mapOptions); 
	  		var marker = new google.maps.Marker({ 
				position: myLatlng, 
				map: map // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
			}); 
	  } 
		window.onload = initialize;
	</script>
	 <div class="mapBody">
		<div id="map" class="mapContent"></div>
	</div>
</body>
</html>