
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table , tr, td {
	border :1px solid;
	border-collapse :collapse;
	margin :auto;
	}
tr,td{
	padding:4px 4px;
	}
</style>
</head>

<body>	
	<form action="ExeUpdateMember.jsp" method="post">
		<table>
			<tr>
				<td>id:</td><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>pass:</td><td><input type="text" name="pass"></td>
			</tr>
			<tr>
				<td>name:</td><td><input type="text" name="name"></td>
			</tr>
			<tr >
				<td colspan="2" style="text-align:center;"><input style ="width:50%;" type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>