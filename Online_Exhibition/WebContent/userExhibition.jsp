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

		<!-- One -->
		
<form method="get" action="Search_main.jsp">
<br>
	<div class="row uniform">
		<div class="9u 12u$(small)">
			<input type="text" name="search" id="query" value="" placeholder="Query">
		</div>
		<div class="3u$ 12u$(small)">
		<input type="submit" value="Search" class="fit">
	</div>
	</div>
</form>
		

		
			
	

		
				<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">
	
	<%
		
		ExhibitionDAO exhibitionDAO = new ExhibitionDAO();
		ArrayList<Exhibition> list = exhibitionDAO.getUserList(userID, pageNumber);
		for(int i=0; i< list.size(); i++){

	%>
						<div>
							<div class="box">
								<div class="image fit">
									<img src="${pageContext.request.contextPath}/resources/images/<%=list.get(i).getExhibitionFILENAME()%>" alt="asdasdas" />
								</div>
								<div class="content">
									<header class="align-center">
										<p>maecenas sapien feugiat ex purus</p>
										<h2><%=list.get(i).getExhibitionTitle()%></h2>
									</header>
									<p><%=list.get(i).getExhibitionContent()%> </p>
									<footer class="align-center">
										<a href="view.jsp?exhibitionID=<%=list.get(i).getExhibitionID()%>" class="button alt">더보기</a>
										<a href="likeAction.jsp?exhibitionID=<%=list.get(i).getExhibitionID()%>" class="button alt">추천</a>
										<p>추천수 <%=list.get(i).getLikeCount()%></p>
									</footer>
								</div>
							</div>
						</div>
		
	<%
			}
	%>

					</div>
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