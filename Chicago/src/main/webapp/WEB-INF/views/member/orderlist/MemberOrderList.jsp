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
<link href="mypage_css/orderlist.css" rel="stylesheet" />

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

</head>
<body>
	<!-- Member Orderlist -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					회원주문내역
				</div>
				<div class="Notification">
					<ul class="Notcont">
						<li>회원님의 주문내역을 확인할 수 있습니다.</li>
						<li>환불 처리는 낙장, 파본 및 미개봉 상품에 한하며, 주문 취소는 배송되기 전에 가능합니다. </li>
					</ul>
				</div>
			</div>
			<div class="OrderlistSettingForm">
				<div class="MemberOrderlistHeadlineForm">
					<label class="MemberInfoHeadline"><%=request.getAttribute("id") %>님의 주문 내역</label>
				</div>
				<div class="MemberOrderlistContentForm">
					<div id="InnerBox">
							<form:form name="frm" id="frm" commandName="com.sist.dao.OrderlistVO">
							<input type="hidden" value="${vo.id}">
							<%-- <input type="hidden"  name="typecheck" value="${typecheck}"> --%>
							<fieldset>
								<div id="OrderlistTable" class="OrderlistTable">
									<div class="row">
										<span class="celH col1">번호</span>
										<span class="celH col2">서적명</span>
										<span class="celH col3">주문량</span>
										<span class="celH col4">가격</span>
										<span class="celH col5">주문날짜</span>
										<span class="celH col6">배송상태</span>
										<span class="celH colB">취소/환불</span>
									</div>
									<c:forEach var="vo" items="${list}">
									<div class="row">
										<span class="cell col1">${vo.order_id}</span>
										<span class="cell col2">${vo.book_name}</span>
										<span class="cell col3">${vo.amount}</span>
										<span class="cell col4">${vo.total_price}</span>
										<span class="cell col5">${vo.order_date}</span>
										<span class="cell col6">${vo.delivery}</span>
										<span class="cell colB">
											<input type="button" onclick="#" value="주문취소">
											<input type="button" onclick="#" value="환불신청하기">
										</span>
									</div>
									</c:forEach>
								</div>
							</fieldset>
								
								<!-- OK, Cancel Button -->
								<div>
									<ul class="Notcont">
										<li>확인을 누르시면 메인화면으로 이동합니다.</li>
									</ul>
									<input type="button" onclick="javascript:location.href='main.do';" value="확인">
								</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
