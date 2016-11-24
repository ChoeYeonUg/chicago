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
					어드레스
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="MemberInfoSettingForm">
				<div class="MemberInfoHeadlineForm">
					<label class="MemberInfoHeadline"></label>
				</div>
				<div class="InnerBox">
					<div id="MemberInfo-Box">
							<form:form commandName="com.sist.dao.AddressVO">
							<input type="hidden" value="<%=request.getAttribute("id") %>">
							<input type="hidden"  name="typecheck" value="${typecheck}">
							<fieldset>
								<div class="InfoModify">
									<dl class="mim">
										<dt>
											<label for="ADDRESS_1">주소1</label>
										</dt>
										<dd>
											${zipcode1}
											&nbsp;
											${addr1}
										</dd>
										<dt>
											<label for="ADDRESS_2">주소2</label>
										</dt>
										<dd>
											${zipcode2}
											&nbsp;
											${addr2}
										</dd>
										<dt>
											<label for="ADDRESS_3">주소3</label>
										</dt>
										<dd>
											${zipcode3}
											&nbsp;
											${addr3}
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<a href="insertMemberAddrs.do">입력하기</a>
									<a href="modifyMemberAddrs.do">수정하기</a>
									<a href="main.do">메인으로 가기</a>
									<%-- <input type="button" value="<spring:message code="memberInfoModify.btOk"/>" onclick="send()">
									<form:button name="" id="" class="" onclick="javascript:history.back()"><spring:message code="memberInfoModify.btCancel"/></form:button> --%>
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
