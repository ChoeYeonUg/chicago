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
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="mypage_css/memberinfo.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/adminPage.css"/>
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
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- 좌측 카테고리 시작 -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- 회원정보 -->
						<li class="list-group-item list-toggle">
							<a data-toggle="" data-parent="" href="memberinfo.do">
								<b><spring:message code="memberInfoModifyMain.memberinfohead" /></b></a></li>
						<!-- 회원정보수정 -->
						<li class="list-group-item list-toggle">
							<a href="modifyMemberInfo.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberInfoModify" /></a></li>
						<!-- 비밀번호변경 -->
						<li class="list-group-item list-toggle">
							<a href="modyfyMemberPwd.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberPasswordModify" /></a></li>
						<!-- 나의 주소록 관리 -->
						<li class="list-group-item list-toggle"> 
							<a href="memberAddrsInfo.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberAddressModify" /></a></li>
						<!-- 포인트조회 -->
						<li class="list-group-item list-toggle">
							<a href="memberPoint.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberPoint" /></a></li>
						<!-- 회원탈퇴 -->
						<li class="list-group-item list-toggle">
							<a href="withdrawMember.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btWithdrawMember" /></a></li>
						<!-- 구매정보 -->
						<li class="list-group-item list-toggle">
							<a data-toggle="" data-parent="" href="memberOrderList.do">
								<b><spring:message code="memberInfoModifyMain.orderhead" /></b></a></li>
						<!-- 회원구매목록 -->
						<%-- <li class="list-group-item list-toggle">
							<a href="memberOrderList.do">
								&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberOrderInfo" /></a></li> --%>
						<!-- 찜정보 -->
						<li class="list-group-item list-toggle">
							<a href="wishlist.do" data-toggle="" data-parent="">
								<b><spring:message code="memberInfoModifyMain.memberwishlisthead" /></b></a></li>
						<!-- 내가찜한목록 -->
						<%-- <li class="list-group-item list-toggle"><a href=".do">
							&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberWishlistInfo" /></a></li> --%>
						<!-- 문의사항 -->
						<li class="list-group-item list-toggle">
							<a href="myMemberquestion.do" data-toggle="" data-parent="">
								<b><spring:message code="memberInfoModifyMain.memberQuestionhead" /></b></a></li>
						<!-- 내문의사항 -->
						<%-- <li class="list-group-item list-toggle">
							<a href=".do">&nbsp;&nbsp;<spring:message code="memberInfoModifyMain.btMemberQuestion" /></a></li> --%>
					</ul>
				</div>
				<!-- 좌측 카테고리 끝 -->
				<!-- 내용시작 -->
				<div class="col-md-9">
					<!-- MyPage Content View -->
					<jsp:include page="${cmi}"></jsp:include>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
