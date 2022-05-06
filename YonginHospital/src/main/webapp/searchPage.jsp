<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<form method="post" name="search" action="searchHospital.jsp">
				<table class="pull-right">
					<tr>
						<td class = "search_text">병원 검색</td>
						<hr>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="1000"></td>
					</tr>
				</table>
			</form>
		</div>
</div>

<%--	
	double a = Double.parseDouble(request.getParameter("위도"));
	double b = Double.parseDouble(request.getParameter("경도"));
--%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=kr"></script> 
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

<div id = "hospital_review">
<p>병원 후기란</p>
</div>

</body>
</html>