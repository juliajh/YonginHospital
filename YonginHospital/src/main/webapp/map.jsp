<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	Place guPlace = PlaceManager.getInstance().get(gu);
	Place[] place = PlaceManager.getInstance().getBldg(gu, bldg);
%>
<c:set var="locations" value="<%=place%>"/> <!-- bldg의 위치들의 배열 -->
<c:set var="position" value="<%=guPlace%>"/> <!-- gu 위치 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPUawaCdEV4yywr10s5MCKcCHwiBOfbUo&libraries=places&sensor=false&language=kr"></script> 
<script> 
	function initialize() { 
		var lat = "${position.lat}";
		var lng = "${position.lng}";
		var myLatlng = new google.maps.LatLng(lat, lng); // 좌표값
  		var mapOptions = { 
        	zoom: 13, // 지도 확대레벨 조정
        	center: myLatlng, 
        	mapTypeId: google.maps.MapTypeId.ROADMAP,
  		} 

  		var map = new google.maps.Map(document.getElementById('map'), mapOptions); 
		
		<c:forEach items="${locations}" var="item">
			var marker = new google.maps.Marker({ 
				position: new google.maps.LatLng("${item.getLat()}","${item.getLng()}"), 
				map: map,
				label: "${item.getName()}",
			}); 
		</c:forEach>
  } 
	window.onload = initialize;
</script>
	 <div class="mapBody">
		<div id="map" class="mapContent"></div>
	</div>
</body>
</html>