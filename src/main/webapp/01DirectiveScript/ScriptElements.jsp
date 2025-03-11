<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    public int add(int num1,int num2){
    	return num1 + num2;
    }
    public int mutiply(int num1,int num2){
    	return num1 * num2;
    }
    public int minus(int num1,int num2){
    	return num1 - num2;
    }
    public double divide(int num1,int num2){
    	return num1 / num2;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%
int result = add(10,20);
int num1 = 100;
int num2 = 50;
try {
	num1 = Integer.parseInt(request.getParameter("num1"));
	num2 = Integer.parseInt(request.getParameter("num2"));
}catch(Exception e){	
	
}
%>
덧셈 결과 1 : <%= result  %> <br />
덧셈 결과 2 : <%= add(30,40) %> <br />
덧셈 결과 3 : <%= add(num1,num2) %><br />
곱셈 결과   :<%= mutiply(num1,num2) %><br />
뺄셈 결과   :<%= minus(num1,num2) %><br />
나눗셈 결과  :<%= divide(num1,num2) %><br />
<% 
out.println("덧셈 결과 1 : "+ result +"<br/>");
out.println("덧셈 결과 2 : "+ add(30,40) +"<br/>");
%>
<br/>
<% 
out.println("덧셈 결과 1 : "+ result +"<br/>");
out.println("덧셈 결과 2 : "+ add(30,40) +"<br/>");
%>
</body>
</html>