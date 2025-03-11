<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(exeutedUpdate() 사용)</h2>
	<%
		JDBCConnect jdbc = new JDBCConnect();
		
		String id = "test1";
		String pass = "1111";
		String name = "테스트1회원";
		
		String sql = "INSERT INTO member(id,pass,name,regidate) VALUES (?,?,?,?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pass);
		psmt.setString(3,name);
		//psmt.setString(4,"2025-03-11");
		psmt.setDate(4,new Date(2025,3,11));
		
		int intResult = psmt.executeUpdate();
		out.println(intResult +"행이 입력되었습니다.");
		
		jdbc.close();
		
	%>
</body>
</html>