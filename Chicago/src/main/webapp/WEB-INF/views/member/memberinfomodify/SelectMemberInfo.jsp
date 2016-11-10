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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<!-- Member Info Modify -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					너님 정보
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li>메인이다1</li>
						<li>메인이다2</li>
						<li>메인이다3</li>
					</ul>
				</div>
			</div>
			<div class="MemberInfoSettingForm">
				<div class="MemberInfoHeadlineForm">
					<label class="MemberInfoHeadline">너님 정보</label>
				</div>
				<div class="InnerBox">
					<div id="MemberInfo-Box">
							<form:form commandName="com.sist.dao.MemberVO">
							<input type="hidden" value="<%=request.getAttribute("id") %>">
							<input type="hidden"  name="typecheck" value="${typecheck}">
							<fieldset>
								<div class="InfoModify">
									<dl class="mim">
										<!-- View NAME -->
										<dt>
											<label for="USER_NAME">이름</label>
										</dt>
										<dd>
											${vo.name}
										</dd>
										
										<!-- View GENDER -->
										<dt>
											<label for="USER_GENDER">성별</label>
										</dt>
										<dd>
											<c:if test="${vo.gender == 1 }">
												<spring:message code="memberInfoModify.genderMan"/>
											</c:if>
											<c:if test="${vo.gender == 2 }">
												<spring:message code="memberInfoModify.genderWoman"/>
											</c:if>
																					
											<%-- <spring:message code="memberInfoModify.genderMan"/> : <form:radiobutton name="" id="USER_M_GENDER" class="" path="" value="" disabled="true"/> --%>
											&nbsp;
											<%-- <spring:message code="memberInfoModify.genderWoman"/> : <form:radiobutton name="" id="USER_W_GENDER" class="" path="" value="" disabled="true"/> --%>
										</dd>
										
										<!-- View ID -->
										<dt>
											<label for="USER_ID">아이디</label>
										</dt>
										<dd>
											${vo.id}
										</dd>
										
										<!-- Modify ADRESS -->
										<dt>
											<label for="USER_ADDRESS">주소</label>
										</dt>
										<dd>
											${aipcode}&nbsp;${vo.addr}
										</dd>
										
										<!-- Modify Email -->
										<dt>
											<label for="USER_EMAIL">이메일</label>
										</dt>
										<dd>
											${vo.email}
										</dd>
										
										<!-- Modify Phone -->
										<dt>
											<label for="USER_PHONE">전화번호</label>
										</dt>
										<dd>
											${vo.phone}
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<a href="modyfyMemberInfo.do">회원수정하기<a>
									<input type="button" value="<spring:message code="memberInfoModify.btOk"/>" onclick="send()">
									<%-- <form:button name="" id="" class="" onclick="javascript:history.back()"><spring:message code="memberInfoModify.btCancel"/></form:button> --%>
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
