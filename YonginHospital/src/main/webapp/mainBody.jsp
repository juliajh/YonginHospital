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
	var allResults=[];
	var results=[];
	
	function handleOnChange(e) {
		results=allResults;
		//���� �� ��� �����
		var locations=document.getElementById("locations");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.firstChild );
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
  			document.getElementById("locations").appendChild(newInput);
  			newInput.setAttribute("type","checkbox");
  			newInput.setAttribute("name","loc");
  			newInput.setAttribute("onclick","getCheckboxValue()");
  			newInput.setAttribute("value",selectedList[i]);
  			const newLabel=document.createElement("label");
  			document.getElementById("locations").appendChild(newLabel);
  			newLabel.innerText=selectedList[i];
		}
	}
	
	
	function getCheckboxValue()  {
		  // ���õ� ��� ��������
		  allResults=results;
		  const query = 'input[name="loc"]:checked';
		  const selectedEls = 
		      document.querySelectorAll(query);
		  
		  // ���õ� ��Ͽ��� value ã��
		  selectedEls.forEach((el) => {
		    allResults.push(el.value);
		  });
		  
		  
		  const uniqueArr = allResults.filter((element, index) => {
			    return allResults.indexOf(element) === index;
			});
		  
		  allResults=uniqueArr;
		  
		  // ���
		  document.getElementById('result').innerText
		    = allResults;
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
			<!-- ���� - form -->
			<div class="searchBoxonMain">
				<jsp:include page="hospitalForm.jsp"/>
			</div>
			
			<!-- ���� - ���� �ڵ� 
			<div class="content3">
				<div class="select-box">
					<select name="gu" onchange="handleOnChange(this)">
						<option value="suzi">������</option>
						<option value="giheung">���ﱸ</option>
						<option value="cheoin">ó�α�</option>
					</select>
				</div>
				<div class="location-box">
					<form id="locations">
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="ǳ��õ��">
						<label>ǳ��õ��</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="�ź���">
						<label>�ź���</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="������">
						<label>������</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="��õ��">
						<label>��õ��</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="��⵿">
						<label>��⵿</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="������">
						<label>������</label>
						<input type="checkbox" name="loc" onclick='getCheckboxValue()' value="������">
						<label>������</label>
					</form>
				</div>
				<div id="result">
					
				</div>
				<button class="search" type="button">
				    Search
				</button>
			</div>-->
		</div>
	</div>
</body>
</html>