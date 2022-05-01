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
	<div class="container">
		<div class="content">
			<div class="siteName">
				<span>모두의<br/>병원</span>
			</div>
			<div class="siteExplain">
			</div>
			<div class="picture_1">
				<img src="./media/healthcare.png"/>
			</div>
			<div class="picture_2">
				<img src="./media/health-insurance.png"/>
			</div>
		</div>
		<div class="content" style="background-color:red;">
		</div>
		<div class="content" style="background-color:black;">
		</div>
		<div class="content">
		</div>
	</div>
</body>
</html>