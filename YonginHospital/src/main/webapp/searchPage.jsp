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
						<td class = "search_text">���� �˻�</td>
						<hr>
						<td><input type="text" class="form-control"
							placeholder="�˻��� �Է�" name="searchText" maxlength="1000"></td>
					</tr>
				</table>
			</form>
		</div>
</div>

<%--	
	double a = Double.parseDouble(request.getParameter("����"));
	double b = Double.parseDouble(request.getParameter("�浵"));
--%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=kr"></script> 
<script> 
	function initialize() { 
		var myLatlng = new google.maps.LatLng(37.544440974363575, 127.20878534137019 ); // ��ǥ��
  		var mapOptions = { 
        	zoom: 16, // ���� Ȯ�뷹�� ����
        	center: myLatlng, 
        	mapTypeId: google.maps.MapTypeId.ROADMAP 
  		} 

  		var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
  		var marker = new google.maps.Marker({ 
			position: myLatlng, 
			map: map // ��Ŀ�� ���콺�� �÷����� �����ϰ� ǥ��� �����
		}); 
  } 
	window.onload = initialize;
</script>
 
<div id="map_canvas"></div>

<div id = "hospital_name">
<p>���� �̸�, �̹�����</p>
</div>

<div id = "hospital_information">
<p>���� ������</p>
</div>

<div id = "hospital_review">
<p>���� �ı��</p>
</div>

</body>
</html>