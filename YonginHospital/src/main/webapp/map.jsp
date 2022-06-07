<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<link href="css/map.css" rel="stylesheet" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

<%
	String gu=request.getParameter("gu");
	List<String> bldgList=new ArrayList(Arrays.asList(request.getParameterValues("bldg[]")));
	String hospital = request.getParameter("hospital");

%>
<c:set var="bldgList" value="<%=bldgList%>"/> 
<c:set var="hospital" value="<%=hospital%>"/> 

<div class="map_wrap">
    <div id="map" style="border-radius: 20px;width:100%;height:100%;position:relative;overflow:hidden;"></div>
</div>
<div id="menu_wrap">
	<ul id="placesList"></ul>
</div>
<div id="pagination" style="width: 100%; text-align:center;"></div>

<div class="modal hidden">
  <div class="bg"></div>
  <div class="modalBox">
    <img src="https://img.icons8.com/color/48/undefined/delete-sign--v1.png" class="closeBtn"/>
    <span>병원 정보가 없습니다.<br/>다시 검색해주세요.</span>
  </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc&libraries=services"></script>
<script>

// places를 담을 배열입니다
var markers=[];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

searchPlaces();
// 키워드 검색을 요청하는 함수입니다

function searchPlaces() {
    <c:forEach items="${bldgList}" var="bldg" varStatus="status">
    	ps.keywordSearch("${bldg}"+' '+"${hospital}", placesSearchCB);
    	if(${status.index}==${fn:length(bldgList)}-1){
    		setTimeout(function() {
    			var placesList=document.getElementById('placesList');
    			var eleCount = placesList.childElementCount;
    			if(eleCount==0){
    				document.querySelector(".modal").classList.remove("hidden");
    			}
    			
    			const close = () => {
    				   document.querySelector(".modal").classList.add("hidden");
    				   location.href='main.jsp#positionSearch';
    			 }
    			
    			 document.querySelector(".closeBtn").addEventListener("click", close);
    			 document.querySelector(".bg").addEventListener("click", close);
   			}, 1000);
    	}
	</c:forEach>
	
}


// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	placesArr=[]
    	for ( var i=0; i<data.length; i++ ) {
    		placesArr.push(data[i]);
		}
    	displayPlaces(placesArr);
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places)
{
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {
    	
    	//placesArr에 places 담기 
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);
        fragment.appendChild(itemEl);

        
    }
    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    

}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li');
    
    itemStr = ' <a href="searchPage.jsp?hospital_name='+places.place_name+'"> <div class="card-body"> <h5 class="card-title">'+places.place_name+'</h5>';

    if (places.road_address_name) {
        itemStr += '    <p class="card-text"> 도로명주소: ' + places.road_address_name + '<br> 주소: '
        + places.address_name  + '<br>';
    } else {
        itemStr += '    <p class="card-text">' +  places.address_name  + '<br>'; 
    }
    
    if(places.phone){
    	itemStr += '  phone: ' + places.phone  + '<br>';
    }
    else{
    	itemStr += '  phone: X <br>';
    }
    itemStr += '</p></div></a>'

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
    
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

</script>


</body>
</html>