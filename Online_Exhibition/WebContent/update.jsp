<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "exhibition.ExhibitionDAO"  %>
<%@ page import = "exhibition.Exhibition"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
		<!-- Scripts -->
		<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="./resources/js/jquery.scrollex.min.js"></script>
		<script type="text/javascript" src="./resources/js/skel.min.js"></script>
		<script type="text/javascript" src="./resources/js/util.js"></script>
		<script type="text/javascript" src="./resources/js/main.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="./resources/css/main.css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서등록</title>
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
		
		Exhibition exhibition = new ExhibitionDAO().getExhibition(exhibitionID);
		if(!userID.equals(exhibition.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

	
%>

<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >


		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="#">Exhibition</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
		<%
		  	if(userID==null){
		  		

		%>
			<nav id="menu">
				<ul class="links">
					<li><a href="main.jsp">전시회 가기</a></li>
					<li><a href="addExhibition.jsp">전시품 등록하기</a></li>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="signup.jsp">회원가입</a></li>
				</ul>
			</nav>

			<%
		  	} else{
			%>
				<nav id="menu">
				<ul class="links">
					<li><a href="#"><%=userID %>님 환영합니다.</a></li>
					<li><a href="main.jsp">전시회 가기</a></li>
					<li><a href="userExhibition.jsp">내 전시회 가기</a></li>
					<li><a href="addExhibition.jsp">전시품 등록하기</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
				</ul>
			</nav>
			
			<%
				}
			%>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/slide001.jpg" alt="asdsad" />
					<div class="inner">
						<header>
							<p>여러분의 재능을 전시하세요</p>
							<h2>Online_Exhibition</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/slide02.jpg" alt="" />
					<div class="inner">
						<header>
							<p>여러분의 재능을 전시하세요</p>
							<h2>Online_Exhibition</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/slide03.jpg"  alt="" />
					<div class="inner">
						<header>
							<p>여러분의 재능을 전시하세요</p>
							<h2>Online_Exhibition</h2>
						</header>
					</div>
				</article>
				

				<article>
					<img src="${pageContext.request.contextPath}/resources/images/slide04.jpg"  alt="" />
					<div class="inner">
						<header>
							<p>여러분의 재능을 전시하세요</p>
							<h2>Online_Exhibition</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/slide05.jpg"  alt="" />
					<div class="inner">
						<header>
							<p>여러분의 재능을 전시하세요</p>
							<h2>Online_Exhibition</h2>
						</header>
					</div>
				</article>
			</section>
<br><br>
 <div class="container">
 	<div class="text-right">
		<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
	</div>
	
 <form  action="updateAction.jsp?exhibitionID=<%=exhibitionID%>" class="form-horizontal" method="post" enctype="multipart/form-data">
 <br>
 <div class="form-group row">
 <label class= "col-sm-2"><fmt:message key="title" /></label>
 	<div class="col-sm-5">
 <input type ="text" name="exhibitionTitle" class="form-control">
 	</div>
 </div>
 
 <br>

 <div class="form-group row">
 <label class= "col-sm-2"><fmt:message key="content" /></label>
 	<div class="col-sm-5">
 		<textarea name="exhibitionContent" cols="100" rows="10" class="form-control"></textarea>
 	</div>
 </div>

<br>
 
 <div class="form-group row">
 <label class= "col-sm-2"><fmt:message key="exhibitionImage" /></label>
 	<div class="col-sm-5">
 <input type ="file" name="file" class="form-control">
 	</div>
 </div>	
 
 <div class="form-group row">
 	<div class="col-sm-3">
 	<br><br>
 <input type ="submit" class="btn btn-primary" value="<fmt:message key="button" />" >
 	</div>
 </div>
 </form>
 </div>
 </fmt:bundle>
</body>
</html> 






