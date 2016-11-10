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
<link href="mypage_css/memberinfo.css" rel="stylesheet" />

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
			<div id="MyPageHeadlineForm" class="">
				<div id="MyPageHeadline">
					My Page
				</div>
			</div>
			<hr/>
			<!-- My Page Content -->
			<div id="MyPageContent" class="">
				<div id="LeftContent" class="">
					<!-- Begine MyPage Menu Bar -->
					<div id="MyPageMenuBar" class="">
						<ul id="" class="">
							<!-- Modify Member Info -->
							<li class="">
								<a data-toggle="" data-parent="" href="memberinfo.do"><spring:message code="memberInfoModifyMain.memberinfohead"/></a>
								<ul id="" class="">
									<li class="">
										<a href="selectMemberInfo.do"><spring:message code="memberInfoModifyMain.btMemberInfoModify"/></a>
									</li>
									<li class="">
										<a href="modyfyMemberPwd.do"><spring:message code="memberInfoModifyMain.btMemberPasswordModify"/></a>
									</li>
									<li class="">
										<a href="memberAddrsInfo.do"><spring:message code="memberInfoModifyMain.btMemberAddressModify"/></a>
									</li>
									<li class="">
										<a href="memberPoint.do"><spring:message code="memberInfoModifyMain.btMemberPoint"/></a>
									</li>
									<li class="">
										<a href="withdrawMember.do"><spring:message code="memberInfoModifyMain.btWithdrawMember"/></a>
									</li>
								</ul>
							</li>
							<!-- End Modify Member Info -->
							<!-- OrderList Info -->
							<li class="">
								<a data-toggle="" data-parent="" href="orderlist.do"><spring:message code="memberInfoModifyMain.orderhead"/></a>
								<ul id="" class="">
									<li class="">
										<a href="memberOrderList.do"><spring:message code="memberInfoModifyMain.btMemberOrderInfo"/></a>
									</li>
									<li class="">
										<a href="guestOrderList.do"><spring:message code="memberInfoModifyMain.btGuestOrderInfo"/></a>
									</li>
								</ul>
							</li>
							<!-- End Orderlist Info -->
							<!-- Member Wishlist Info -->
							<li class="">
								<a data-toggle="" data-parent="" href="wish.do"><spring:message code="memberInfoModifyMain.memberwishlisthead"/></a>
								<ul id="" class="">
									<li class="">
										<a href=".do"><spring:message code="memberInfoModifyMain.btMemberWishlistInfo"/></a>
									</li>
								</ul>
							</li>
							<!-- End Member Wishlist Info -->
							<!-- Member Question Info -->
							<li class="">
								<a data-toggle="" data-parent="" href="memberquestion.do"><spring:message code="memberInfoModifyMain.memberQuestionhead"/></a>
								<ul id="" class="">
									<li class="">
										<a href=".do"><spring:message code="memberInfoModifyMain.btMemberQuestion"/></a>
									</li>
									<li class="">
										<a href=".do"><spring:message code="memberInfoModifyMain.btAllQuestion"/></a>
									</li>
								</ul>
							</li>
							<!-- End Member Question Info -->
						</ul>
					</div>
					<!-- End MyPage Menu Bar -->
				</div>
				<div id="MainContent" class="">
					<!-- MyPage Content View -->
					<div id="" class="">
							
							<jsp:include page="${cmi}"></jsp:include>
							
					</div>
	            </div>
	       </div>
	    </div>
		<!-- End My Page Content -->
		<hr/>
	</div>
</body>
</html>
