<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${ test }</h2>
	<script >
	function requestAction(frm,met) {
		if(met ==1 ){
			frm.method = 'get';
		}else{
			frm.method = 'post';
		}
		frm.submit();
	}
	</script>
	
	<h2>서블릿의 수명 주기 메서드</h2>
	
	<form action="./LifeCycle.do">
		<input type="button" value="get 방식 요청" onclick="requestAction(this.form,1);">
		<input type="button" value="post 방식 요청" onclick="requestAction(this.form,2);">
	</form>
</body>
</html>