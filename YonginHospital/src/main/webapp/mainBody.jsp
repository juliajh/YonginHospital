<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/mainBody.css" rel="stylesheet" type="text/css">

</head>
<body>
<!-- <head></head> ���̿� ������ ���������� HTML ������ �ؼ�(Parsing) �� �� 
<script> �±׸� ������ �� �ȿ� �ִ� JavaScript �� ó���� ���� �� ���� 
�ٸ� HTML�� �ؼ��� ���߱� ������ HTML �������� ȭ�鿡 �ϼ��Ǳ���� �� ���� �ɸ���.-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	//�⺻ �̺�Ʈ ����
	window.addEventListener("wheel", function(e){
		e.preventDefault();
	},{passive : false});

	//������ ����
	var $html = $("html");
	var page = 1;
	var lastPage = $(".content").length;  //content�� ����
	
	//����(������)�� �ε�Ǹ� ù ������ ����

	//���콺 �� ������ �� �̺�Ʈ �ֱ�
	$(window).on("wheel", function(e){
		 
		if($html.is(":animated")) return;
	 
		if(e.originalEvent.deltaY > 0){
			if(page== lastPage) return;
			page++;
		}else if(e.originalEvent.deltaY < 0){
			if(page == 1) return;
			page--;
		}
		var posTop = (page-1) * $(window).height();
		$html.animate({scrollTop : posTop});
	 
	});
</script>
	
	<div class="main-container">
		<div class="content">
			<div class="siteName">
				<span><br>�����<br/>����</span><br><br>
			</div>
			<div class="picture">
				<img src="./media/medical.jpg"/>
			</div>
		</div>
		<div class="content" style="background-color:#cad2c5;">
			<jsp:include page="detailHospitalForm.jsp"/>
		</div>
		<div class="content" style="background-color:#84a98c;">
			<jsp:include page="hospitalForm.jsp"/>
		</div>
		<span>test</span>
	</div>
</body>
</html>