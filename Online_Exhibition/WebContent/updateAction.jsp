<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "exhibition.ExhibitionDAO"  %>
<%@ page import = "exhibition.Exhibition"  %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>

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
String exhibitionFILENAME = multi.getFilesystemName("file");
String exhibitionTitle = multi.getParameter("exhibitionTitle");
String exhibitionContent = multi.getParameter("exhibitionContent");


if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을하세요.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	
}
int exhibitionID = 0;
if(request.getParameter("exhibitionID") != null ){
	exhibitionID = Integer.parseInt(request.getParameter("exhibitionID")); 
}

if(exhibitionID == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
	
}

Exhibition exhibition = new ExhibitionDAO().getExhibition(exhibitionID);
if(!userID.equals(exhibition.getUserID())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
}



else{
		if (multi.getParameter("exhibitionTitle") == null || multi.getParameter("exhibitionContent") == null
				|| multi.getFilesystemName("file") == null || multi.getFilesystemName("file").equals("")
			||	multi.getParameter("exhibitionTitle").equals("") || multi.getParameter("exhibitionContent").equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된사항이있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		
		ExhibitionDAO exhibitionDAO = new ExhibitionDAO();
		int result = exhibitionDAO.update(exhibitionID, exhibitionTitle, exhibitionContent, exhibitionFILENAME) ;
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정에 실패했습니다.')");
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