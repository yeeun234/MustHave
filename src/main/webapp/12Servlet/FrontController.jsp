<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
	${resultValue }
	<ol>
		<li>URI : ${uri }</li>
		<li>요청명 : ${commandStr }</li>
		
	</ol>
	<h1>jsp에서 실행시 클릭 할 것</h1>
	<ul>
		<li><a href="../Servlet/regist.one">회원가입</a></li>
		<li><a href="../Servlet/login.one">로그인</a></li>
		<li><a href="../Servlet/freeboard.one">자유게시판</a></li>
	</ul>
	
	<h1>servlet에서 실행시 클릭 할 것</h1>
<!-- 	url을 확인하면 다름.  -->
	<ul>
		<li><a href="./Servlet/regist.one">회원가입</a></li>
		<li><a href="./Servlet/login.one">로그인</a></li>
		<li><a href="./Servlet/freeboard.one">자유게시판</a></li>
	</ul>
</body>
</html>