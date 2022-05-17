<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/searchPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
		<div class="row">
			<table class="pull-right">
				<tr>
					<td class = "search_text">검색 결과</td>
					<hr>
					<td>ㅁㅁ 병원</td>
					<%-- <td> <%= request.getParameter("") </td>  --%> 
				</tr>
			</table>
		</div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPUawaCdEV4yywr10s5MCKcCHwiBOfbUo&sensor=false&language=kr"></script> 
<script> 
	function initialize() { 
		var myLatlng = new google.maps.LatLng(37.544440974363575, 127.20878534137019 ); // 좌표값
  		var mapOptions = { 
        	zoom: 16, // 지도 확대레벨 조정
        	center: myLatlng, 
        	mapTypeId: google.maps.MapTypeId.ROADMAP 
  		} 

  		var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
  		var marker = new google.maps.Marker({ 
			position: myLatlng, 
			map: map // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
		}); 
  } 
	window.onload = initialize;
</script>
 
<div id="map_canvas"></div>

<div id = "hospital_name">
<p>병원 이름, 이미지란</p>
</div>

<div id = "hospital_information">
<p>병원 정보란</p>
</div>

</body>
</html>