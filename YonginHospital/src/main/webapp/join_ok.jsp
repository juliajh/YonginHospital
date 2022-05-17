<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	String USER = "root";
	String PASSWORD = "rlarjsdn99";
		
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	String sql = "insert into members values(?, ?, ?, ?, ?)";
		
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
			
		// 2. conn 생성
		
		conn = DriverManager.getConnection(DB_URL, USER, PASSWORD); 
			
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, age);
		pstmt.setString(5, gender);
			
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
			
		if(result == 1){ 
		
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
			
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	%>
	<script>
	alert('성공적으로 회원가입이 되었습니다.');
	
	location.href='login.jsp';
	</script>

</body>
</html>