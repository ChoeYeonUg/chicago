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
<link href="css/mypagecss/memberinfo.css" rel="stylesheet" />

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
function send(){
	
	// 곧바로 현재 페이지 주소 출력
	document.writeln(location.href);


	// 변수에 넣어서 출력
	var s = location.href;
	document.writeln(s);

	
	
	var f=document.frm;
		
	if(f.USER_Check_PWD.value==""){
		alert("올바른 비밀번호가 아닙니다!");
		f.USER_Check_PWD.focus();
		return;
	}
	
	f.submit();
	
}
</script>

</head>
<body>
	<!-- Member Secure PASSWORD -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="memberSecurePassword.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="memberSecurePassword.notFy1"/></li>
						<li><spring:message code="memberSecurePassword.notFy2"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberSettingForm">
				<div class="InnerBox">
					<div id="MemberSecurePassword-Box">
						<form:form name="frm" id="frm" method="post" action="membersecurepwd_ok.do">
						<%-- <input type="hidden" value="<%=request.getAttribute("id") %>"> commandName="memberVO" --%>
						<input type="hidden" name="typecheck" value="${typecheck}">
							<fieldset>
								<div class="MemberSecurePwd">
									<dl class="msp">
										<!-- Input Confirm PASSWORD -->
										<dt>
											<label for="USER_Check_PWD"><spring:message code="memberSecurePassword.Password"/></label>
										</dt>
										<dd>
											<input type="password" name="USER_Check_PWD" id="USER_Check_PWD" class="" maxlength="16">
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<input type="button" value="확인" onclick="send()">
									<%-- <form:button name="" id="" class="" onclick="send()"><spring:message code="memberSecurePassword.btOk"/></form:button>
									<form:button name="" id="" class="" onclick="javascript:history.back()"><spring:message code="memberSecurePassword.btCancel"/></form:button> --%>
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
