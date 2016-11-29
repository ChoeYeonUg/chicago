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

<style type="text/css">


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

</style>
</head>
<body>
	<div class="col-md-9">
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">회원세부주문내역</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;회원님의 구매내역 확인할 수 있습니다.<br /> 
							◎&nbsp;주문 취소는 배송되기 전에 가능합니다.<br />
							◎&nbsp;환불 처리는 낙장, 파본 및 미개봉 상품에 한합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<form:form name="frm" id="frm" commandName="com.sist.dao.OrderlistVO">
			<table>
				
				<tr>
					<th width="8%">주문번호</th>
					<td class="line">&nbsp;${list.order_id}</td>
					<th width="8%">주문일</th>
					<td class="line" colspan="3">&nbsp;<fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<c:forEach var="book" items="${list.bList}">
				<tr>
					<th width="8%">도서명</th>
						<td width="15%" class="line">&nbsp;
							<c:if test="${book.book_name.length() > 10 }">
								<img src="${book.img}"><br /> ${fn:substring(book.book_name, 0, 10)}...
							</c:if> <c:if test="${book.book_name.length() <= 10 }">
								<img src="${book.img}"><br /> ${book.book_name} 
							</c:if></td>
					<th width="8%">주문수량</th>
					<td width="20%" class="line">&nbsp;${book.amount}권</td>
					<th width="10%">가격</th>
					<td width="27%" class="line">&nbsp;${book.price}원</td>
				</tr>
				</c:forEach>
				<tr>
					<th width="20%">배송상태</th>
					<td width="30%" class="line">&nbsp;
						<c:if test="${list.delivery == 1}"> 배송준비중 </c:if>
						<c:if test="${list.delivery == 2}"> 배송중 </c:if>
						<c:if test="${list.delivery == 3}"> 배송완료 </c:if>
					</td>
					<th width="20%">취소/환불</th>
					<td width="30%" class="line" colspan="3">&nbsp;
						<c:if test="${list.delivery != 3}"> 
					 		<input type="button" onclick="#" value="주문취소"  class="btn total">
						</c:if>
						<c:if test="${vo.delivery == 3}">
							<input type="button" onclick="#" value="배송완료" class="btn total">
							<input type="button" onclick="#" value="환불신청하기" class="btn total">
						</c:if>
					</td>
				</tr>
				
			</table>
			<table>
				<tr><td align="right"><input type="button" value="목록보기" onclick="javascript:history.back()" class="btn total"/></td></tr>
			</table>
		</form:form>
	</div>
</body>
</html>
