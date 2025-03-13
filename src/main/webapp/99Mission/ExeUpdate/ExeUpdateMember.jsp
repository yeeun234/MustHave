<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		JDBCConnect jdbc = new JDBCConnect();
		
		String id = request.getParameter("id");
		String passward = request.getParameter("pass");
		String name = request.getParameter("name");
		
		String sql = "INSERT INTO member(id,pass,name) VALUES (?,?,?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		int intResult = 0;
		
			
					
				psmt.setString(1,id);
				psmt.setString(2,passward);
				psmt.setString(3,name);
				intResult = psmt.executeUpdate();
				
				out.println("입력완료");
				
		
		jdbc.close();
		
	%>
</body>
</html>