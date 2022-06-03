<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/searchPage.css" rel="stylesheet" type="text/css">
</head>
<body>	
<% String keyword = request.getParameter("hospital_name");
%>
<jsp:include page="header.jsp"/>
<div class="container">
		<div class="row">
			<table class="pull-right">
				<tr>
					<td class = "search_text">검색 결과 </td>
					<hr>
				</tr>
			</table>
		</div>
</div>

<div id="map" style="width: 720px;height: 394px;left: 550px;top: 216px;border-radius: 20px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var keyword = "<%=keyword%>";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
console.log(keyword);
// 키워드로 장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
    	console.log(data[0].x);

       	displayMarker(data[0]);    
		bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
		console.log(data[0])
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

<div id="roadview" style="box-sizing: border-box;
	position: absolute;
	width: 330px;
	height: 394px;
	left: 169px;
	top: 216px;
	border: 1px solid #000000;	
	border-radius: 20px;
"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc"></script>
<script>

var ps = new kakao.maps.services.Places(); 
console.log(keyword);
//키워드로 장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
    	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
    	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
    	var position = new kakao.maps.LatLng(data[0].y, data[0].x);
    	console.log(data[0].x);
    	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
    	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
    	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
    	});
    } 
}
</script>





</body>
</html>