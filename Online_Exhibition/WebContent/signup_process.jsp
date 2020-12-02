<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name = "user" property = "userID" />
<jsp:setProperty name = "user" property = "userPassword" />
<jsp:setProperty name = "user" property = "userEmail" />
     
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

	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	
	}

	request.setCharacterEncoding("UTF-8");
	String password2 = request.getParameter("userPassword2");
	String password1 = request.getParameter("userPassword");
	
	if(!password1.equals(password2)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호와 비밀번호확인이 일치하지않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		
	}
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserEmail() == null ){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

	}
		
	
%>

</body>
</html>