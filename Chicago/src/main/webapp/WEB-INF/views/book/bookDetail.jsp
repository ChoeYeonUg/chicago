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
			window.location.href="sb.do?book_code=${detailBook.book_code}";
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
	

	function btdown() {
		var amount = ${detailBook.amount};
		var defamount = $('#defamount').val();
		if(defamount<=1) {
			alert('최소 주문 수량은 1권입니다.');
			defamount = 1;
		} else if (defamount>1 && defamount<=amount) {
			defamount--;
			$('#defamount').val(defamount);
			/* alert(amount); */
		}
	}
	
	function btup() {
		var amount = ${detailBook.amount};
		var defamount = $('#defamount').val();
		if(defamount<amount) {
			defamount++;
			$('#defamount').val(defamount);
			/* alert(amount); */s
		} else {
			alert('주문 가능한 수량을 초과하였습니다.');
		} 
	}

	function popupOpen(book_code){
		
		var popUrl="bookReviewContent.do?book_code="+book_code;
		var popOption="width=420, height=400, resizable=no scrollbars=no status=no;";
		window.open(popUrl,"",popOption);
	}

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
				<form action="purchase.do" method="post">
				<table class="table_content" border="0">
					<tr>
						<!-- 책 이미지 -->
						<td width="14%">
						<table>
							<tr>
								<td><img onerror="/images/writer_noimage.gif"/ src="${imgPath }" style="vertical-align: bottom;"></td>
							</tr>
							<tr>								
								<td height="20">
									<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
										<p style="WIDTH: ${starAvg}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
										</p>
									</div>	
								</td>								
							</tr> 
						</table>					
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
									<td style="font-size:11px; color:#505050;" colspan="4" height="13"><b>[배송정보]</b>&nbsp;15시 이전 주문 시 (도서산간 제외) 당일 출고</td>
								</tr>
								<tr>
									<td style="font-size:11px; color:#505050;" height="13" colspan="4"><b>[주문수량]</b>&nbsp;
										<c:choose>
											<c:when test="${detailBook.amount == 0 && detailBook.out_of_print == 0}">
												<b style="color:#D50000;">절판된 상품입니다. 주문이 불가능합니다. 고객센터에 문의해주세요.</b>
											</c:when>
											<c:when test="${detailBook.amount != 0 && detailBook.out_of_print == 0 }">
												<img src="book_img\down.png" alt="downBtn" style="width:20px;height:20px;" onclick="btdown()"/>
												<input type="text" value="${defAmount }" name="amount" id="defamount" readonly="readonly" size="1" style="text-align: center;"/>
												<input type="hidden" value="${detailBook.book_code }" name="book_code"/>
												<input type="hidden" value="${detailBook.amount }" id="amount"/>
												<img src="book_img\up.png" alt="upBtn" style="width:20px;height:20px;" onclick="btup()"/>
												&nbsp;<b style="color:#D50000;">절판된 상품입니다. 현재 남아있는 ${detailBook.amount }권 만 판매가 가능합니다.</b>
											</c:when>
											<c:when test="${detailBook.amount == 0  &&   detailBook.out_of_print == 1 }">
												<b style="color:#D50000;">상품 준비중입니다.</b>
											</c:when>
											<c:otherwise>										
												<img src="book_img\down.png" alt="downBtn" style="width:20px;height:20px;" onclick="btdown()"/>
												<input type="text" value="${defAmount }" name="amount" id="defamount" readonly="readonly" size="1" style="text-align: center;"/>
												<input type="hidden" value="${detailBook.book_code }" name="book_code"/>
												<input type="hidden" value="${detailBook.amount }" id="amount"/>
												<img src="book_img\up.png" alt="upBtn" style="width:20px;height:20px;" onclick="btup()"/>
												&nbsp;<b style="color:#D50000;">주문가능 수량은 ${detailBook.amount }권 입니다.</b>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td align="left">
										<c:choose>
											<c:when test="${detailBook.amount == 0 }">
												<input type="button" value="목록" onclick="javascript:history.back()"/>
											</c:when>
											<c:when test="${detailBook.amount == 0  &&   detailBook.out_of_print == 1 }">
												<input type="button" value="목록" onclick="javascript:history.back()"/>
											</c:when>
											<c:otherwise>
												<input type="button" value="찜목록 담기" onclick="lkBtn()"/>&nbsp;&nbsp;
												<input type="button" value="북카트 담기" onclick="bcBtn()"/>&nbsp;&nbsp;
												<%-- <a href="purchase.do?book_code=${book_code }?"> --%><input type="submit" value="바로구매"/><!-- </a> -->
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</form>
				<br/><br/>
				<h4><b>상세소개</b></h4>
				<hr/>
				<table>
					<tr>
						<td width="100%" style="font-size:11px; color:#505050;">${detailBook.book_content }</td>
					</tr>
				</table>
				<br/><br/>
				
				
				<!-- 여기에 리뷰칸 넣어주세용 :) -->
				<h4><b>상품리뷰</b></h4>
				<table>
					<tr>
						<td align="right" style="font-size:11px; color:#505050;"><a href="reviewboard.do?fs=book_code&ss=${book_code}"  >더 많은 상품리뷰 보기</a></td>
					</tr>
				</table>
				<hr/>
				<table>					
					<tr>
						<td width="5%" style="font-size:11px; color:#505050;" align="center">별점</td>
						<td width="55%" style="font-size:11px; color:#505050;" align="center">평가</td>
						<td width="25%" style="font-size:11px; color:#505050;" align="center">ID</td>
						<td width="25%" style="font-size:11px; color:#505050;" align="center">날짜</td>
					</tr>
					<c:forEach var="rvo" items="${list}">
					<tr>
					<tr>					
