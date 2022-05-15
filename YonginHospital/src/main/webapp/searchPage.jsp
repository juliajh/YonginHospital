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
					<%-- <td> <%= request.getParameter("") </td>  --%> 
				</tr>
			</table>
		</div>
</div>

<%--	
	double a = Double.parseDouble(request.getParameter("위도"));
	double b = Double.parseDouble(request.getParameter("경도"));
--%>
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

<div id = "hospital_review">
<div class="w3-border w3-padding">댓글</div>
		<div class="w3-border w3-padding">
			<c:if test="${ id == null }">
				<textarea rows="5" cols="50" >로그인 후 댓글 달기</textarea>
			</c:if>
			<c:if test="${ id != null }">
				<i class="fa fa-user w3-padding-16"></i> ${ content.id }
				<form>
					<input type="hidden" name="no" id="no" value="${ content.board_no }"> 
					<input type="hidden" name="id" id="id" value="${ id }">
					<textarea rows="5" cols="50" " placeholder="댓글 작성" name="reply_content" id="reply_content"></textarea>
					<input type="button" id="reply_btn" value="댓글 등록">
				</form>
			</c:if>
		</div>
		<jsp:include page="replyView.jsp"/>
</div>
<script>
	$("#reply_btn").click(function(){
		if($("#reply_content").val().trim() === ""){
			alert("댓글을 입력하세요.");
			$("#reply_content").val("").focus();
		}else{
			$.ajax({
				url: "/action/ReplyWriteAction.do",
            	type: "POST",
            	data: {
                	no : $("#no").val(),
                	id : $("#id").val(),
                	reply_content : $("#reply_content").val()
            	},
            	success: function () {
            		alert("댓글 등록 완료");
            		$("#reply_content").val("");
            		getReply();
            	},
	})
</script>

</body>
</html>