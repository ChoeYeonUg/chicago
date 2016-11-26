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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
function send(){
	var f=document.frm;
		
	if(f.USER_PWD.value==""){
		alert("올바른 비밀번호가 아닙니다!");
		f.USER_PWD.focus();
		return;
	}
		
 	if(f.USER_NewPWD.value==""){
		alert("새 비밀번호를 입력하십시오!");
		f.USER_NewPWD.focus();
		return;
	}
	
	if(f.USER_C_NewPWD.value==""){
		alert("비밀번호확인을 위해 새 비밀번호를 다시 입력하시오!");
		f.USER_C_NewPWD.focus();
		return;
	}
	
	if(f.USER_NewPWD.value!=f.USER_C_NewPWD.value){
		alert("새비밀번호와 비밀번호확인이 일치하지 않습니다!");
		f.USER_NewPWD.focus();
		return;
	}
	
	alert("비밀번호 수정이 완료되었습니다!");
	f.submit();
	
}
</script>
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
							<spring:message code="memberPasswordModify.header"/>
						</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;<spring:message code="memberPasswordModify.notFy1"/><br/>
							◎&nbsp;<spring:message code="memberPasswordModify.notFy2"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<!-- 비밀 번호 변경  -->
		<form:form name="frm" id="frm" method="post" action="modyfyMemberPwd_ok.do" commandName="com.sist.dao.MemberVO">
		<table>
			<tr>
				<th><spring:message code="memberPasswordModify.CurrentPassword"/></th>
				<td><input type="password" name="pwd" id="USER_PWD" maxlength="16" class="pwd"></td>
			</tr>
			<tr>
				<th><spring:message code="memberPasswordModify.NewPassword"/></th>
				<td><input type="password" name="USER_NewPWD" id="USER_NewPWD" class="pwd" maxlength="16"></td>
			</tr>
			<tr>
				<th><spring:message code="memberPasswordModify.ConfirmNewPassword"/></th>
				<td><input type="password" name="USER_C_NewPWD" id="USER_C_NewPWD" class="pwd" maxlength="16"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td align="right">
					<input type="button" onclick="send()" value="<spring:message code="memberPasswordModify.btOk"/>" class="btn total">
					<button name="" id="" class="btn total" onclick=""><spring:message code="memberPasswordModify.btCancel"/></button>
				</td>
			</tr>
		</table>
		</form:form>
		<!-- 비밀 번호 변경 끝 -->
	</div>
<%-- 
	<!-- Modify Member PASSWORD Member -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="memberPasswordModify.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="memberPasswordModify.notFy1"/></li>
						<li><spring:message code="memberPasswordModify.notFy2"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberSettingForm">
				<div class="ModifyMemberPwdHeadlineForm">
					<label class="ModifyMemberPwdHeadline"><spring:message code="memberPasswordModify.modifyPasswordheader"/></label>
				</div>
				<div class="InnerBox">
					<div id="ModifyMemberPassword-Box">
						<form:form method="post" action="modyfyMemberPwd_ok" commandName="member">
						<form:form name="frm" id="frm" method="post" action="modyfyMemberPwd_ok.do" commandName="com.sist.dao.MemberVO">
					
						<form:hidden name="" id="" class="" path="<%=session.getAttribute("id") %>" value="<%=session.getAttribute("id") %>"/>
							<fieldset>
								<div class="ModifyMemberPwd">
									<dl class="mmp">
										<!-- Input Current PASSWORD -->
										<dt>
											<label for="USER_PWD"><spring:message code="memberPasswordModify.CurrentPassword"/></label>
										</dt>
										<dd>
											<form:password name="USER_PWD" id="USER_PWD" class="" path="#" maxlength="16" value="${pwd}"/>
											<input type="password" name="pwd" id="USER_PWD" class="" maxlength="16">
										</dd>
										
										<!-- Input New PASSWORD -->
										<dt>
											<label for="USER_NewPWD"><spring:message code="memberPasswordModify.NewPassword"/></label>
										</dt>
										<dd>
											<input type="password" name="USER_NewPWD" id="USER_NewPWD" class="" maxlength="16">
										</dd>
										
										<!-- Input Confirm New PASSWORD -->
										<dt>
											<label for="USER_C_NewPWD"><spring:message code="memberPasswordModify.ConfirmNewPassword"/></label>
										</dt>
										<dd>
											<input type="password" name="USER_C_NewPWD" id="USER_C_NewPWD" class="" maxlength="16">
										</dd>
										
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<button name="" id="" class="" onclick="send()"><spring:message code="memberPasswordModify.btOk"/></button>
									<input type="button" onclick="send()" value="<spring:message code="memberPasswordModify.btOk"/>">
									<button name="" id="" class="" onclick=""><spring:message code="memberPasswordModify.btCancel"/></button>
									<form:button name="" id="" class="" onclick="send()"><spring:message code="memberPasswordModify.btOk"/></form:button>
									<form:button name="" id="" class="" onclick="javascript:history.back()"><spring:message code="memberPasswordModify.btCancel"/></form:button>
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
