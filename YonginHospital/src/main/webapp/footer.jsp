<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//request 내장객체를 사용하여 course 인자 값 받아오기 
	String course = request.getParameter("course"); 
	int year = Integer.parseInt(request.getParameter("year")); 
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container" style="border-top: solid 1px black; margin: 10px 10px 0 0; position: absolute; bottom: 0; right: 0;">
		<h4 class="btn btn-secondary">Copyright <%= year %> <%= course %> (<%= new java.util.Date() %>)</h4>
	</div>
</nav>


</body>
</html>