<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "exhibition.ExhibitionDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="exhibition" class="exhibition.Exhibition" scope="page" />
<jsp:setProperty name = "exhibition" property = "exhibitionTitle" />
<jsp:setProperty name = "exhibition" property = "exhibitionContent" />
    
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
</head>
<body>

<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}


String filename ="";
String realFolder = request.getSession().getServletContext().getRealPath("/resources/images");
String encType ="utf-8";
int maxSize = 5*1024*1024;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String fileRealName = multi.getFilesystemName("file");

String exhibitionTitle = multi.getParameter("exhibitionTitle");
String exhibitionContent = multi.getParameter("exhibitionContent");


if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을하세요.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	
} else{
	


	if (exhibitionTitle == null || exhibitionContent == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된사항이있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		
		ExhibitionDAO exhibitionDAO = new ExhibitionDAO();
		int result = exhibitionDAO.write(exhibitionTitle, userID, exhibitionContent,fileRealName);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
			
		}
	
	

	}



	

	
	
%>


</body>
</html>