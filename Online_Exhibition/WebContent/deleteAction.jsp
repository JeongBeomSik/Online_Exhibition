<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "exhibition.ExhibitionDAO"  %>
<%@ page import = "exhibition.Exhibition"  %>
<% request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}



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
} else{
		
	
		
		ExhibitionDAO exhibitionDAO = new ExhibitionDAO();
		int result = exhibitionDAO.delete(exhibitionID);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
			
}	

	
	
%>
</body>
</html>