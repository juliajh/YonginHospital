<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/searchPage.css" rel="stylesheet" type="text/css">
</head>
<body>	
<%
	String id=request.getParameter("hospitalId");

%>
<jsp:include page="header.jsp"/>

<div class="container">
		<div class="row">
			<table class="pull-right">
				<tr>
					<td class = "search_text">검색 결과</td>
					<hr>
					<td> </td>
				</tr>
			</table>
		</div>
</div>

<div id="map" style="width: 720px;height: 394px;left: 550px;top: 216px;border-radius: 20px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
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
var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

var position = new kakao.maps.LatLng(33.450701, 126.570667);

// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
roadviewClient.getNearestPanoId(position, 50, function(panoId) {
    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
});
</script>

<div id = "hospital_information">
	<form action="AddReplyAction.do" method="post" name = "replyForm">
		<input type = "text" name = "reply_content" style="width:800px;height:200px;font-size:30px;">
		<input type = "hidden" name = "hospital_code" value = "<%= request.getParameter("")%>">
		<input type = button onclick = "login()" value="제출" style="width:100px;height:200px;font-size:30px;">
	</form>
</div>

<script>
        function login(){
            var replyForm = document.replyForm;
            var uid = '<%=(String)session.getAttribute("sessionID")%>';
            if(uid=="null"){ 
   				 alert("로그인 필요");
			}else{
                replyForm.submit();
            }
        }
</script>
</div>
</body>
</html>