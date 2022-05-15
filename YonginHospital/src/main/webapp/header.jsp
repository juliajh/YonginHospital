<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function scrollDown(){
		  window.scrollTo(0,document.body.scrollHeight);
	}
	
	var moveToTopSmooth=function scrollUp(){
		document.body.scrollIntoView({ behavior: 'smooth' });
	}
</script>
</head>
<body>
	<header>
		<a href="index.jsp">모두의 병원</a>
		<a href="login.jsp">로그인</a>
		<a href="login.jsp">회원가입</a>
		<a href="index.jsp">병원검색</a>
		<a onClick="moveToTopSmooth()">동네병원검색</a><br>
	</header>
</body>
</html>