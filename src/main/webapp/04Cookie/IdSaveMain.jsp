<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "utils.CookieManager" %>
 <%
 String loginId = CookieManager.readCookie(request, "loginId");
 String cookieCheck = "";
 if(!loginId.equals("")){
	 cookieCheck = "checked";
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save ID</title>
</head>
<body>
<h2>Login page</h2>
<form action="IdSaveProcess.jsp" method="post">
ID: <input type="text" name="user_id" value="<%=loginId%>">
<input type="checkbox" name="save_check" value="Y" <%=cookieCheck %>>
Save ID
<br>
passward : <input type="text" name="user_pw">
<br>
<input type="submit" value="login">
</form>
</body>
</html>