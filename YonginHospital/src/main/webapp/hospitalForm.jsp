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
	
	if(e.value=="gu1") var d = v_gu1;
	else if(e.value=="gu2") var d = v_gu2;
	else if(e.value=="gu3") var d = v_gu3;
	else var d = v_gu0;
	
	target.options.length = 0;
	
	for(x in d){
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

</script>
	<form>
		<select name="gu" class="selectBox" onChange="guChange(this)">
			<option value="gu0" class="optionBox">�� ����</option>
			<option value="gu1" class="optionBox">���ﱸ</option>
			<option value="gu2" class="optionBox">������</option>
			<option value="gu3" class="optionBox">ó�α�</option>
		</select>
		<select id="Bldg" class="selectBox">
			<option value="district0" class="optionBox">�� ����X</option>
		</select>
		<select name="hospital" class="selectBox">
			<option value="hospital0" class="optionBox">���� ����</option>
			<option value="hospital1" class="optionBox">�Ȱ�</option>
			<option value="hospital2" class="optionBox">ġ��</option>
			<option value="hospital3" class="optionBox">�Ǻΰ�</option>
			<option value="hospital4" class="optionBox">����ΰ�</option>
			<option value="hospital5" class="optionBox">����ܰ�</option>
			<option value="hospital6" class="optionBox">�����ܰ�</option>
			<option value="hospital7" class="optionBox">�����׹��ܰ�</option>
			<option value="hospital8" class="optionBox">�����ܰ�</option>
			<option value="hospital9" class="optionBox">�Ϲݿܰ�</option>
			<option value="hospital10" class="optionBox">����</option>
			<option value="hospital11" class="optionBox">�Ű�ܰ�</option>
			<option value="hospital12" class="optionBox">��οܰ�</option>
			<option value="hospital13" class="optionBox">�Ҿư�</option>
			<option value="hospital14" class="optionBox">�ϼ���</option>
			<option value="hospital15" class="optionBox">��纴��</option>
			<option value="hospital16" class="optionBox">���Űϰ����а�</option>
		</select>
		<input type="image" src="https://cdn-icons-png.flaticon.com/512/149/149852.png" name="submit" value="submit" align="absmiddle" class="btn">
		<input type="image" src="https://cdn-icons-png.flaticon.com/512/560/560450.png" name="reset" value="reset" align="absmiddle" class="btn">
	</form>
	
</body>
</html>