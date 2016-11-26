<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<!-- <link rel="stylesheet" href="board_css/bootstrap.css" rel="stylesheet"> -->
<!-- Template CSS -->
<!-- <link rel="stylesheet" href="board_css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="board_css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/custom.css" rel="stylesheet"> -->

<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Raleway:100,300,400"
	type="text/css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	type="text/css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- NoticBoard -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- Typography -->
						<li class="list-group-item list-toggle"><a href="noticeboard.do"><spring:message
									code="header.noticBoard" /></a></li>
						<!-- End NoticBoard -->
						<!-- faqBoard -->
						<li class="list-group-item list-toggle"><a href="faqboard.do?faq_category=0"><spring:message
									code="header.faqBoard" /></a></li>
						<!-- End faqBoard -->
						<!-- secretBoard -->
						<li class="list-group-item list-toggle"><a href="secretboard.do"><spring:message
									code="header.secretBoard" /></a></li>
						<!-- End faqBoard -->
						<!-- reviewBoard -->
						<li class="list-group-item list-toggle"><a href="reviewboard.do">리뷰게시판</a></li>
						<!-- End reviewBoard -->
						
						
					</ul>
				</div>
				<!-- End Sidebar Menu -->

				<div class="col-md-9">
					<jsp:include page="${boardjsp}"></jsp:include>

				</div>



				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
	<!-- === END CONTENT === -->

</body>
</html>