<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Annotation 매핑 후 Servlet에 직접 출력하기</h2>
<!-- 	<form action="../MyServlet/DirectServletPrint.do" method="post" > 	localhost:8080/MustHave/12Servlet/DirectServletPrint.do -->
<!-- 	<form action="./DirectServletPrint.do" method="post" > 	localhost:8080/MustHave/12Servlet/DirectServletPrint.do -->
	<form action="../DirectServletPrint.do" method="post" > <!-- localhost:8080/MustHave/DirectServletPrint.do -->
		<input type="submit" value="바로가기">
	</form>
</body>
</html>