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
		<span style="font-size:2.2rem;">����� �ڼ��� ������ ���� ���� ���� �̸��� �˻��ϼ���</span>
   		<img id="medicineImg" src="./media/medicine.png"/>
   		<form class="subscribe" action="searchPage.jsp" method="post">
   			<input type="text" placeholder="�˻��� ������ �Է��ϼ���." name="hospital_name" autocomplete="off" required="required" />
   			<button type="submit">
   				<span>�˻�</span>
   			</button>
   		</form>
	</div>	

</body>
</html>