<%@ page contentType = "text/html; charset=utf-8" %>
<!DOCTYPE html>
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
		<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
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


<div class="jumbotron">
	<div class="container">
		<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
	</div>
</div>
<div class="container">
	<p><a href="main.jsp" class= "button alt small">전시회 돌아가기</a></p>
</div>

</body>
</html>