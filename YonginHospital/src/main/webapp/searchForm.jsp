<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>SearchForm</title>
<link href="css/search.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	String mode = request.getParameter("mode");
%>
<div class="card">
    <div style="display:flex; font-size:30px; font-weight: 900; margin-bottom:30px;">
	    <a href="main.jsp?mode=hospital" style=" margin-right:50px;">병원검색</a>
	    <a href="main.jsp?mode=position" >위치검색</a>
    </div>
<%
	if(mode.contentEquals("hospital")){
%>
	<label class="input">
      <input class="input__field" type="text" placeholder=" " />
      <span class="input__label">hospital</span>
    </label>
    <div class="button-group">
      <button type="submit" href="index.jsp">Send</button>
      <button type="reset">Reset</button>
    </div>
<%
	}
	else{
%>
    <label class="input">
      <input class="input__field" type="text" placeholder=" " />
      <span class="input__label">location</span>
    </label>
    <div class="button-group">
      <button type="submit" href="index.jsp">Send</button>
      <button type="reset">Reset</button>
    </div>
</div>
<%		
	}
%>
</body>
</html>