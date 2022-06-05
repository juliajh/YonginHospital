<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<!-- Join -->
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<link href="css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<h3><a href="main.jsp#main">모두의 병원</a></h3> 
		<nav>
			<ul>
				<li><a href="join.jsp">회원가입</a></li>
				<li><a href="main.jsp#hospitalSearch">병원검색</a></li>
				<li><a href="webcrawling.jsp">웹크롤링테스트</a></li>
				<li><a href="main.jsp#positionSearch">동네병원검색</a></li>
				<c:if test="${sessionID != null }">
					<li><a href="logout.jsp" style="margin-right:40px">로그아웃</a></li>
				</c:if>
				<c:if test="${sessionID == null }">
					<li><a href="login.jsp" style="margin-right:40px">로그인</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
</body>
</html>