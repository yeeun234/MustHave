<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table , tr, td {
border : 1px solid ;
border-collapse :collapse;
margin :auto;
}

</style>
</head>
<body>
	<form action="ExeUpdateBoard.jsp" method="post">
		<table>
			<tr>
				<td>title:</td><td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>content:</td><td><input type="text" name="content" style =" height: 100px;"></td>
			</tr>
			<tr>
				<td>id:</td>
							<td>  
								<select name="id" id="user_id">
	   								<option>musthave</option>
								    <option value="dohave">dohave</option>
								    <option value="willhave">willhave</option>
								</select>
							</td>
			</tr>
			<tr >
				<td colspan="2" style="text-align:center;"><input style ="width:50%;" type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>