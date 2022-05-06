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
	$html.animate({scrollTop:0},10); 

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
	
	
	var suzi=['ǳ��õ��','�ź���','������','��õ��','��⵿','������','������'];
	var giheung=['�Ű���','������','�ϰ���','������','�󰥵�','����','���','������','��ŵ�','�󼭵�',
		'��õ��','�𳲵�','û����','���ϵ�','���鵿','�ߵ�','���ϵ�','������'];
	var cheoin=['������','������','�̵���','������','�����','��ϸ�','������','�߾ӵ�','���ϵ�','�ﰡ��','������',''];
	
	var value;
	
	function handleOnChange(e) {
		//���� �� ��� �����
		var locations=document.getElementById("locations");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.firstChild );
		}
		
		//selected �� ��������
		value = e.value;
		var selectedList;
  		if(value=="suzi")
			selectedList=suzi;
  		else if(value=="giheung")
  			selectedList=giheung;
  		else
  			selectedList=cheoin;

  		for(var i=0;i<selectedList.length;i++)
		{
  			const newDiv = document.createElement('div');
  			document.getElementById("locations").appendChild(newDiv);
  			newDiv.innerText=selectedList[i];
		}
	}
	
</script>
	
	<div class="main-container">
		<!-- ����� ũ�⸸ŭ ���ش�. -->
		<div class="content" style="height:calc(100vh - 65px);">
			<div class="siteName">
				<span><br>�����<br/>����</span><br><br>
			</div>
			<div class="picture">
				<img src="./media/medical.jpg"/>
			</div>
		</div>
		<div class="content" style="background-color:#cad2c5;">
			<div class="subscribe-box">
	    		<h2>���� �˻�</h2>
	    		<form class="subscribe">
	    			<input type="text" placeholder="�˻��� ������ �Է��ϼ���." autocomplete="off" required="required" />
	    			<button type="submit">
	    				<span>�˻�</span>
	    			</button>
	    		</form>
			</div>	
		</div>
		<div class="content" style="background-color:#84a98c;">
			<div class="select-box">
				<select name="gu" onchange="handleOnChange(this)">
					<option value="suzi">������</option>
					<option value="giheung">���ﱸ</option>
					<option value="cheoin">ó�α�</option>
				</select>
			</div>
			<div class="location-box">
				<div id="locations">
		        </div>
			</div>
		</div>
	</div>
</body>
</html>