<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function alertSuccess() {
	  alert("��� ������ ���̵��Դϴ�.");
	}
function alertFailure() {
	alert("�ٸ� ���̵� �Է��ϼ���.");
}
</script>
</head>
<body>
<%!
	// JDBC driver name and database URL
	private static final String DB_PROPERTIES = "?useSSL=false&serverTimezone=UTC"; // MySQL Connector J 8.0
	private static final String DB_SCHEMAS = "sampledb";
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver";  // try "com.mysql.cj.jdbc.Driver"
	private static final String DB_URL = "jdbc:mysql://localhost/" + DB_SCHEMAS + DB_PROPERTIES; 
%>

<%	
%>
alertSuccess();
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
    // DB���ῡ �ʿ��� ���� ����

	String USER = "root";
	String PASSWORD = "rlarjsdn99";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from members where id = ?";
	
	try{
		// ����̹� ȣ��
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// conn ����
		
		conn = DriverManager.getConnection(DB_URL, USER, PASSWORD); 
		// pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		// sql����
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // �α��� ����(������ ���� session)
			response.sendRedirect("join.jsp");
		} else{ // �α��� ����
			response.sendRedirect("login.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // ������ �� ��쵵 �����̷�Ʈ
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>

</body>
</html>