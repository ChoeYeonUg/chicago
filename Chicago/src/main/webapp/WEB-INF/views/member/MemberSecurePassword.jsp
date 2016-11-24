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
<meta>
<title>Made By ChoDing!!</title>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="css/mypagecss/memberinfo.css" rel="stylesheet" />

<!-- Theme skin -->
<link type="text/css" href="skins/default.css" rel="stylesheet" />

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	function send() {
		var f = document.frm;
		if (f.USER_Check_PWD.value == "") {
			alert("올바른 비밀번호가 아닙니다!");
			f.USER_Check_PWD.focus();
			return;
		}
		f.submit();
	}
</script>

</head>
<body>
	<div class="col-md-9">
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							<spring:message code="memberSecurePassword.header"/>
						</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;<spring:message code="memberSecurePassword.notFy1" /><br/>
							◎&nbsp;<spring:message code="memberSecurePassword.notFy2" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<!-- 비밀번호 입력 -->
		<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
		<form:form name="frm" id="frm" method="post" action="membersecurepwd_ok.do" class="login-page">
			<input type="hidden" name="typecheck" value="${typecheck}">
			<div class="login-header margin-bottom-30">
				<h4>비밀번호 확인</h4>
			</div>
			<div class="input-group margin-bottom-20">
				<span class="input-group-addon">
					<i class="fa fa-lock"></i>
				</span>
				<input placeholder="Password" class="form-control" type="password" name="USER_Check_PWD" id="USER_Check_PWD" />
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-6">
					<button class="btn btn-primary pull-right" type="button" onclick="send()">확인</button>
				</div>
			</div>
		</form:form>
		</div>
		<!-- 비밀번호 입력 끝 -->
	</div>

	
	
	<!-- Member Secure PASSWORD -->
		<%-- <div class="OutlineForm">
			<div class="MiddlelineSettingForm">
				<div class="HeadlineSettingForm">
					<div class="Headline">
						<spring:message code="memberSecurePassword.header" />
					</div>
					<div class="Notification">
						<ul class="notcont">
							<li><spring:message code="memberSecurePassword.notFy1" /></li>
							<li><spring:message code="memberSecurePassword.notFy2" /></li>
						</ul>
					</div>
				</div>
				<div class="MemberSettingForm">
					<div class="InnerBox">
						<div id="MemberSecurePassword-Box">
							<form:form name="frm" id="frm" method="post"
								action="membersecurepwd_ok.do">
								
								<input type="hidden" name="typecheck" value="${typecheck}">
								<fieldset>
									<div class="MemberSecurePwd">
										<dl class="msp">
											<!-- Input Confirm PASSWORD -->
											<dt>
												<label for="USER_Check_PWD"><spring:message
														code="memberSecurePassword.Password" /></label>
											</dt>
											<dd>
												<input type="password" name="USER_Check_PWD"
													id="USER_Check_PWD" class="" maxlength="16">
											</dd>
										</dl>
									</div>

									<!-- OK, Cancel Button -->
									<div>
										<input type="button" value="확인" onclick="send()">
										
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
