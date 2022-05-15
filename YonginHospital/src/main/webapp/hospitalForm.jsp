<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>hospitalForm</title>
<link href="css/hospitalForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- <head></head> 사이에 넣으면 웹브라우저가 HTML 문서를 해석(Parsing) 할 때 
<script> 태그를 만나면 그 안에 있는 JavaScript 의 처리가 끝날 때 까지 
다른 HTML의 해석을 멈추기 때문에 HTML 페이지가 화면에 완성되기까지 더 오래 걸린다.-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var value;
	
	function resultReset(){
		  var loc_list = document.getElementsByName("bldg");
		  for(var i=0;i<loc_list.length;i++)
		  {
			if(loc_list[i].checked == true)
			{
				loc_list[i].checked = false;
			}
		  }
	}
	
	function handleOnChange(e) {

		//기존 동 모두 지우기
		var locations=document.getElementById("bldgs");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.lastChild);
		}
		
		var suzi=['풍덕천동','신봉동','죽전동','동천동','고기동','상현동','성복동'];
		var giheung=['신갈동','영덕동','하갈동','구갈동','상갈동','보라동','지곡동','공세동','고매동','농서동',
			'서천동','언남동','청덕동','마북동','동백동','중동','상하동','보정동'];
		var cheoin=['포곡읍','모현읍','이동읍','남사읍','원삼면','백암면','양지면','중앙동','역북동','삼가동','유림동'];

		//selected 구 가져오기
		value = e.value;

  		if(value=="수지구")
			var selectedList=suzi;
  		else if(value=="기흥구")
  			var selectedList=giheung;
  		else
  			var selectedList=cheoin;

  		for(var i=0;i<selectedList.length;i++)
		{
  			var li=document.createElement("li");
  			const newInput=document.createElement("input");
  			newInput.setAttribute("type","checkbox");
  			newInput.setAttribute("name","bldg");
  			newInput.setAttribute("onclick","getCheckboxValue()");
  			newInput.setAttribute("value",selectedList[i]);
  			newInput.setAttribute("id","checkbox_"+i);
  			li.appendChild(newInput);
  			const newLabel=document.createElement("label");
  			newLabel.setAttribute("for","checkbox_"+i);
  			li.appendChild(newLabel);
  			newLabel.innerText=selectedList[i];
  			locations.appendChild(li);
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
	}

	
</script>

<div class="content3">
	<form name="hospitalForm" id="locations" action="searchHospital.jsp" method="post">
		<div class="gu-box" id="select-box">
			<select name="gu" class="selectBox" onchange="handleOnChange(this)">
				<option value="수지구" class="optionBox">수지구</option>
				<option value="기흥구" class="optionBox">기흥구</option>
				<option value="처인구" class="optionBox">처인구</option>
			</select>
		</div>
		<div class="bldg-box">
			<ul class="ks-cboxtags" id="bldgs">
				<li><input type="checkbox" id="checkbox_0" name="bldg" onclick='getCheckboxValue()' value="풍덕천동">
					<label for="checkbox_0">풍덕천동</label></li>
				<li><input type="checkbox" id="checkbox_1" name="bldg" onclick='getCheckboxValue()' value="신봉동">
					<label for="checkbox_1">신봉동</label></li>
				<li><input type="checkbox" id="checkbox_2" name="bldg" onclick='getCheckboxValue()' value="죽전동">
					<label for="checkbox_2">죽전동</label></li>
				<li><input type="checkbox" id="checkbox_3" name="bldg" onclick='getCheckboxValue()' value="동천동">
					<label for="checkbox_3">동천동</label></li>
				<li><input type="checkbox" id="checkbox_4" name="bldg" onclick='getCheckboxValue()' value="고기동">
					<label for="checkbox_4">고기동</label></li>
				<li><input type="checkbox" id="checkbox_5" name="bldg" onclick='getCheckboxValue()' value="상현동">
					<label for="checkbox_5">상현동</label></li>
				<li><input type="checkbox" id="checkbox_6" name="bldg" onclick='getCheckboxValue()' value="성복동">
					<label for="checkbox_6">성복동</label></li>
			</ul>
			<img src="https://cdn-icons-png.flaticon.com/512/560/560450.png" onclick="resultReset()" class="btn">
		</div>
		<div class="category">
			<select name="hospital" class="selectBox">
				<option value="안과" class="optionBox">안과</option>
				<option value="치과" class="optionBox">치과</option>
				<option value="피부과" class="optionBox">피부과</option>
				<option value="산부인과" class="optionBox">산부인과</option>
				<option value="유방외과" class="optionBox">유방외과</option>
				<option value="성형외과" class="optionBox">성형외과</option>
				<option value="대장항문외과" class="optionBox">대장항문외과</option>
				<option value="정형외과" class="optionBox">정형외과</option>
				<option value="일반외과" class="optionBox">일반외과</option>
				<option value="내과" class="optionBox">내과</option>
				<option value="신경외과" class="optionBox">신경외과</option>
				<option value="흉부외과" class="optionBox">흉부외과</option>
				<option value="소아과" class="optionBox">소아과</option>
				<option value="암센터" class="optionBox">암센터</option>
				<option value="요양병원" class="optionBox">요양병원</option>
				<option value="정신건강의학과" class="optionBox">정신건강의학과</option>
			</select>
		</div>
		<button type="submit" class="submitBtn">
   				<span>검색</span>
 		</button>
	</form>
</div>
</body>
</html>