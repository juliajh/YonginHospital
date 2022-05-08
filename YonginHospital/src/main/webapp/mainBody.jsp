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

	var value;
	
	function resultReset(){
		document.getElementById('result').innerText="";
	}
	function handleOnChange(e) {
		resultReset();
		//기존 동 모두 지우기
		var locations=document.getElementById("bldg-box");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.firstChild);
		}
		
		var suzi=['풍덕천동','신봉동','죽전동','동천동','고기동','상현동','성복동'];
		var giheung=['신갈동','영덕동','하갈동','구갈동','상갈동','보라동','지곡동','공세동','고매동','농서동',
			'서천동','언남동','청덕동','마북동','동백동','중동','상하동','보정동'];
		var cheoin=['포곡읍','모현읍','이동읍','남사읍','원삼면','백암면','양지면','중앙동','역북동','삼가동','유림동'];

		//selected 구 가져오기
		value = e.value;
		var selectedList;
  		if(value=="suzi")
			selectedList=suzi;
  		else if(value=="giheung")
  			selectedList=giheung;
  		else
  			selectedList=cheoin;

  		for(var i=0;i<selectedList.length;i++)
		{
  			const newInput=document.createElement("input");
  			document.getElementById("bldg-box").appendChild(newInput);
  			newInput.setAttribute("type","checkbox");
  			newInput.setAttribute("name","bldg");
  			newInput.setAttribute("onclick","getCheckboxValue()");
  			newInput.setAttribute("value",selectedList[i]);
  			const newLabel=document.createElement("label");
  			document.getElementById("bldg-box").appendChild(newLabel);
  			newLabel.innerText=selectedList[i];
		}
  		
	}
	
	
	function getCheckboxValue()  {
		 allResults=[]
		  // 선택된 목록 가져오기
		  var loc_list = document.getElementsByName("bldg");
		  for(var i=0;i<loc_list.length;i++){
			if(loc_list[i].checked == true) {
				allResults.push(loc_list[i].value);
			}
			else{
				if(loc_list[i].value in allResults){
					allResults.pop(loc_list[i].value);
				}
			}
		  }

		  document.getElementById('result').innerText=allResults;
	}

	
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
			<div class="subscribe-box">
	    		<h2>병원 검색</h2>
	    		<form class="subscribe">
	    			<input type="text" placeholder="검색할 병원을 입력하세요." autocomplete="off" required="required" />
	    			<button type="submit">
	    				<span>검색</span>
	    			</button>
	    		</form>
			</div>	
		</div>
		<div class="content" style="background-color:#84a98c; position:relative" >
			<div class="content3">
				<form id="locations" action="searchHospital.jsp" method="post">
					<div id="select-box">
						<select name="gu" onchange="handleOnChange(this)">
							<option value="수지구">수지구</option>
							<option value="기흥구">기흥구</option>
							<option value="처인구">처인구</option>
						</select>
					</div>
					<div id="bldg-box">
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="풍덕천동">
						<label>풍덕천동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="신봉동">
						<label>신봉동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="죽전동">
						<label>죽전동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="동천동">
						<label>동천동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="고기동">
						<label>고기동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="상현동">
						<label>상현동</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="성복동">
						<label>성복동</label>
					</div>
					<div id="hospital-box">
						<select name="hospital">
							<option value="안과">안과</option>
							<option value="치과">치과</option>
							<option value="피부과">피부과</option>
							<option value="산부인과">산부인과</option>
							<option value="외과">일반외과</option>
							<option value="내과">내과</option>
							<option value="소아과">소아과</option>
							<option value="요양병원">요양병원</option>
							<option value="정신건강의학과">정신건강의학과</option>
						</select>
					</div>
					<input type="submit"/>
					<input type="reset" onclick="resultReset()"/>
				</form>					
				<div id="result">
				</div>
			</div>
		</div>
	</div>
</body>
</html>