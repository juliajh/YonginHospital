<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp"/>

<div class="login-parent">
	<form class="login-form" action="LoginMemberAction.do" method="post">
		<p class="text-center">로그인</p>
		<div class="flex-row">
	    	<input id="username" class='lf--input' placeholder='ID' type='text' name="id" required="required">
	  	</div>
		<div class="flex-row">
		    <input id="password" class='lf--input' placeholder='Password' type='password' name="pw" required="required">
	  	</div>
	  <input class='lf--submit' type='submit' value='LOGIN'>
	  <p class="text-center"><a href="join.jsp">Create an Account</a></p>
	</form>
</div>
<c:if test="${ loginResult == -1 || loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
</c:if>
</body>
</html>