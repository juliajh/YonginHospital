<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach var="reply" items="${replyList}">
				<div class="col-md-4">
					<h3> 리뷰란 </h3>
					<p> ${reply.getReply_content()}
				</div>
			</c:forEach>
	</div>

</body>
</html>