<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>콘텐츠 내용 작성 (5회 반복/보드에 입력)</h2>
	<form action="ExeUpdate2.jsp" method="post">
		<table>
			<tr>
			<td>ID: </td> <td><input type="text" name="user_id" value=""> </td>
			</tr>
			<tr><td>title : </td> <td><input type="text" name="user_ti"> </td></tr>
			<tr><td>content :</td> <td> <input type="text" name="user_ct"></td></tr>
			<tr><td colspan="2" align="right"><input type="submit" value="submit"></td></tr>
		</table>
	</form>
</body>
</html>