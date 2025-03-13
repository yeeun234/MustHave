<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBCConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 게시글 조회 테스트(executeQuery()사용)</h2>
	<style type="text/css">
	table , tr, td, th {
	border : 1px solid ;
	border-collapse :collapse;
	width :700px;
	}
	</style>
	
	
	
	<%
	
	String id = request.getParameter("id");
	if (id ==null || id.length()==0) {
		out.println("invaild id");
		return;
	}
	JDBCConnect jdbc = new JDBCConnect();
	String sql = "SELECT num, title, visitcount, name, postdate FROM board JOIN member ON board.id=member.id  where member.id = ?" ;
	//"SELECT num, title, visitcount, name, postdate FROM board JOIN member ON board.id=member.id "
	//select num,title,name,postdate,visitcount From board,member Where board.id = member.id;
	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	pstmt.setString(1,id );
	ResultSet rs = pstmt.executeQuery();
	String num = null;
	String title = null;
	String visitcount = null;
	String name = null;
	String postdate = null;
%>	
<table>
	<tr>
		<th>num</th>
		<th>title</th>
		<th>visitcount</th>
		<th>name</th>
		<th>postdate</th>
	</tr>
 
<%
	while(rs.next()){
		num = rs.getString("num");
		title = rs.getString("title");
		visitcount = rs.getString("visitcount");
		name = rs.getString("name");
		postdate = rs.getString("postdate");
%>
		<tr>
			<td><%=num %></td>
			<td><%=title %></td>
			<td><%=visitcount %></td>
			<td><%=name %></td>
			<td><%=postdate%></td>
		</tr>
<%	}
	jdbc.close();
%>
	
</table> 
	
</body>
</html>