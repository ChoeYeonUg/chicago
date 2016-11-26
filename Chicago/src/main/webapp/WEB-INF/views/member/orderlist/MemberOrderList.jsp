<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta>
<title>Made By ChoDing!!</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!-- Theme skin -->
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
	function deliOk(data) {
		location.replace("deliOk.do?order_id=" + data);
	};

	function cancel(data) {
		location.replace("orderCancel.do?order_id=" + data);
	}
</script>
<style type="text/css">
.orderlist {
	width: 100%;
}

th {
	 border-bottom: #505050 solid;
	 border-bottom-width: 1px;
	 background-color: #EAEAEA;
}

.line {
	border-bottom: #505050 dotted;
	border-bottom-width: 1px;
	border-collapse: collapse;
}

th, td {
	height: 40px;
	vertical-align: middle;
	margin: 1px;
	padding: 1px;
}

.text {
	border-top: 0px;
	border-right: 0px;
	border-left: 0px;
	border-bottom: #505050 1px solid;
}
.search {
	vertical-align: bottom;
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
						<h3 class="panel-title">회원구매내역</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;회원님의 구매내역 확인할 수 있습니다.<br /> ◎&nbsp;주문 취소는 배송되기 전에 가능합니다.<br />
							◎&nbsp;환불 처리는 낙장, 파본 및 미개봉 상품에 한합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<h4>${id}님의 주문내역</h4>
		<hr />
		<form class="search">
			<b>주문번호 입력 : </b><input type="text" name="ss" class="text"> <input
				type="submit" value="검색" class="btn total">
		</form>
		<br/>
	</div>
	<!-- 고객 구매 내역 리스트 (표로 출력) -->
	<form:form name="frm" id="frm" commandName="com.sist.dao.OrderlistVO">
		<input type="hidden" value="${vo.id}">
		
		<table class="orderlist">
			<tr>
				<th width="10%">주문번호</th>
				<th width="50%">도서명</th>
				<th width="10%">결제금액</th>
				<th width="10%">주문일자</th>
				<th width="10%">배송상태</th>
				<th width="10%">취소/환불</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td align="center" class="line">${vo.order_id}</td>
					<td class="line">
						<c:forEach items="${vo.bList}" var="book" begin="0"
							end="0" step="1">
							<div class="bookName">
								<c:if test="${book.book_name.length() > 30 }">
									<a href="memberOrderlistDetail.do?order_id=${vo.order_id}">${fn:substring(book.book_name, 0, 30)}...</a>
								</c:if>
								<c:if test="${book.book_name.length() <= 30 }">
									<a href="memberOrderlistDetail.do?order_id=${vo.order_id}">${book.book_name}</a>
								</c:if>
							</div>
						</c:forEach>
					</td>
					<td align="center" class="line"><fmt:formatNumber value="${vo.total_price}" type="number"/>원</td>
					<td align="center" class="line"><fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd"/></td>
					<td align="center" class="line">
						<c:if test="${vo.delivery == 1}"> 배송준비중 </c:if> 
						<c:if test="${vo.delivery == 2}">
							<input type="button" onclick="deliOk('${vo.order_id}')" value="배송중" class="btn total">
						</c:if> 
						<c:if test="${vo.delivery == 3}"> 배송완료 </c:if></td>
					<td align="center" class="line">
						<c:if test="${vo.refund_state != null }"> 환불 </c:if>
						<c:if test="${vo.refund_state == null }">
							<c:if test="${vo.delivery != 3}">
								<input type="button" onclick="cancel('${vo.order_id}')" value="주문취소" class="btn total">
							</c:if>
						<c:if test="${vo.delivery == 3}">
							<input type="button" onclick="cancel('${vo.order_id}')" value="환불신청하기" class="btn total">
						</c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center">
					<ul class="pagination pagination-sm">
						<li><a href="memberOrderList.do?ss=${ss}&page=${curPage>1?curPage-1:curPage}">&laquo;</a></li>
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							<c:if test="${curPage==i }">
								<li><a href="#">${i }</a></li>
							</c:if>
							<c:if test="${curPage != i}">
								<li><a href="memberOrderList.do?ss=${ss}&page=${i}">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${toPage<totalPage}">
							<li><a href="memberOrderList.do?ss=${ss}&page=${toPage+1}">&raquo;</a></li>
						</c:if>
						<c:if test="${toPage>=totalPage}">
							<li><a href="memberOrderList.do?ss=${ss}&page=${curPage<totalPage?curPage+1:curPage}">&raquo;</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
