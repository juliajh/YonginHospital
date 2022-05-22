<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="join_ok.jsp" method="post" id="join" name ="fr">
		아이디:<input type="text" name="id">
		<input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
		비밀번호:<input type="password" name="pw"><br/>
		이름:<input type="text" name="name"><br/>
		연령층:<select name="age" class="selectBox">
				<option value="age_0" class="optionBox">10세 미만</option>
				<option value="age_1" class="optionBox">10~19세</option>
				<option value="age_2" class="optionBox">20~29세</option>
				<option value="age_3" class="optionBox">30~39세</option>
				<option value="age_4" class="optionBox">40~49세</option>
				<option value="age_5" class="optionBox">50~59세</option>
				<option value="age_6" class="optionBox">60세 이상</option>
			</select> <br/>
		<input type="radio" name="gender" value="m" checked>남자
		<input type="radio" name="gender" value="f">여자
		
		<input type="submit" value="가입">
		
	</form>
	<script>
		function winopen(){
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		//1. 아이디가 없으면 알림창과 진행x
			if(document.fr.id.value =="" || document.fr.id.value.length < 0){
				alert("아이디를 먼저 입력해주세요")
				document.fr.id.focus();
			}else{
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("joinCheck.jsp?userid="+document.fr.id.value,"","width=500, height=300");
			}
		}
	</script>

</body>
</html>