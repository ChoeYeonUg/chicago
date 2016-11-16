<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시카고북스|자격증·수험서</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css" />
<link rel="stylesheet" type="text/css" href="book_css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="book_css/header1.css" />
<script type="text/javascript">
	function bcBtn(data) {
		if(confirm("장바구니로 이동하시겠습니까?") == true) {
			window.location.href="sb.do?book_code="+data;
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
	
	function search() {
		var sch_value = jQuery('#form_search #sch_value').val();
		if(sch_value == '') {
			alert('검색어를 입력해주세요.');
		} else {
			jQuery('#form_search').submit();
		}
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
								<spring:message	code="book.cate2" />
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
				<!-- 검색창 -->
				<form id="form_search" method="post" action="categoryList.do">
				<table>
					<tr>
						<td align="right">
							<div style="line-height: 15px;">
							<label><input type="radio" value="book_name" checked="checked" name="sch_type" id="sch_type" />
								<span style="font-size:11px; color:#505050; vertical-align: bottom;"><spring:message code="radio.ti2"/></span></label>
							<label><input type="radio" value="writer" name="sch_type" id="sch_type" />
								<span style="font-size:11px; color:#505050; vertical-align: bottom;"><spring:message code="radio.ti3"/></span></label>
							<label><input type="radio" value="publisher" name="sch_type" id="sch_type" />
								<span style="font-size:11px; color:#505050; vertical-align: bottom;"><spring:message code="radio.ti4"/></span></label>
							&nbsp;&nbsp;
							<%-- <select id="sch_type" name="sch_type" style="height:20;">
								<option value="book_name" selected="selected"><spring:message code="radio.ti2"/>
								<option value="writer"><spring:message code="radio.ti3"/>
								<option value="publisher"><spring:message code="radio.ti4"/>
							</select> --%>
							<input type="text" id="sch_value" name="sch_value" height="15"/>
							<input type="hidden" name="book_category" value="${book_category }">
							<button type="button" onclick="search()" style="height:15;">검색</button>
							</div>
						</td>
					</tr>
				</table>
				</form>
				<hr/>
				<!-- 도서목록 -->
				<table width="100%" class="table_content" border="0">
					<c:forEach items="${cateList }" var="list">
					<tr>
						<td width="15%" height="200">
							<table>
								<!-- 책 이미지 -->
								<tr>
									<td align="center"><a href="bookDetail.do?book_code=${list.book_code }"><img alt="image" src="${list.img }"></a></td>
								</tr>
								<!-- 주문관련 아이콘 -->
								<tr>
									<td align="center" class="icontd">
										<img src="book_img\like.png" alt="like.png" title="찜하기" class="icon" onclick="lkBtn()">&nbsp;
										<img src="book_img\shopping.png" alt="shopping.png" title="장바구니" class="icon" onclick="bcBtn('${list.book_code}')">&nbsp; 
										<a href="purchase.do?book_code=${list.book_code }">
											<img src="book_img\purchase.png" alt="purchase.png" title="바로구매" class="icon">
										</a>
									</td>
								</tr>
							</table>
						</td>
						<!-- 책 간략 소개내용 -->
						<td width="85%" height="200">
							<table border="0">
								<tr>
									<td height="5" align="left" colspan="3">ISBN : ${list.book_code }</td>
								</tr>
								<tr>
									<td height="20" colspan="3"><h4><b><a href="bookDetail.do?book_code=${list.book_code }">${list.book_name }</a></b></h4></td>
								</tr>
								<tr>
									<td height="20" width="60%" colspan="3" style="color:#999999;">[저자]&nbsp;${list.writer }</td>
									
								</tr>
								<tr>
									<td height="20"  width="33%" style="color:#999999;">[출판사]&nbsp;${list.publisher }</td>
									<td height="20"  width="33%" style="color:#999999;">[출판일]&nbsp; <fmt:formatDate value="${list.publication }" pattern="yyyy년 M월 d일"/></td>
									<td height="20"  width="34%" style="color:#999999;">[금액]&nbsp; <fmt:formatNumber value="${list.price }" type="number"/>원</td>
									<%-- <td height="20"  width="40%">[쪽수]&nbsp;${list.pages }쪽</td> --%>
								</tr>
								<tr>
									<td height="50"  colspan="3"><br/>&nbsp;&nbsp;&nbsp;${list.book_content }&nbsp;
									<a href="bookDetail.do?book_code=${list.book_code }">+더보기</a></td>
								</tr>
							</table>
						</td>
					</tr>
					</c:forEach>
					<c:if test="${cateList.size()==0 }">
					<center>
					<h5 style="color:#999999;">검색 결과가 없습니다.</h5>
					</center>
					</c:if>
				</table>
				<!-- 페이지 -->
				<table width="100" id="table_page">
					<tr>
						<td align="center">
							<ul class="pagination pagination-sm">
								<c:if test="${curPage<=block }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage>1?curPage-1:curPage}&sch_type=${sch_type }&sch_value=${sch_value}">&laquo;</a></li>
								</c:if>
								<c:if test="${curPage>block }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage-1}&sch_type=${sch_type }&sch_value=${sch_value}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${fromPage }" end="${toPage }">
									<c:if test="${curPage==i }">
										<li><a href="categoryList.do?book_category=${book_category }&page=${curPage}&sch_type=${sch_type }&sch_value=${sch_value}">${i }</a></li>
									</c:if>
									<c:if test="${curPage!=i }">
										<li><a href="categoryList.do?book_category=${book_category }&page=${i}&sch_type=${sch_type }&sch_value=${sch_value}">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${toPage<totalPage }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${toPage+1}&sch_type=${sch_type }&sch_value=${sch_value}">&raquo;</a></li>
								</c:if>
								<c:if test="${toPage>=totalPage }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage<totalPage?curPage+1:curPage}&sch_type=${sch_type }&sch_value=${sch_value}">&raquo;</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</table>
				<!-- 내용 끝 -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>