<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#2B4B2A;  left:0; right:0; position: fixed;">
	  <div class="container-fluid">
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarScroll">
	      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="index.jsp" style="color:white;">����� ����</a>
	        </li>
	        </ul>
	        <ul class="nav justify-content-end" style="justify-content-end;">
	        <li class="nav-item">
	          <a class="nav-link" href="login.jsp" style="color:white;">�α���</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="signUp.jsp" style="color:white;">ȸ������</a>
	        </li>
	      </ul>
	      <form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
<!--
	<a href="index.jsp">HOME</a><br>
	<a href="login.jsp">LOGIN</a><br>
 -->
</body>
</html>