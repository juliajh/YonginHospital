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
	String[] bldg=request.getParameterValues("bldg[]");
	String hospital = request.getParameter("hospital");
%>
</body>
<div class="hashtagBox">
	<span class="hashtagContent">#<%=gu %></span>
	<%
		for(int i = 0;i<bldg.length;i++)
		{
	%>
		<span class="hashtagContent">#<%=bldg[i] %></span>
	<%
		}
	%>
	<span class="hashtagContent">#<%=hospital %></span>
</div>
</html>