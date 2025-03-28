<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="utils.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%
 	String saveDirectory = application.getRealPath("/Uploads");
 	String saveFilename = request.getParameter("sName");
 	String orignalFilename = request.getParameter("oName");
 	
 	try{
 		File file = new File(saveDirectory , saveFilename);
 		InputStream instream = new FileInputStream(file);
 		
 		String client = request.getHeader("User-Agent");
 		if(client.indexOf("WOW64") == -1) {
 			orignalFilename = new String(orignalFilename.getBytes("UTF-8"),"ISO-8859-1");
 		}
 		else{
 			orignalFilename = new String(orignalFilename.getBytes("KSC5601"),"ISO-8859-1");
 			
 		}
 		response.reset();
 		response.setContentType("application/octet-stream");
 		response.setHeader("Content-Disposition","attachment; filename=\""+orignalFilename+"\"");
 		response.setHeader("Content-Length",""+file.length());
 		
 		out.clear();
 		
 		OutputStream outStream = response.getOutputStream();
 		
 		byte b[] = new byte[(int)file.length()];
 		int readBuffer = 0;
 		while( (readBuffer = instream.read(b))>0){
 			outStream.write(b,0,readBuffer);
 		}
 		
 		instream.close();
 		outStream.close();
 	}
 	catch(FileNotFoundException e){
 		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
 		
 	}
 	catch(Exception e){
 		JSFunction.alertBack("예외가 발생하였습니다.", out);
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