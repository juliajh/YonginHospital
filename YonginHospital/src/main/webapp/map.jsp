<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ű����� ��Ұ˻��ϰ� ������� ǥ���ϱ�</title>
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
    <span>���� ������ �����ϴ�.<br/>�ٽ� �˻����ּ���.</span>
  </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2302400bab2456e5c3a2d414983aa9fc&libraries=services"></script>
<script>

// places�� ���� �迭�Դϴ�
var markers=[];

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 4 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new kakao.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

searchPlaces();
// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�

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


// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	placesArr=[]
    	for ( var i=0; i<data.length; i++ ) {
    		placesArr.push(data[i]);
		}
    	displayPlaces(placesArr);
    }
}

// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places)
{
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);
    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {
    	
    	//placesArr�� places ��� 
        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�
        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);
        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
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
    // �˻���� �׸���� �˻���� ��� Element�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
    

}


// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
function getListItem(index, places) {
    var el = document.createElement('li');
    
    itemStr = ' <a href="searchPage.jsp?hospital_name='+places.place_name+'"> <div class="card-body"> <h5 class="card-title">'+places.place_name+'</h5>';

    if (places.road_address_name) {
        itemStr += '    <p class="card-text"> ���θ��ּ�: ' + places.road_address_name + '<br> �ּ�: '
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

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new kakao.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new kakao.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
// ���������쿡 ��Ҹ��� ǥ���մϴ�
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
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