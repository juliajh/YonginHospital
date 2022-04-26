<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MainPage</title>
</head>
<body>
<%
	String mode = request.getParameter("mode");
	if(mode==null)
		mode="hospital";
%>

<jsp:include page="header.jsp"/>
<jsp:include page="searchForm.jsp">
	<jsp:param name="mode" value="<%=mode %>"/>
</jsp:include>
</body>
</html>