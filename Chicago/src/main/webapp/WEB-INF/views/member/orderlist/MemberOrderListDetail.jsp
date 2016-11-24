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

</head>
<body>
	<!-- Member Orderlist -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					회원세부주문내역
				</div>
				<div class="Notification">
					<ul class="Notcont">
						<li>회원님의 세부주문내역을 확인할 수 있습니다.</li>
						<li>환불 처리는 낙장, 파본 및 미개봉 상품에 한하며, 주문 취소는 배송되기 전에 가능합니다.</li>
					</ul>
				</div>
			</div>
			<div class="OrderlistSettingForm">
				<div class="MemberOrderlistHeadlineForm">
					<label class="MemberInfoHeadline">${vo.name}</label>
				</div>
				<div class="MemberOrderlistContentForm">
					<div id="InnerBox">
							<form:form name="frm" id="frm" commandName="com.sist.dao.OrderlistVO">
							<input type="hidden" value="${vo.id}">
							<div>
								<fieldset>
									<div id="OrderlistTable2" class="OrderlistTable2">
										<div class="row2">
											<span class="cel2H col21">번호</span>
											<span class="cel2H col22">서적명</span>
											<span class="cel2H col23">주문량</span>
											<span class="cel2H col24">가격</span>
											<span class="cel2H col25">주문날짜</span>
											<span class="cel2H col26">배송상태</span>
											<span class="cel2H col2B">취소/환불</span>
										</div>
										<c:forEach var="vo" items="${list}">
												<c:choose>
													<c:when test="${list.size() != null}">
														<div class="row2">
															<span class="cell2 col21">${vo.order_id}</span>
															<span class="cell2 col22"><c:forEach items="${vo.bList}" var="book" begin="0" end="1" step="1">
																	<div class="bookName">
																		<c:if test="${book.book_name.length() > 30 }">
																			
																			<img src="${book.img}">
																			${fn:substring(book.book_name, 0, 30)}...
																				
																			<%-- <c:if test="${vo.count > 1}">
																				<a href="${vo.order_id}">${fn:substring(book.book_name, 0, 30)}...외 &{vo.count} 종</a>
																			</c:if>
																			
																			<c:if test="${vo.count = 1}">
																				<a href="${vo.order_id}">${fn:substring(book.book_name, 0, 30)}...</a>
																			</c:if> --%>
																		
																		</c:if>
																		
																		<c:if test="${book.book_name.length() <= 30 }">
																		
																			<img src="${book.img}">
																			${book.book_name}
																			
																			<%-- <c:if test="${vo.count > 1}">
																				<a href="${vo.order_id}">${book.book_name} 외 &{vo.count} 종</a>
																			</c:if>
																			
																			<c:if test="${vo.count = 1}">
																				<a href="${vo.order_id}">${book.book_name}</a>
																			</c:if> --%>
																			
																		</c:if>
																	</div>
															</span>
															<span class="cell2 col23">${book.amount}권</span>
															<span class="cell2 col24">${book.price}원</span>
															</c:forEach>
															<span class="cell2 col25"><fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd"/></span>
															<span class="cell2 col26">
																<c:if test="${vo.delivery == 1}">
																	배송준비중
																</c:if>
																
																<c:if test="${vo.delivery == 2}">
																	배송중
																</c:if>
																
																<c:if test="${vo.delivery == 3}">
																	배송완료
																</c:if>
															</span>
															<span class="cell2 col2B">
																<c:if test="${vo.delivery != 3}">
																	<input type="button" onclick="#" value="주문취소">
																</c:if>
																
																<c:if test="${vo.delivery == 3}">
																	<input type="button" onclick="#" value="환불신청하기">
																</c:if>
															</span>
														</div>
													</c:when>
													
													<c:otherwise>
														<div class="row2">
															<span>
																구매목록이 없습니다!!!
															</span>
														</div>
													</c:otherwise>
													
												</c:choose>
										</c:forEach>
									</div>
								</fieldset>
							</div>
							<div>
								<%-- <fieldset>
									<div class="ctn">
										<a href="memberOrderList.do?page=1">맨 앞</a>
										<a href="memberOrderList.do?page=${curPage>1?curPage-1:curPage}">이전</a>
										
										<c:forEach var="i" begin="${fromPage}" end="${toPage}">
										[<c:if test="${curPage == i}">
											
											<span style="color: red">${i}</span>
											
										</c:if>
										
										<c:if test="${curPage != i}">
										<a href="memberOrderList.do?page=${i}">${i}</a>
										
										</c:if>
										]
										</c:forEach>
										
										<c:if test="${toPage<totalPage}">
											<a href="memberOrderList.do?page=${toPage+1}">다음</a>
											<a href="memberOrderList.do?page=${totalPage}">맨 뒤</a>
										</c:if>
										
										<c:if test="${toPage>=totalPage}">
											<a href="memberOrderList.do?page=${curPage<totalPage?curPage+1:curPage}">다음</a>
											<a href="memberOrderList.do?page=${totalPage}">맨 뒤</a>
										</c:if>
										&nbsp;&nbsp;
										${curPage} page / ${totalPage} pages
									</div>
								</fieldset> --%>
							</div>
							
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
