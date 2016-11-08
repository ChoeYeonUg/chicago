<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css" />
<link rel="stylesheet" type="text/css" href="book_css/bootstrap.min.css" />
<script type="text/javascript">
	function bcBtn() {
		if(confirm("장바구니로 이동하시겠습니까?") == true) {
			window.location.href="sb/sb.do?book_code=${detailBook.book_code}";
		} else {
			return;
		}
	}
	
	function lkBtn() {
		if(confirm("찜목록으로 이동하시겠습니까?") == true) {
			window.location.href="member/memberwishlist/MemberWishList.do?book_code=${datilBook.book_code}";
		} else {
			return;
		}
	}
	
 	function 
</script>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- 좌측 카테고리 시작 -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- 카테고리1 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=1"> 
								<spring:message code="book.cate1" />
							</a>
						</li>
						<!-- 카테고리2 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=2"> 
								<spring:message code="book.cate2" />
							</a>
						</li>
						<!-- 카테고리3 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=3"> 
								<spring:message code="book.cate3" />
							</a>
						</li>
						<!-- 카테고리4 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=4"> 
								<spring:message code="book.cate4" />
							</a>
						</li>
					</ul>
				</div>
				<!-- 좌측 카테고리 끝 -->
				<!-- 내용시작 -->
				<div class="col-md-9">
				<form>
				<table class="table_content" border="0">
					<tr>
						<!-- 책 이미지 -->
						<td width="14%"><img alt="bookImage" src="${detailBook.img }" style="vertical-align: bottom;"></td>
						<!-- 책 기본정보 -->
						<td width="86%">
							<table>
								<tr>
									<td colspan="4" height="13"><h4><b>${detailBook.book_name }</b></h4></td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" colspan="4" height="13"><b>[저자]</b>&nbsp;${detailBook.writer }</td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" width="25%" height="13">
										<b>[출판사]</b>&nbsp;${detailBook.publisher }
									</td>
									<td style="font-size:11px; color:#505050;" width="25%" height="13">
										<b>[출판일]</b>&nbsp;<fmt:formatDate value="${detailBook.publication }" pattern="yyyy/ MM/ dd"/>
									</td>
									<td style="font-size:11px; color:#505050;" width="15%" height="13">
										<b>[쪽수]</b>&nbsp;${detailBook.pages }
									</td>
									<td style="font-size:11px; color:#505050;" width="35%" height="13">
										<b>[ISBN]</b>&nbsp;${detailBook.book_code }
									</td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" height="13">
										<b>[정가]</b>&nbsp;<fmt:formatNumber value="${detailBook.price }" type="number"/>원&nbsp;&nbsp;
									</td>
									<td colspan="3" style="font-size:11px; color:#505050;" height="13">
										<b >[적립혜택]</b>&nbsp;<fmt:formatNumber value="${detailBook.price * 0.1 }" type="number"/>P (10%적립)
									</td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" colspan="4" height="13"><b>[배송정보]</b>&nbsp;18시 이전 주문 시 (도서산간 제외) "내일(화)" 배송</td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" height="13" colspan="4"><b>[주문수량]</b>&nbsp;
										<img src="book_img\down.png" alt="downBtn" style="width:20px;height:20px;" onclick="btdown()"/>
										&nbsp;${defAmount }&nbsp;
										<input type="hidden" value="${detailBook.book_code }" name="book_code"/>
										<input type="hidden" value="${defAmount }" name="amount" id="amount"/>
										<img src="book_img\up.png" alt="upBtn" style="width:20px;height:20px;" onclick="btup()"/>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td align="left">
										<input type="button" value="찜목록 담기" onclick="lkBtn()"/>&nbsp;&nbsp;
										<input type="button" value="북카트 담기" onclick="bcBtn()"/>&nbsp;&nbsp;
										<a href="purchase.do?book_code=${book_code }"><input type="button" value="바로구매"/></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</form>
				<br/><br/>
				<h4><b>상품정보제공고시</b></h4>
				<hr/>
				<table>
					<tr>
						<th width="10%" style="font-size:11px; color:#505050;">저자</th>
						<td width="40%" align="left" style="font-size:11px; color:#505050;">${detailBook.writer }</td>
						<th width="10%" style="font-size:11px; color:#505050;">출판사</th>
						<td width="40%" align="left" style="font-size:11px; color:#505050;">${detailBook.publisher }</td>
					</tr>
					<tr>
						<th width="10%" style="font-size:11px; color:#505050;">ISBN</th>
						<td width="40%" align="left" style="font-size:11px; color:#505050;">${detailBook.book_code }</td>
						<th width="10%" style="font-size:11px; color:#505050;">쪽수</th>
						<td width="40%" align="left" style="font-size:11px; color:#505050;">${detailBook.pages}쪽</td>
					</tr>
					<tr>
						<th width="10%" style="font-size:11px; color:#505050;">출간일</th>
						<td width="30%" align="left" style="font-size:11px; color:#505050;">
							<fmt:formatDate value="${detailBook.publication}" pattern="yyyy년  MM월  dd일"/>
						</td>
						<th width="10%" style="font-size:11px; color:#505050;">책소개</th>
						<td width="40%" align="left" style="font-size:11px; color:#505050;">상품 상세 정보를 확인하세요.</td>
					</tr>
				</table>
				<br/><br/>
				<h4><b>교환/환불</b></h4>
				<hr color="#505050"/>
				<table border="1">
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">교환/환불 방법</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;'마이페이지 > 취소/반품/교환/환불'에서 신청함, 1:1 문의 게시판 또는 고객센터 이용 가능</td>
					</tr>
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">교환/환불 가능 기간</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;고객변심은 출고완료 다음날부터 14일 까지만 교환/환불이 가능함</td>
					</tr>
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">교환/환불 비용</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;고객변심 또는 구매착오의 경우에만 2,500원 택배비를 고객님이 부담함</td>
					</tr>
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">교환/환불 불가사유</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;반품접수 없이 반송하거나, 우편으로 보낼 경우 상품 확인이 어려워 환불이 불가할 수 있음<br/>
						&nbsp;배송된 상품의 분실, 상품포장이 훼손된 경우, 비닐랩핑된 상품의 비닐 개봉시 교환/반품이 불가능함
						</td>
					</tr>
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">소비자 피해보상</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;소비자 피해보상의 분쟁처리 등에 관한 사항은 소비자 분쟁해결기준 (공정거래위원회 고시)에 따라 비해보상 받을 수 있음<br/>
							&nbsp;교환/반품/보증조건 및 품질보증 기준은 소비자기본법에 따른 소비자 분쟁 해결 기준에 따라 피해를 보상 받을 수 있음
						</td>
					</tr>
					<tr>
						<th width="20%" style="font-size:11px; color:#505050;">기타</th>
						<td width="80%" style="font-size:11px; color:#505050;">&nbsp;도매상 및 제작사 사정에 따라 품절/절판 등의 사유로 주문이 취소될 수 있음<br/>
							&nbsp;(이 경우 CHICAGO BOOKS 에서 고객님께 별도로 연락하여 고지함)
						</td>
					</tr>
				</table>
				<br/><br/>
				<h4><b>배송안내</b></h4>
				<hr/>
				<ul style="font-size:11px; color:#505050;">
					<li>CHICAGO BOOKS 도서 상품은 택배로 배송되며, 출고완료 1~2일내 상품을 받아보실 수 있습니다.</li>
					<li>출고가능 시간이 서로 다른 상품을 함께 주문할 경우 출고가능 시간이 가장 긴 상품을 기준으로 배송됩니다.</li>
					<li>군부대, 교도소 등 특정기관은 우체국 택배만 배송가능하여, CHICAGO BOOKS 외 타업체 배송상품인 경우 발송되지 않을 수 있습니다.</li>
					<li>배송비 : 2,500원</li>
				</ul>
				</div>
				<br/><br/>
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>