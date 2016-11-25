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
<style type="text/css">
	th {
		text-align: left;
		width: 20%;
		
	}
	
	th, td {
		height: 50px;
		vertical-align: middle;
		margin: 1px;
		padding: 1px;
	}
	
	.pwd {
		border-top: 0px;
		border-right: 0px;
		border-left: 0px;
		border-bottom: #505050 1px solid;
	}
</style>
</head>
<body>
	<div class="col-md-9">
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							<spring:message code="MemberPoint.header"/>
						</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;<spring:message code="MemberPoint.notFy1"/><br/>
							◎&nbsp;<spring:message code="MemberPoint.notFy2"/><br/>
							◎&nbsp;<spring:message code="MemberPoint.notFy3"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<form:form commandName="com.sist.dao.MemberVO">
		<input type="hidden" value="<%=request.getAttribute("id") %>">
			<table>
				<tr>
					<th>등급</th>
					<td>${gradename}</td>
				</tr>
				<tr>
					<th>사용 가능 포인트</th>
					<td>${vo.point}점</td>
				</tr>
			</table>
			<table>
				<tr><td align="right"><button class="btn total"><spring:message code="MemberPoint.btMain"/></button></td></tr>
			</table>
		</form:form>
	</div>
	<%-- <!-- Member Point Confirm -->
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
							<form:form commandName="com.sist.dao.MemberVO">
							<input type="hidden" value="<%=request.getAttribute("id") %>">
							<fieldset>
								<div class="PointInfo">
									
									<dl class="pi">
										<!-- View GRADE -->
										<dt>
											<label for="USER_GRADE"><spring:message code="MemberPoint.myGrade"/></label>
										</dt>
										<dd>
											<h3>${gradename}</h3>
										</dd>
										
										<!-- View POINT -->
										<dt>
											<label for="USER_POINT"><spring:message code="MemberPoint.myPoint"/></label>
										</dt>
										<dd>
											<h3>${vo.point}<spring:message code="MemberPoint.myPointj"/></h3>
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
	</div> --%>
</body>
</html>
