<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/mainBody.css" rel="stylesheet" type="text/css">

</head>
<body>
<!-- <head></head> 사이에 넣으면 웹브라우저가 HTML 문서를 해석(Parsing) 할 때 
<script> 태그를 만나면 그 안에 있는 JavaScript 의 처리가 끝날 때 까지 
다른 HTML의 해석을 멈추기 때문에 HTML 페이지가 화면에 완성되기까지 더 오래 걸린다.-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	//기본 이벤트 제거
	window.addEventListener("wheel", function(e){
		e.preventDefault();
	},{passive : false});

	//페이지 선언
	var $html = $("html");
	var page = 1;
	var lastPage = $(".content").length;  //content의 개수
	
	//문서(페이지)가 로드되면 첫 페이지 시작
	$html.animate({scrollTop:0},10); 

	//마우스 휠 굴렸을 때 이벤트 넣기
	$(window).on("wheel", function(e){
		 
		if($html.is(":animated")) return;
	 
		if(e.originalEvent.deltaY > 0){
			if(page== lastPage) return;
			page++;
		}else if(e.originalEvent.deltaY < 0){
			if(page == 1) return;
			page--;
		}
		var posTop = (page-1) * $(window).height();
		$html.animate({scrollTop : posTop});
	 
	});
</script>
	
	<div class="main-container">
		<!-- 헤더의 크기만큼 빼준다. -->
		<div class="content" style="height:calc(100vh - 65px);">
			<div class="siteName">
				<span><br>모두의<br/>병원</span><br><br>
			</div>
			<div class="picture">
				<img src="./media/medical.jpg"/>
			</div>
		</div>
		<div class="content" style="background-color:#cad2c5;">
			<jsp:include page="detailHospitalForm.jsp"/>
		</div>
		<div class="content" style="background-color:#84a98c; position:relative" >
			<jsp:include page="hospitalForm.jsp"/>
		</div>
	</div>
</body>
</html>