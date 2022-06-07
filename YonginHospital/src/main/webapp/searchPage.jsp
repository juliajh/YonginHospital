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
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
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
	<form action="AddReplyAction.do" method="post" name = "replyForm" style="margin-top:50px;">
		<div class = "starrating">
		<h1>평점을 입력하여 리뷰를 작성하세요.</h1>
		<div class="star-rating space-x-4 mx-auto;" id = "star">
				<input type="radio" id="5-stars" name="grade" value="5"/>
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="grade" value="4"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="grade" value="3"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="grade" value="2"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="grade" value="1"/>
				<label for="1-star" class="star">★</label>
		</div>
		</div>
	    <div class="reply_form" style="margin-top:50px; text-align:center;">
	    	<input type = "text" name = "reply_content" placeholder="리뷰를 남겨주세요."style="width:900px;height:195px; margin-right:40px;border-radius: 10px;font-size:30px;">
			<input type = "hidden" name = "hospital_name" value = "<%=keyword%>">
			<input type = "hidden" name = "id" value = "<%=(String)session.getAttribute("sessionID")%>">
			<input type = button onclick = "login()" value="제출" style="width:246px;height:200px;border-radius: 10px; font-size:30px;" >
		</div>
	</form>
	
	

<c:forEach var="reply" items="${replyList}" >
	<div class="reply_content">
  		<div class="reply_content1"><c:out value="${reply.reply_content}" /></div>
  		<div class="reply_content2"><c:out value="ID :${reply.id}" /></div>
		<div class="reply_content3">
		<c:forEach begin="0" end="4" var="i">
                        <c:choose>
                               <c:when test="${reply.grade > i }">
                                   <i class="far fas fa-star" ></i>
                               </c:when>
                               <c:otherwise>
                                   <i class="far fa-star"></i>
                               </c:otherwise>
                         </c:choose>
                    </c:forEach>
		</div>
	</div>
</c:forEach>
</body>
</html>