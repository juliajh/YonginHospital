<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/hashtag.css" rel="stylesheet" type="text/css">

</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String gu=request.getParameter("gu");
	String[] bldg=request.getParameterValues("bldg");
	String hospital = request.getParameter("hospital");
	out.println(gu + " ");
	for(String s: bldg) out.println(s + " ");
	out.println(hospital + " ");
%>
</body>
</html>