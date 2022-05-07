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
	String gu = request.getParameter("gu");
	String bldg = request.getParameter("bldg");
	String hospital = request.getParameter("hospital");
	if(gu==null)
		gu="";
	if(bldg==null)
		bldg="";
	if(hospital==null)
		hospital="";
	if(!gu.contentEquals(""))
	{
	%>
	<div class="hashtagBox">
		<span class="hashtagContent">#<%=gu %></span>
		<span class="hashtagContent">#<%=bldg %></span>
		<span class="hashtagContent">#<%= hospital %></span> 
	</div>
	<%
		}
	%>
</body>
</html>