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
		
		String id = request.getParameter("user_id");
		String title = request.getParameter("user_ti");
		String content = request.getParameter("user_ct");
		
		String sql = "INSERT INTO board(title,content,id) VALUES (?,?,?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		int intResult = 0;
		int i= 1;
		
			if(id!=""){
				while(true){
					
				psmt.setString(1,title);
				psmt.setString(2,content+i);
				psmt.setString(3,id);
				intResult = psmt.executeUpdate();
				i++;
				if(i == 5) break;
				}
			out.println(intResult +"행이"+i+"번 입력되었습니다.");		
			}
		
		
		jdbc.close();
		
	%>
</body>
</html>