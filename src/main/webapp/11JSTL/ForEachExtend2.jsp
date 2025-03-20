<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>List Collection</h4>
	<%
	LinkedList<Person> lists = new LinkedList<>();
	lists.add(new Person("김시", 33));
	lists.add(new Person("박시", 53));
	lists.add(new Person("유시", 83));
	%>

	<c:set var="lists" value="<%=lists%>">
	</c:set>
	<c:forEach items="${lists }" var="list">
		<li>이름 : ${lists.name }, 나이 : ${lists.age }</li>
	</c:forEach>
	
	<h4>Map Collection </h4>
	<%
	Map<String , Person> maps = new HashMap<>();
	maps.put("1st",new Person("하위지",535));	
	maps.put("2rd",new Person("이개",625));	
	maps.put("3rd",new Person("김민",625));	
	%>
	<c:set var="maps" value="<%=maps%>">
	</c:set>
	<c:forEach items="${maps }" var="map">
		<li>
		key =>${map.key} 이름 : ${map.value.name },  나이 : ${map.value.age }</li>
	</c:forEach>
</body>
</html>