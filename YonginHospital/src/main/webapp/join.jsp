<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>ȸ������</h2>
	
	<form action="join_ok.jsp" method="post" id="join" name ="fr">
		���̵�:<input type="text" name="id">
		<input type="button" value="�ߺ�Ȯ��" class="dup" onclick="winopen()"><br>
		��й�ȣ:<input type="password" name="pw"><br/>
		�̸�:<input type="text" name="name"><br/>
		������:<select name="age" class="selectBox">
				<option value="age_0" class="optionBox">10�� �̸�</option>
				<option value="age_1" class="optionBox">10~19��</option>
				<option value="age_2" class="optionBox">20~29��</option>
				<option value="age_3" class="optionBox">30~39��</option>
				<option value="age_4" class="optionBox">40~49��</option>
				<option value="age_5" class="optionBox">50~59��</option>
				<option value="age_6" class="optionBox">60�� �̻�</option>
			</select> <br/>
		<input type="radio" name="gender" value="m" checked>����
		<input type="radio" name="gender" value="f">����
		
		<input type="submit" value="����">
		
	</form>
	<script>
		function winopen(){
		//��â�� ��� �������� ���� �� -> ȸ�����̵������� ������ �ߺ�üũ
		//1. ���̵� ������ �˸�â�� ����x
			if(document.fr.id.value =="" || document.fr.id.value.length < 0){
				alert("���̵� ���� �Է����ּ���")
				document.fr.id.focus();
			}else{
			//2. ȸ���������̵� ������ �ִ� �� üũ�Ϸ��� DB�� �����ؾ��Ѵ�.
			//�ڹٽ�ũ��Ʈ�� ��� DB�� �����ұ�? => �Ķ���ͷ� id���� �������� jsp���������� �����ϸ� �ȴ�.
			window.open("joinCheck.jsp?userid="+document.fr.id.value,"","width=500, height=300");
			}
		}
	</script>

</body>
</html>