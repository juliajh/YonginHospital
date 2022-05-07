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
<script>
function guChange(e){
	var v_gu0 = ["�� ����X"];
	var v_gu1 =["�� ����","�Ű���","����1��","����2��","������","�󰥵�","����","���ﵿ","����","������","���ϵ�","����1��","����2��",
			"����3��","���ϵ�","������"];
	var v_gu2 =["�� ����","ǳ��õ1��","ǳ��õ2��","�ź���","����1��","����2��","����3��","��õ��","����1��","����2��","����3��","������"];
	var v_gu3 = ["�� ����","������","������","�̵���","������","�����","��ϸ�","������","�߾ӵ�","���ϵ�","�ﰡ��","������","���ε�"];
	var target = document.getElementById("Bldg");
	
	if(e.value=="���ﱸ") var d = v_gu1;
	else if(e.value=="������") var d = v_gu2;
	else if(e.value=="ó�α�") var d = v_gu3;
	else var d = v_gu0;
	
	target.options.length = 0;
	
	for(var x in d){
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

function resetBtn(){
	$("#tmpSendFrm")[0].reset();
}
</script>
	<form action="searchHospital.jsp" name="id" id="tmpSendFrm" method="POST">    
		<select name="gu" class="selectBox" onChange="guChange(this)">
			<option value="" class="optionBox">�� ����</option>
			<option value="���ﱸ" class="optionBox">���ﱸ</option>
			<option value="������" class="optionBox">������</option>
			<option value="ó�α�" class="optionBox">ó�α�</option>
		</select>
		<select id="Bldg" name="bldg" class="selectBox">
			<option value="" class="optionBox">�� ����X</option>
		</select>
		<select name="hospital" class="selectBox">
			<option value="" class="optionBox">���� ����</option>
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
		<input type="image" src="https://cdn-icons-png.flaticon.com/512/149/149852.png" name="submit" align="absmiddle" class="btn">
		<img src="https://cdn-icons-png.flaticon.com/512/560/560450.png" onclick="resetBtn()" class="btn">
		<!-- <input type="image" src="https://cdn-icons-png.flaticon.com/512/560/560450.png" name="reset" align="absmiddle" class="btn"> -->
	</form>	
</body>
</html>