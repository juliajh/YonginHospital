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

	var value;
	
	function resultReset(){
		document.getElementById('result').innerText="";
	}
	function handleOnChange(e) {
		resultReset();
		//���� �� ��� �����
		var locations=document.getElementById("bldg-box");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.firstChild);
		}
		
		var suzi=['ǳ��õ��','�ź���','������','��õ��','��⵿','������','������'];
		var giheung=['�Ű���','������','�ϰ���','������','�󰥵�','����','���','������','��ŵ�','�󼭵�',
			'��õ��','�𳲵�','û����','���ϵ�','���鵿','�ߵ�','���ϵ�','������'];
		var cheoin=['������','������','�̵���','������','�����','��ϸ�','������','�߾ӵ�','���ϵ�','�ﰡ��','������'];

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
  			const newInput=document.createElement("input");
  			document.getElementById("bldg-box").appendChild(newInput);
  			newInput.setAttribute("type","checkbox");
  			newInput.setAttribute("name","bldg");
  			newInput.setAttribute("onclick","getCheckboxValue()");
  			newInput.setAttribute("value",selectedList[i]);
  			const newLabel=document.createElement("label");
  			document.getElementById("bldg-box").appendChild(newLabel);
  			newLabel.innerText=selectedList[i];
		}
  		
	}
	
	
	function getCheckboxValue()  {
		 allResults=[]
		  // ���õ� ��� ��������
		  var loc_list = document.getElementsByName("bldg");
		  for(var i=0;i<loc_list.length;i++){
			if(loc_list[i].checked == true) {
				allResults.push(loc_list[i].value);
			}
			else{
				if(loc_list[i].value in allResults){
					allResults.pop(loc_list[i].value);
				}
			}
		  }

		  document.getElementById('result').innerText=allResults;
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
		<div class="content" style="background-color:#84a98c; position:relative" >
			<div class="content3">
				<form id="locations" action="searchHospital.jsp" method="post">
					<div id="select-box">
						<select name="gu" onchange="handleOnChange(this)">
							<option value="������">������</option>
							<option value="���ﱸ">���ﱸ</option>
							<option value="ó�α�">ó�α�</option>
						</select>
					</div>
					<div id="bldg-box">
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="ǳ��õ��">
						<label>ǳ��õ��</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="�ź���">
						<label>�ź���</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="������">
						<label>������</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="��õ��">
						<label>��õ��</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="��⵿">
						<label>��⵿</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="������">
						<label>������</label>
						<input type="checkbox" name="bldg" onclick='getCheckboxValue()' value="������">
						<label>������</label>
					</div>
					<div id="hospital-box">
						<select name="hospital">
							<option value="�Ȱ�">�Ȱ�</option>
							<option value="ġ��">ġ��</option>
							<option value="�Ǻΰ�">�Ǻΰ�</option>
							<option value="����ΰ�">����ΰ�</option>
							<option value="�ܰ�">�Ϲݿܰ�</option>
							<option value="����">����</option>
							<option value="�Ҿư�">�Ҿư�</option>
							<option value="��纴��">��纴��</option>
							<option value="���Űǰ����а�">���Űǰ����а�</option>
						</select>
					</div>
					<input type="submit"/>
					<input type="reset" onclick="resultReset()"/>
				</form>					
				<div id="result">
				</div>
			</div>
		</div>
	</div>
</body>
</html>