<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼값 전송하기</h2>
	<form action="FromResult.jsp" name ="frm">
		이름 : <input type="text" name="name"><br/>
		성별 : <input type="radio" name="gender" value="Man">남자
		   	 <input type="radio" name="gender" value="Woman">여자<br/>
		학력 : 
		<select  name="grade">
			<option value="ele"> ele</option>
			<option value="mid"> mid</option>
			<option value="high"> high</option>
			<option value="uni"> uni</option>
		</select><br/>
		
		관심사항 :
			<input type="checkbox" name="inter" value="정치">정치
			<input type="checkbox" name="inter" value="경제">경제
			<input type="checkbox" name="inter" value="연예">연예
			<input type="checkbox" name="inter" value="운동">운동<br/>
		<input type="submit" value="전송하기">
	</form>
</body>
</html>