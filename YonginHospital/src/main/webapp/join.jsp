<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<article>
	<div class="login-parent">
		<form class="login-form" action="AddMemberAction.do" method="post">
			<p class="text-center">회원가입</p>
			<div class="flex-row">
		    	<input class='lf--input' placeholder='Username' type='text' name="name">
		  	</div>
		  	<div class="flex-row">
		    	<input class='lf--input' placeholder='ID' type='text' name="id">
		  	</div>
		  	<div class="flex-row">
		    	<input class='lf--input' placeholder='Password' type='password' name="pw">
		  	</div>
		  	<div class="flex-row">
			  	<div class="wrapper">
				 <input type="radio" name="gender" id="option-1" value="option1">
				 <input type="radio" name="gender" id="option-2" value="option2">
				   <label for="option-1" class="option option-1">
				     <div class="dot"></div>
				      <span>Male</span>
				      </label>
				   <label for="option-2" class="option option-2">
				     <div class="dot"></div>
				      <span>Female</span>
				   </label>
				 </div>
			 </div>		 
			 <div class="flex-row">
			 	<select name="age" class="selectBox">
				 	<option value="age_0" class="optionBox">10세 미만</option>
					<option value="age_1" class="optionBox">10~19세</option>
					<option value="age_2" class="optionBox">20~29세</option>
					<option value="age_3" class="optionBox">30~39세</option>
					<option value="age_4" class="optionBox">40~49세</option>
					<option value="age_5" class="optionBox">50~59세</option>
					<option value="age_6" class="optionBox">60세 이상</option>
			 	</select>
		  	</div>
		  <input class='lf--submit' type='submit' value='REGISTER'>
		  <br>
		  <small style="font-size: 13px;">By clicking the 'Sign Up' button, you confirm that you accept our Terms of use and Privacy Policy.</small>
		</form>
	</div>
</article>
</body>
</html>