<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "exhibition.ExhibitionDAO"  %>
<%@ page import = "exhibition.Exhibition"  %>
<%@ page import = "likey.LikeyDAO" %>
    
    <%!
    	public static String getClientIP(HttpServletRequest request){
    	String ip = request.getHeader("X-FORWARDED-FOR");
    	if(ip == null || ip.length()==0){
    		ip = request.getHeader("Proxy-Client-IP");
    	}
    	if(ip == null || ip.length()==0){
    		ip = request.getHeader("WL-Proxy-Client-IP");
    	}
    	if(ip == null || ip.length()==0){
    		ip = request.getRemoteAddr();
    	}	
    	return ip;
    }
    %>
    
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
		
		if(userID ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
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
		
		ExhibitionDAO exhibitionDAO = new ExhibitionDAO();
		LikeyDAO likeyDAO = new LikeyDAO();
		int result = likeyDAO.like(userID, exhibitionID, getClientIP(request));
		if(result == 1){
			
			result = exhibitionDAO.like(exhibitionID);
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('추천이 완료되었습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터 베이스 오류입니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				
			}

			
		}else{
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 추천을 누른글입니다..')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		}
	
%>

</body>
</html>