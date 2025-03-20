<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>List Collection </h4>
	<%
	ArrayList<Person> pList = new ArrayList<>();
	pList.add(new Person("성삼문",55));	
 	pList.add(new Person("박팽년",65));	
	%>
	<c:set var ="personList" value="<%=pList %>" scope="request"/>
	
	<ul>
		<li>이름 :${requestScope.personList[0].name }</li>
		<li>나이 :${personList[0].age }</li>
	</ul>
	
	<h4>Map Collection </h4>
	<%
	Map<String , Person> pMap = new HashMap<>();
	pMap.put("parsonArg1",new Person("하위지",535));	
	pMap.put("parsonArg2",new Person("이개",625));	
	%>
	<c:set var ="personMap" value="<%=pMap %>" scope="request"/>
	
	<ul>
		<li>이름 :${requestScope.personMap.parsonArg2.name }</li>
		<li>나이 :${personMap.parsonArg2.age }</li>
	</ul>
	
</body>
</html>