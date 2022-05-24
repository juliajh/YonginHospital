
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<div class="container">


<div class="row justify-content-center">
<div class="col-md-6">
<div class="card">
<header class="card-header">
	<a href="index.jsp" class="float-right btn btn-outline-primary mt-1">Home</a>
	<h4 class="card-title mt-2">Sign up</h4>
</header>
<article class="card-body">
<form action="AddMemberAction.do" method="post">
	<div class="form-row">
		<div class="col form-group">
			<label>이름 </label>   
		  	<input type="text" name="name" class="form-control" placeholder="">
		</div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->
	<div class="form-group">
		<label>ID</label>
		<input type="text" name="id" class="form-control" placeholder="">
	</div> <!-- form-group end.// -->
	<div class="form-group">
			<label class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="gender" value="option1">
		  <span class="form-check-label"> Male </span>
		</label>
		<label class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="gender" value="option2">
		  <span class="form-check-label"> Female</span>
		</label>
	</div> <!-- form-group end.// -->
	<div class="form-row">
		<div class="col form-group">
			<label>Age</label>  <br>
		  	<select name="age" class="selectBox">
				<option value="age_0" class="optionBox">10세 미만</option>
				<option value="age_1" class="optionBox">10~19세</option>
				<option value="age_2" class="optionBox">20~29세</option>
				<option value="age_3" class="optionBox">30~39세</option>
				<option value="age_4" class="optionBox">40~49세</option>
				<option value="age_5" class="optionBox">50~59세</option>
				<option value="age_6" class="optionBox">60세 이상</option>
			</select> <br/>
		</div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->
	
	<div class="form-group">
		<label>Create password</label>
	    <input class="form-control" type="password" name = "pw">
	</div> <!-- form-group end.// -->  
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Register  </button>
    </div> <!-- form-group// -->      
    <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>                                          
</form>



</article> <!-- card-body end .// -->
<div class="border-top card-body text-center">Have an account? <a href="login.jsp">Log In</a></div>
</div> <!-- card.// -->
</div> <!-- col.//-->

</div> <!-- row.//-->


</div> 
<!--container end.//-->

</div>
<br><br>
</article>
</body>
</html>