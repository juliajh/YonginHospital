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
	
	<form action="join_ok.jsp" method="post">
		아이디:<input type="text" name="id"><br/>
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

</body></html>