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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
function send(){
	var f=document.frm;
		
/* 	if(f.USER_ID.value=="" && f.USER_ID.value!="${id}"){
		alert("올바른 아이디가 아닙니다!");
		f.USER_ID.focus();
		return;
	} */
		
	if(f.USER_PWD.value==""){
		alert("올바른 비밀번호가 아닙니다!");
		f.USER_PWD.focus();
		return;
	}
		
	if(f.USER_C_PWD.value==""){
		alert("탈퇴를 위해 올바른 비밀번호를 다시 한번 입력하십시오!");
		f.USER_C_PWD.focus();
		return;
	}
	
	if(f.USER_PWD.value!=f.USER_C_PWD.value){
		alert("비밀번호가 일치하지 않습니다!");
		f.USER_PWD.focus();
		return;
	}
	
	if(f.INPUT_CONFIRM.value!="회원탈퇴"){
		alert("탈퇴확인문장이 일치하지 않습니다!");
		f.INPUT_CONFIRM.focus();
		return;
	}
	
	f.submit();
	
}
</script>

</head>
<body>
	<!-- Withdraw Member -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="memberWithdraw.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="memberWithdraw.notFy1"/></li>
						<li><spring:message code="memberWithdraw.notFy2"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberSettingForm">
				<div class="MemberWithdrawHeadlineForm">
					<label class="MemberInfoHeadline"><spring:message code="memberWithdraw.memberWithdrawHeader"/></label>
				</div>
				<div class="InnerBox">
					<div id="MemberWthdraw-Box">
						<form:form name="frm" id="frm" method="post" action="withdrawMember_ok.do" commandName="com.sist.dao.MemberVO">
							<input type="hidden" value="<%=request.getAttribute("id") %>">
							<fieldset>
								<div class="WithdrawMember">
									<dl class="wm">
										<!-- Input ID -->
										<%-- <dt>
											<label for="USER_ID"><spring:message code="memberWithdraw.memberWithdrawId"/></label>
										</dt>
										<dd>
											<form:input name="USER_ID" id="USER_ID" class="" path="id" maxlength="16" value="${id}"/>
										</dd> --%>
										
										<!-- Input PASSWORD -->
										<dt>
											<label for="USER_PWD"><spring:message code="memberWithdraw.memberWithdrawPwd"/></label>
										</dt>
										<dd>
											<%-- <form:password name="USER_PWD" id="USER_PWD" class="" path="pwd" maxlength="16" value="${pwd}"/> --%>
											<input type="password" name="USER_PWD" id="USER_PWD" class="" maxlength="16">
										</dd>
										
										<!-- Input Confirm PASSWORD -->
										<dt>
											<label for="USER_C_PWD"><spring:message code="memberWithdraw.confirmMemberWithdrawPwd"/></label>
										</dt>
										<dd>
											<%-- <form:password name="USER_C_PWD" id="USER__C_PWD" class="" path="#" maxlength="16" value="${pwd}"/> --%>
											<input type="password" name="USER_C_PWD" id="USER_C_PWD" class="" maxlength="16">
										</dd>
										
										<!-- Input Confirm -->
										<dt>
											<label for="INPUT_CONFIRM" class="notcont"><spring:message code="memberWithdraw.notFy3"/></label>
										</dt>
										<dd>
											<%-- <form:input name="INPUT_CONFIRM" id="INPUT_CONFIRM" class="" path="#" maxlength="16" value=""/> --%>
											<input type="text" name="INPUT_CONFIRM" id="INPUT_CONFIRM" class="" maxlength="16">
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<input type="button" id="" class="" onclick="send()" value="<spring:message code="memberWithdraw.btOk"/>">
									<%-- <button id="" class=""><spring:message code="memberWithdraw.btOk"/></button> --%>
									<%-- <button id="" class=""><spring:message code="memberWithdraw.btCancel"/></button> --%>
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
