<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "exhibition.ExhibitionDAO"  %>
<%@ page import = "exhibition.Exhibition"  %>
<%@ page import = "java.util.ArrayList"  %>
<%@ page import = "java.io.OutputStream"%>
<%@ page import = "java.io.InputStream"%>
<%@ page import = "java.util.*"%>
<!DOCTYPE HTML>
<html>
	<head>
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
		
	<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null ){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		int exhibitionID = 0;
		if(request.getParameter("exhibitionID") != null ){
			exhibitionID = Integer.parseInt(request.getParameter("exhibitionID")); 
		}
		if(exhibitionID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			
		}
		

		Exhibition exhibition = new ExhibitionDAO().getExhibition(exhibitionID);
		
	%>

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




		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>아이디:<%= exhibition.getUserID() %></p>
								<br>
								<h2><%= exhibition.getExhibitionTitle()%></h2>
							</header>
							<div class="image fit">
									<img src="${pageContext.request.contextPath}/resources/images/<%= exhibition.getExhibitionFILENAME()%>" alt="asdasdas" />
								</div>
							<p><%=exhibition.getExhibitionDATE() %></p>
							<h3><%=exhibition.getExhibitionContent() %></h3>
					</div>
			<%
				if(userID != null && userID.equals(exhibition.getUserID())){
			%>	
					<a href="update.jsp?exhibitionID=<%=exhibitionID%>" class="button alt small">수정</a>&nbsp;&nbsp;&nbsp;<a href="deleteAction.jsp?exhibitionID=<%= exhibitionID%>" class="button alt small">삭제</a>
			<%
				}
			%>	
		
				</div>
			</section>
		

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>
	</body>
</html>