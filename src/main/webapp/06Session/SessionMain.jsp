<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	
	long creationTime = session.getCreationTime();
	String creationTimeStr = dateFormat.format(new Date(creationTime));
	
	long lastTime = session.getLastAccessedTime();
	String lastTimerStr = dateFormat.format(new Date(lastTime));
%>
</head>
<body>
<h2>Session 설정 확인</h2>
<ul>
<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
<li>세션 아이디 : <%=session.getId() %> </li>
<li>최초 요청 시각 : <%=creationTimeStr %></li>
<li>마지막 요청 시각 : <%= lastTimerStr	 %> </li>
</ul>

</body>
</html>