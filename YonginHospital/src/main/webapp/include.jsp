<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="AddReplyAction.do" method="post" name = "replyForm" style="margin-top:50px;">
	<div class="form-group" id="rating-ability-wrapper" style="text-align:center;">
	    <label class="control-label" for="rating">
	    <span class="field-label-header">병원 만족도에 대한 평점을 매겨주세요.</span><br>
	    <span class="field-label-info"></span>
	    <input type="hidden" id="selected_rating" name="grade" value="" required="required">
	    </label>
	    <h2 class="bold rating-header" style="">
	    <span class="selected-rating">0</span><small> / 5</small>
	    </h2>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <div class="reply_form" style="margin-top:50px;">
	    <input type = "text" name = "reply_content" style="width:900px;height:200px; margin-right:40px;border-radius: 10px;">
		<input type = "hidden" name = "hospital_name" value = "null">
		<input type = "hidden" name = "id" value = "<%=(String)session.getAttribute("sessionID")%>">
		<input type = button onclick = "login()" value="제출" style="width:250px;height:200px;border-radius: 10px; font-size=30px;" >
		</div>
	</div>
	</form>
	
	<script>
	jQuery(document).ready(function($){	
	    
		$(".btnrating").on('click',(function(e) {
		
		var previous_value = $("#selected_rating").val();
		
		var selected_value = $(this).attr("data-attr");
		$("#selected_rating").val(selected_value);
		
		$(".selected-rating").empty();
		$(".selected-rating").html(selected_value);
		
		for (i = 1; i <= selected_value; ++i) {
		$("#rating-star-"+i).toggleClass('btn-warning');
		$("#rating-star-"+i).toggleClass('btn-default');
		}
		
		for (ix = 1; ix <= previous_value; ++ix) {
		$("#rating-star-"+ix).toggleClass('btn-warning');
		$("#rating-star-"+ix).toggleClass('btn-default');
		}
		
		}));
	});
	</script>
</body>
</html>