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
		<a href="index.jsp">����� ����</a>
		<a href="login.jsp">�α���</a>
		<a href="login.jsp">ȸ������</a>
		<a href="index.jsp">�����˻�</a>
		<a onClick="moveToTopSmooth()">���׺����˻�</a><br>
	</header>
</body>
</html>