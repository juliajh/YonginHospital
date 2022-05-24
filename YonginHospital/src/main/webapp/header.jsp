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
		<a href="index.jsp">����� ����</a>
		
		<c:if test="${sessionID != null }">
			<a href="logout.jsp">�α׾ƿ�</a>
		</c:if>
		<c:if test="${sessionID == null }">
			<a href="login.jsp">�α���</a>
		</c:if>
		
		
		<a href="join.jsp">ȸ������</a>
		<a href="index.jsp">�����˻�</a>
		<a onClick="moveToTopSmooth()">���׺����˻�</a><br>
	</header>
</body>
</html>