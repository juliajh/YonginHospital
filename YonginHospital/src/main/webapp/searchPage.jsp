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
					<td class = "search_text">�˻� ���</td>
					<hr>
					<td>���� ����</td>
					<%-- <td> <%= request.getParameter("") </td>  --%> 
				</tr>
			</table>
		</div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPUawaCdEV4yywr10s5MCKcCHwiBOfbUo&libraries=places&sensor=false&language=kr"></script> 
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
<c:if test="${requestScope.commentList != null }">
	<c:forEach var = "comment" items = "${requestScope.commentList }">
		<!--  ���̵� �ۼ���¥ -->
		<td width = "150">
			<div>
				${comment.comment_id }<br>
				<font size="2" color = "lightgray">${comment.comment_date }</font>
			</div>
		</td>
		<td width = "550">
			<div class = "text_wrapper">
				${comment.comment_content }
			</div>
		</td>
		<td width = "100">
			<div id = "btn" style ="text-align:center;">
				<a href="#"> �亯 </a><br>
			</div>
		</td>
	</c:forEach>
</c:if>
	<c:if test="${sessionScope.sessionID != null }">
	<tr bgcolor = "#F5F5FF5">
	<form id = "writeommentForm">
		<input type="hidden" name = "comment_board" value = "${board.board_num }">
	</form>
	</c:if>
</div>



</body>
</html>