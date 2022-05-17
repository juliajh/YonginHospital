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
	  alert("사용 가능한 아이디입니다.");
	}
function alertFailure() {
	alert("다른 아이디를 입력하세요.");
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
    // DB연결에 필요한 변수 선언

	String USER = "root";
	String PASSWORD = "rlarjsdn99";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from members where id = ?";
	
	try{
		// 드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// conn 생성
		
		conn = DriverManager.getConnection(DB_URL, USER, PASSWORD); 
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		// sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			response.sendRedirect("join.jsp");
		} else{ // 로그인 실패
			response.sendRedirect("login.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // 에러가 난 경우도 리다이렉트
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