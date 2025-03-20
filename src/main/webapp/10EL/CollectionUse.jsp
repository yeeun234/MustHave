<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List Collection</h2>
<%
	List<Object> aList= new ArrayList<>();
	aList.add("청해진");
	aList.add(new Person("장보고", 28));
	pageContext.setAttribute("Ocean", aList);
%>

<ul>
	<li>0 th element : ${Ocean[0] }</li>
	<li>1 st element : ${Ocean[1].name }</li>
	<li>2 ed element : ${Ocean[2] }</li>
</ul>
	<h2>Map Collection</h2>
<%
	Map<String,String> map = new HashMap<>();
	map.put("当","ㅎㅎ");
	map.put("eng","English");
	pageContext.setAttribute("King", map);
%>
	<ul>
	<li>Eng key : ${King["eng"] },${King['eng'] },${King.eng }</li>
	<li>한글 key : ${King["当"] },${King['当'] },${King.当 }</li>
</ul>

</body>
</html>