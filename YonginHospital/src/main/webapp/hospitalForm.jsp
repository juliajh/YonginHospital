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
<script>
function guChange(e){
	var v_gu0 = ["동 선택X"];
	var v_gu1 =["동 선택","신갈동","영덕1동","영덕2동","구갈동","상갈동","보라동","기흥동","서농동","구성동","마북동","동백1동","동백2동",
			"동백3동","상하동","보정동"];
	var v_gu2 =["동 선택","풍덕천1동","풍덕천2동","신봉동","죽전1동","죽전2동","죽전3동","동천동","상현1동","상현2동","상현3동","성복동"];
	var v_gu3 = ["동 선택","포곡읍","모현읍","이동읍","남사읍","원삼면","백암면","양지면","중앙동","역북동","삼가동","유림동","동부동"];
	var target = document.getElementById("Bldg");
	
	if(e.value=="기흥구") var d = v_gu1;
	else if(e.value=="수지구") var d = v_gu2;
	else if(e.value=="처인구") var d = v_gu3;
	else var d = v_gu0;
	
	target.options.length = 0;
	
	for(var x in d){
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

function resetBtn(){
	$("#tmpSendFrm")[0].reset();
}
</script>
	<form action="searchHospital.jsp" name="id" id="tmpSendFrm" method="POST">    
		<select name="gu" class="selectBox" onChange="guChange(this)">
			<option value="" class="optionBox">구 선택</option>
			<option value="기흥구" class="optionBox">기흥구</option>
			<option value="수지구" class="optionBox">수지구</option>
			<option value="처인구" class="optionBox">처인구</option>
		</select>
		<select id="Bldg" name="bldg" class="selectBox">
			<option value="" class="optionBox">동 선택X</option>
		</select>
		<select name="hospital" class="selectBox">
			<option value="" class="optionBox">병원 종류</option>
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
		<input type="image" src="https://cdn-icons-png.flaticon.com/512/149/149852.png" name="submit" align="absmiddle" class="btn">
		<img src="https://cdn-icons-png.flaticon.com/512/560/560450.png" onclick="resetBtn()" class="btn">
		<!-- <input type="image" src="https://cdn-icons-png.flaticon.com/512/560/560450.png" name="reset" align="absmiddle" class="btn"> -->
	</form>	
</body>
</html>