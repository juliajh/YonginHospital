<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>hospitalForm</title>
<link href="css/hospitalForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- <head></head> ���̿� ������ ���������� HTML ������ �ؼ�(Parsing) �� �� 
<script> �±׸� ������ �� �ȿ� �ִ� JavaScript �� ó���� ���� �� ���� 
�ٸ� HTML�� �ؼ��� ���߱� ������ HTML �������� ȭ�鿡 �ϼ��Ǳ���� �� ���� �ɸ���.-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var value;
	
	function resultReset(){
		  var loc_list = document.getElementsByName("bldg");
		  for(var i=0;i<loc_list.length;i++)
		  {
			if(loc_list[i].checked == true)
			{
				loc_list[i].checked = false;
			}
		  }
	}
	
	function handleOnChange(e) {

		//���� �� ��� �����
		var locations=document.getElementById("bldgs");
		while (locations.hasChildNodes()) 
		{
			locations.removeChild(locations.lastChild);
		}
		
		var suzi=['ǳ��õ��','�ź���','������','��õ��','��⵿','������','������'];
		var giheung=['�Ű���','������','�ϰ���','������','�󰥵�','����','���','������','��ŵ�','�󼭵�',
			'��õ��','�𳲵�','û����','���ϵ�','���鵿','�ߵ�','���ϵ�','������'];
		var cheoin=['������','������','�̵���','������','�����','��ϸ�','������','�߾ӵ�','���ϵ�','�ﰡ��','������'];

		//selected �� ��������
		value = e.value;

  		if(value=="������")
			var selectedList=suzi;
  		else if(value=="���ﱸ")
  			var selectedList=giheung;
  		else
  			var selectedList=cheoin;

  		for(var i=0;i<selectedList.length;i++)
		{
  			var li=document.createElement("li");
  			const newInput=document.createElement("input");
  			newInput.setAttribute("type","checkbox");
  			newInput.setAttribute("name","bldg");
  			newInput.setAttribute("onclick","getCheckboxValue()");
  			newInput.setAttribute("value",selectedList[i]);
  			newInput.setAttribute("id","checkbox_"+i);
  			li.appendChild(newInput);
  			const newLabel=document.createElement("label");
  			newLabel.setAttribute("for","checkbox_"+i);
  			li.appendChild(newLabel);
  			newLabel.innerText=selectedList[i];
  			locations.appendChild(li);
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
	}

	
</script>

<div class="content3">
	<form name="hospitalForm" id="locations" action="searchHospital.jsp" method="post">
		<div class="gu-box" id="select-box">
			<select name="gu" class="selectBox" onchange="handleOnChange(this)">
				<option value="������" class="optionBox">������</option>
				<option value="���ﱸ" class="optionBox">���ﱸ</option>
				<option value="ó�α�" class="optionBox">ó�α�</option>
			</select>
		</div>
		<div class="bldg-box">
			<ul class="ks-cboxtags" id="bldgs">
				<li><input type="checkbox" id="checkbox_0" name="bldg" onclick='getCheckboxValue()' value="ǳ��õ��">
					<label for="checkbox_0">ǳ��õ��</label></li>
				<li><input type="checkbox" id="checkbox_1" name="bldg" onclick='getCheckboxValue()' value="�ź���">
					<label for="checkbox_1">�ź���</label></li>
				<li><input type="checkbox" id="checkbox_2" name="bldg" onclick='getCheckboxValue()' value="������">
					<label for="checkbox_2">������</label></li>
				<li><input type="checkbox" id="checkbox_3" name="bldg" onclick='getCheckboxValue()' value="��õ��">
					<label for="checkbox_3">��õ��</label></li>
				<li><input type="checkbox" id="checkbox_4" name="bldg" onclick='getCheckboxValue()' value="��⵿">
					<label for="checkbox_4">��⵿</label></li>
				<li><input type="checkbox" id="checkbox_5" name="bldg" onclick='getCheckboxValue()' value="������">
					<label for="checkbox_5">������</label></li>
				<li><input type="checkbox" id="checkbox_6" name="bldg" onclick='getCheckboxValue()' value="������">
					<label for="checkbox_6">������</label></li>
			</ul>
			<img src="https://cdn-icons-png.flaticon.com/512/560/560450.png" onclick="resultReset()" class="btn">
		</div>
		<div class="category">
			<select name="hospital" class="selectBox">
				<option value="�Ȱ�" class="optionBox">�Ȱ�</option>
				<option value="ġ��" class="optionBox">ġ��</option>
				<option value="�Ǻΰ�" class="optionBox">�Ǻΰ�</option>
				<option value="����ΰ�" class="optionBox">����ΰ�</option>
				<option value="����ܰ�" class="optionBox">����ܰ�</option>
				<option value="�����ܰ�" class="optionBox">�����ܰ�</option>
				<option value="�����׹��ܰ�" class="optionBox">�����׹��ܰ�</option>
				<option value="�����ܰ�" class="optionBox">�����ܰ�</option>
				<option value="�Ϲݿܰ�" class="optionBox">�Ϲݿܰ�</option>
				<option value="����" class="optionBox">����</option>
				<option value="�Ű�ܰ�" class="optionBox">�Ű�ܰ�</option>
				<option value="��οܰ�" class="optionBox">��οܰ�</option>
				<option value="�Ҿư�" class="optionBox">�Ҿư�</option>
				<option value="�ϼ���" class="optionBox">�ϼ���</option>
				<option value="��纴��" class="optionBox">��纴��</option>
				<option value="���Űǰ����а�" class="optionBox">���Űǰ����а�</option>
			</select>
		</div>
		<button type="submit" class="submitBtn">
   				<span>�˻�</span>
 		</button>
	</form>
</div>
</body>
</html>