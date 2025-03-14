<%@page import="Membership.MemberDTO"%>
<%@page import="Membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");
    
    String Driver = application.getInitParameter("MySQLDriver");
    String Url = application.getInitParameter("MySQLURL");
    String Id = application.getInitParameter("MySQLId");
    String Pwd = application.getInitParameter("MySQLPwd");
    
    MemberDAO dao = new MemberDAO(Driver,Url,Id,Pwd);
    MemberDTO memberDTO =  dao.getMemberDTO(userId, userPwd);
    dao.close();
    
    if(memberDTO.getId() != null){
    	session.setAttribute("UserId", memberDTO.getId());
    	session.setAttribute("UserName", memberDTO.getName());
    	response.sendRedirect("LoginForm.jsp");
    }
    else{
    	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
    	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>