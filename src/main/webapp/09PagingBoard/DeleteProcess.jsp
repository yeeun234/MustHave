<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);

BoardDTO dto = new BoardDTO();

dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult=dao.deletPost(dto);
	dao.close();
	
	if(delResult==1){
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
		
	}
}
else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.",out);
	return;
}
dao.close();
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