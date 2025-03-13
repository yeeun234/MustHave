<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		
		String sql = "INSERT INTO board(title,content,id,visitcount) VALUES (?,?,?,0)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		int intResult = 0;
		int i =0;
			while(true){
					
				psmt.setString(1,title);
				psmt.setString(2,content);
				psmt.setString(3,id);
				
				intResult = psmt.executeUpdate();
				i++;
				if(i==5)break;
			}
				out.println("입력완료");
				
		
		jdbc.close();
		
	%>
</body>
</html>