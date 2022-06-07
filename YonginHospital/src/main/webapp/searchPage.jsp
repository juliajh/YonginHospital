<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/searchPage.css" rel="stylesheet" type="text/css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>	
<%
String keyword = request.getParameter("hospital_name");
Connection conn = null;
try {
	conn = ConnectionProvider.getConnection();
} catch (SQLException ex) {
}
ReplyDAOImpl dao = new ReplyDAOImpl(conn);    
request.setAttribute("replyList", dao.selectlist(keyword));
List<Reply> list = dao.selectlist(keyword);
int sum=0;
double average=0;
if(!list.isEmpty()){
	for (Reply i:list){
		sum=sum+i.getGrade();
	}
	average = sum/list.size();
}
%>
<jsp:include page="header.jsp"/>

<div class="Search_bar">
		<p><div class = "search_text1">검색결과 : <%= keyword %></p>
</div>
<div id="map" style="width: 750px;height: 500px;left: 450px;top: 40px;	border: 1px solid #000000;border-radius: 20px;"></div>
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
// 키워드로 장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
       	displayMarker(data[0]);    
		bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
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
	width: 400px;
	height: 300px;
	margin-top:-462px;
	border: 1px solid #000000;	
	border-radius: 20px;
"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc"></script>
<script>

var ps = new kakao.maps.services.Places(); 
//장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
    	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
    	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
    	var position = new kakao.maps.LatLng(data[0].y, data[0].x);
    	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
    	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
    	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
    	});
    } 
}
</script>

<div class = "hospital_information">
<span id="place_name"></span><br>
<span id="category_name"></span><br>
<span id="phone"></span><br>
<span id="address_name"></span><br>
<span>평균 별점 : <%= average  %></span>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc"></script>
<script>

var ps = new kakao.maps.services.Places(); 
//키워드로 장소를 검색합니다
ps.keywordSearch(keyword, placesSearchCB); 

function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	 var infoDiv = document.getElementById('place_name');
    	 infoDiv.innerHTML = "병원명 :"+ data[0].place_name;
    	 var infoDiv = document.getElementById('category_name');
    	 infoDiv.innerHTML = "카테고리 :"+data[0].category_name;
    	 var infoDiv = document.getElementById('phone');
    	 infoDiv.innerHTML = "전화번호 :"+data[0].phone;
    	 var infoDiv = document.getElementById('address_name');
    	 infoDiv.innerHTML = "주소 :"+data[0].address_name;
    	}
	}
</script>


<script>
 	function login(){
            var replyForm = document.replyForm;
            var uid = '<%=(String)session.getAttribute("sessionID")%>';
            if(uid=="null"){ 
   				alert("로그인 필요");
   				location.href="login.jsp";
   				}
   			else{
				if(confirm("작성하시겠습니까?")){
					replyForm.submit();
					return;
				} else{
					replyForm.reset();
					return false;	
				}
   			}
 	}
</script>
                        

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
	<form action="AddReplyAction.do" method="post" name = "replyForm" style="margin-top:50px;">
	<div class="form-group" id="rating-ability-wrapper" style="text-align:center;">
	    <label class="control-label" for="rating">
	    <span class="field-label-header">병원 만족도에 대한 평점을 매겨주세요.</span><br>
	    <span class="field-label-info"></span>
	    <input type="hidden" id="selected_rating" name="grade" value="" required="required">
	    </label>
	    <h2 class="bold rating-header" style="">
	    <span class="selected-rating">0</span><small> / 5</small>
	    </h2>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <div class="reply_form" style="margin-top:50px;">
	    <input type = "text" name = "reply_content" style="width:900px;height:200px; margin-right:40px;border-radius: 10px;">
		<input type = "hidden" name = "hospital_name" value = "<%=keyword%>">
		<input type = "hidden" name = "id" value = "<%=(String)session.getAttribute("sessionID")%>">
		<input type = button onclick = "login()" value="제출" style="width:250px;height:200px;border-radius: 10px; font-size=30px;" >
		</div>
	</div>
	</form>
	
	<script>
	jQuery(document).ready(function($){	
	    
		$(".btnrating").on('click',(function(e) {
		
		var previous_value = $("#selected_rating").val();
		
		var selected_value = $(this).attr("data-attr");
		$("#selected_rating").val(selected_value);
		
		$(".selected-rating").empty();
		$(".selected-rating").html(selected_value);
		
		for (i = 1; i <= selected_value; ++i) {
		$("#rating-star-"+i).toggleClass('btn-warning');
		$("#rating-star-"+i).toggleClass('btn-default');
		}
		
		for (ix = 1; ix <= previous_value; ++ix) {
		$("#rating-star-"+ix).toggleClass('btn-warning');
		$("#rating-star-"+ix).toggleClass('btn-default');
		}
		
		}));
	});
	</script>

<c:forEach var="reply" items="${replyList}" >
	<div class="reply_content">
  		<div class="reply_content1"><c:out value="${reply.reply_content}" /></div>
  		<div class="reply_content2"><c:out value="ID :${reply.id}" /></div>
  		<div class="reply_content3"><c:out value="평점 :${reply.grade}" /></div>
	</div>
</c:forEach>
</body>
</html>