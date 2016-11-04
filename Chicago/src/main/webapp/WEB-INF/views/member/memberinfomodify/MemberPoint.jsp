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
<link href="css/mypage_css/memberinfo.css" rel="stylesheet" />

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
	<!-- Member Point Confirm -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="MemberPoint.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="MemberPoint.notFy1"/></li>
						<li><spring:message code="MemberPoint.notFy2"/></li>
						<li><spring:message code="MemberPoint.notFy3"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberPointSettingForm">
				<div class="MemberPointHeadlineForm">
					<label class="MemberPointHeadline"><spring:message code="MemberPoint.myPointheader"/></label>
				</div>
				<div class="InnerBox">
					<div id="MemberPoint-Box">
						<form:form method="get" action="" name="frm" enctype="multipart/form-data" modelAttribute="uploadForm">
						<input type="hidden" name="" value=""/>
						<input type="hidden" name="" value=""/>
						<input type="hidden" name="" value=""/>
							<fieldset>
								<div class="PointInfo">
									
									<dl class="pi">
										<!-- View GRADE -->
										<dt>
											<label for="USER_GRADE"><spring:message code="MemberPoint.myGrade"/></label>
										</dt>
										<dd>
											<h3></h3>
										</dd>
										
										<!-- View POINT -->
										<dt>
											<label for="USER_POINT"><spring:message code="MemberPoint.myPoint"/></label>
										</dt>
										<dd>
											<h3><spring:message code="MemberPoint.myPointj"/></h3>
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<button id="" class=""><spring:message code="MemberPoint.btMain"/></button>
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
