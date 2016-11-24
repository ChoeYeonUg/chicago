<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta >
<title>Made By ChoDing!!</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="mypage_css/mypage.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script src="js/animate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>

</head>
<body>
	<!-- MyPageMainOutlineForm -->
	<div id="MyPageMainOutlineForm" class="">
		<div id="MyPageMainMiddlelineForm" class="">
			<!-- MyPageHeadlineForm -->
			<hr/>
			<div id="MyPageHeadlineForm" class="">
				<div id="MyPageHeadline">
				</div>
			</div>
			<hr/>
			
			<!-- My Page Content -->
			<div id="MyPageContent" class="">
				<!-- Orderlist Content -->
				<div class="HeadlineSettingForm">
					<div class="Headline">
						<spring:message code="OrderListMain.header"/>
					</div>
					<div class="Notification">
						<ul class="notcont">
							<li><spring:message code="OrderListMain.notFy1"/></li>
							<li><spring:message code="OrderListMain.notFy2"/></li>
						</ul>
					</div>
				</div>
				<div id="OrderlistContent" class="">
					<div>
						<!-- Begine MyPage Orderlist Selection -->
						<div id="OrderPeopleType" class="">
							<a href="memberOrderList.do"><spring:message code="OrderListMain.btMember"/></a>
							<ul class="notcont">
								<li>
									<spring:message code="OrderListMain.notFy3"/>
									&nbsp;
									<a href="clause.do" target="" title="" id="" class=""><spring:message code="OrderListMain.btMemberJoin"/></a>
								</li>
							</ul>
						</div>
						<!-- End Modify Member Info -->
					</div>
				</div>
				<!-- End My Page Content -->
			<hr/>
			</div>
		</div>
	</div>
</body>
</html>
