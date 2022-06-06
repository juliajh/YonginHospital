<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/detailHospitalForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="subscribe-box">
		<span style="font-size:2.2rem;">리뷰와 자세한 정보를 보고 싶은 병원 이름을 검색하세요</span>
   		<img id="medicineImg" src="./media/medicine.png"/>
   		<form class="subscribe" action="searchPage.jsp" method="post">
   			<input type="text" placeholder="검색할 병원을 입력하세요." name="hospital_name" autocomplete="off" required="required" />
   			<button type="submit">
   				<span>검색</span>
   			</button>
   		</form>
	</div>	

</body>
</html>