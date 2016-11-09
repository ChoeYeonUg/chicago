<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/header1.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>
<script src="js/portfolio/jquery.quicksand.js"></script>
<script src="js/portfolio/setting.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>
</head>
<body>
	<!-- <div class="wrapper row1"> -->
	<header id="header" class="hoc clear">
<!--         <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><span>C</span>hicago</a>
                </div>
                 -->
                 
		<div id="logo" class="fl_left">
			<h1><a class="navbar-hou" href="index.html"><span class="main-hou">C</span>hicago</a></h1>
		</div>
                 
                <nav id="mainav" class="fl_right">
       				 <ul class="clear">
          				<li><a href="store.do"><spring:message code="header.menu"/></a></li>
          				<li><a href="book.do"><spring:message code="header.book"/></a>
            				<!-- <ul>class="drop" 
              					<li><a href="#"><spring:message code="header.major"/></a></li>
                                <li><a href="#"><spring:message code="header.novel"/></a></li>
								<li><a href="#"><spring:message code="header.poem"/></a></li>
								<li><a href="#"><spring:message code="header.essay"/></a></li>
								<li><a href="#"><spring:message code="header.fairytale"/></a></li>
            				</ul> -->
          				</li>
          				<li><a href="writer.do"><spring:message code="header.writer"/></a> </li>
          				<li><a class="drop" href="event.do"><spring:message code="header.event"/></a>
            				<ul>
              					<li><a href="event.do"><spring:message code="header.eventView"/></a></li>
                                <li><a href="#"><spring:message code="header.month"/></a></li>
								<li><a href="#"><spring:message code="header.week"/></a></li>
								<li><a href="#"><spring:message code="header.day"/></a></li>
            				</ul>
          				</li>
          				<li><a class="drop" href="noticeboard.do"><spring:message code="header.board"/></a>
            				<ul>
              					<li><a href="noticeboard.do"><spring:message code="header.noticBoard"/></a></li>
                                <li><a href="faqboard.do?faq_category=0"><spring:message code="header.faqBoard"/></a></li>
								<li><a href="secretboard.do"><spring:message code="header.secretBoard"/></a></li>
								<li><a href="reviewboard.do">리뷰보드</a></li>
            				</ul>
          				</li>
          				<!-- Modified By Choding -->
          		   		<li><a class="drop" href="mypage.do"><spring:message code="header.mypage"/></a>
            				<ul>
              					<li><a href="memberinfo.do"><spring:message code="header.modifi"/></a></li>
                                <li><a href="order.do"><spring:message code="header.ppl"/></a></li>
								<li><a href="wish.do"><spring:message code="header.egd"/></a></li>
								<li><a href="memberquestion.do"><spring:message code="header.qu"/></a></li>
            				</ul>
            			</li>
          				<li><a href="sb.do"><spring:message code="header.sb"/></a></li>
          				<c:if test="${garde ne 'null' && grade eq 0 }">
	          				<li><a class="drop" href="sysop.do"><spring:message code="header.saMenu"/></a>
	            				<ul>
	                                <li><a href="member_management.do"><spring:message code="header.saMember"/></a></li>
	                                <li><a href="book_management.do"><spring:message code="header.saBook"/></a></li>
									<li><a href="board_management.do"><spring:message code="header.saBoard"/></a></li>
									<li><a href="sales_management.do"><spring:message code="header.saList"/></a></li>
	            				</ul>
	          				</li>
          				</c:if>
          				<li><a class="drop" href="login.do"><spring:message code="header.login"/></a>
            				<ul>
                                <li><a href="login.do"><spring:message code="header.login"/></a></li>
                                <li><a href="#"><spring:message code="header.nm"/></a></li>
            				</ul>
          				</li>
        			</ul>
      			</nav>
                
<%--                 <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li><a href="store.do"><spring:message code="header.menu"/></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.book"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="book.do"><spring:message code="header.major"/></a></li>
                                <li><a href="#"><spring:message code="header.novel"/></a></li>
								<li><a href="#"><spring:message code="header.poem"/></a></li>
								<li><a href="#"><spring:message code="header.essay"/></a></li>
								<li><a href="#"><spring:message code="header.fairytale"/></a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="event.do" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.event"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="event.do"><spring:message code="header.eventView"/></a></li>
                                <li><a href="#"><spring:message code="header.month"/></a></li>
								<li><a href="#"><spring:message code="header.week"/></a></li>
								<li><a href="#"><spring:message code="header.day"/></a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.board"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                 <li><a href="noticeboard.do"><spring:message code="header.noticBoard"/></a></li>
                                <li><a href="faqboard.do?faq_category=0"><spring:message code="header.faqBoard"/></a></li>
								<li><a href="secretboard.do"><spring:message code="header.secretBoard"/></a></li>
								<li><a href="reviewboard.do">리뷰보드</a></li>
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.mypage"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="member.do"><spring:message code="header.modifi"/></a></li>
                                <li><a href="#"><spring:message code="header.ppl"/></a></li>
								<li><a href="#"><spring:message code="header.egd"/></a></li>
								<li><a href="#"><spring:message code="header.qu"/></a></li>
                            </ul>
                        </li>
                        <li><a href="sb.do"><spring:message code="header.sb"/></a></li>
                        
						<li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.saMenu"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="sysop.do"><spring:message code="header.saMember"/></a></li>
                                <li><a href="#"><spring:message code="header.saBook"/></a></li>
								<li><a href="#"><spring:message code="header.saBoard"/></a></li>
								<li><a href="#"><spring:message code="header.saList"/></a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><spring:message code="header.login"/> <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="login.do"><spring:message code="header.login"/></a></li>
                                <li><a href="#"><spring:message code="header.nm"/></a></li>
                            </ul>
                        </li>
                    </ul>
                </div> 
            </div>
        </div>
        --%>
	</header>
	

</body>
</html>