<%-- 
						<td width="20%" style="font-size:11px; color:#505050;" align="center">${rvo.score }</td>
						<td width="40%" style="font-size:11px; color:#505050;" align="center">${rvo.content }</td>
 --%>
						<td>
							<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								<p style="WIDTH: ${rvo.score}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								</p>
							</div>	
						</td>
						<td width="40%" style="font-size:11px; color:#505050;" align="left">${rvo.content }</td>
						<td width="25%" style="font-size:11px; color:#505050;" align="center">${rvo.id }</td>
						<td width="25%" style="font-size:11px; color:#505050;" align="center">
						<fmt:formatDate value="${rvo.regdate}" pattern="yyyy년  MM월  dd일"/></td>
					</tr> 					
					</c:forEach>					
					</table>
					<c:if test="${(id!=null) && (rv_idCk==0)}">
					<table>
					<br/>
					<tr>						
						<td align="right" colspan="4"><a href="#" onclick="javascript:popupOpen('${book_code}');">리뷰쓰기</a></td>
					</tr>
					</table>
					</c:if>
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
				<table>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title1"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des1"/></td>
					</tr>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title2"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des2"/></td>
					</tr>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title3"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des3"/></td>
					</tr>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title4"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des4"/>
						</td>
					</tr>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title5"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des5"/>
						</td>
					</tr>
					<tr>
						<th width="15%" style="font-size:11px; color:#505050;"><spring:message code="info.title6"/></th>
						<td width="85%" style="font-size:11px; color:#505050;"><spring:message code="info.des6"/>
						</td>
					</tr>
				</table>
				<br/><br/>
				<h4><b>배송안내</b></h4>
				<hr/>
				<table>
					<tr><td style="font-size:11px; color:#505050;">-&nbsp;<spring:message code="del.info1"/></td></tr>
					<tr><td style="font-size:11px; color:#505050;">-&nbsp;<spring:message code="del.info2"/></td></tr>
					<tr><td style="font-size:11px; color:#505050;">-&nbsp;<spring:message code="del.info3"/></td></tr>
					<tr><td style="font-size:11px; color:#505050;">-&nbsp;<spring:message code="del.info4"/></td></tr>
				</table>
				</div>
				<br/><br/>
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>