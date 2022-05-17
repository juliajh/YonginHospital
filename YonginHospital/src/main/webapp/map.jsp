<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Map</title>
<link href="css/map.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String gu=request.getParameter("gu");
	String[] bldg=request.getParameterValues("bldg");
	String hospital = request.getParameter("hospital");
	Place[] place = PlaceManager.getInstance().get(gu);
%>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPUawaCdEV4yywr10s5MCKcCHwiBOfbUo&sensor=false&language=kr"></script> 
	<script> 
		function initialize() { 
			var myLatlng = new google.maps.LatLng(<%= place[0].getLat()%>, <%= place[0].getLng()%>); // ��ǥ��
	  		var mapOptions = { 
	        	zoom: 14, // ���� Ȯ�뷹�� ����
	        	center: myLatlng, 
	        	mapTypeId: google.maps.MapTypeId.ROADMAP 
	  		} 
	
	  		var map = new google.maps.Map(document.getElementById('map'), mapOptions); 
	  		var marker = new google.maps.Marker({ 
				position: myLatlng, 
				map: map // ��Ŀ�� ���콺�� �÷����� �����ϰ� ǥ��� �����
			}); 
	  } 
		window.onload = initialize;
	</script>
	 <div class="mapBody">
		<div id="map" class="mapContent"></div>
	</div>
</body>
</html>