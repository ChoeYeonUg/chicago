<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css"/>
<style type="text/css">
.button {
		background-color: white;
		color: black;
		border: 2px solid #505050;
		font-size: 11px;
	}
</style>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<form>
					ISBN : ${bookMngDetail.book_code }
					<hr/>
					<table width="100%">
						<tr>
							<th align="left" width="10%"  style="font-size:11px; color:#000;">제목</th>
							<td colspan="3" align="left"  style="font-size:11px; color:#505050;">${bookMngDetail.book_name }</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">카테고리</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">
								<c:choose>
									<c:when test="${bookMngDetail.book_category == 1 }"><spring:message code="book.cate1"/></c:when>
									<c:when test="${bookMngDetail.book_category == 2 }"><spring:message code="book.cate2"/></c:when>
									<c:when test="${bookMngDetail.book_category == 3 }"><spring:message code="book.cate3"/></c:when>
									<c:when test="${bookMngDetail.book_category == 4 }"><spring:message code="book.cate4"/></c:when>
								</c:choose>
							</td>
							<th align="left" width="10%" style="font-size:11px; color:#000;">저자</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">${bookMngDetail.writer }</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">출판사</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">${bookMngDetail.publisher }</td>
							<th align="left" width="10%" style="font-size:11px; color:#000;">수량</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">${bookMngDetail.amount }</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">절판상태</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">
								<c:choose>
									<c:when test="${bookMngDetail.out_of_print == 1 }">출간 </c:when>
									<c:when test="${bookMngDetail.out_of_print == 0 }">절판 </c:when>
									<%-- <c:otherwise>절판</c:otherwise> --%>
								</c:choose>
							</td>
							<th align="left" width="10%" style="font-size:11px; color:#000;">페이지</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">${bookMngDetail.pages }</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">가격</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">${bookMngDetail.price }</td>
							<th align="left" width="10%" style="font-size:11px; color:#000;">출판일</th>
							<td align="left" width="40%" style="font-size:11px; color:#505050;">
								<fmt:formatDate value="${bookMngDetail.publication }" pattern="yyyy/MM/dd"/>
							</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">Img</th>
							<td colspan="3" align="left" style="font-size:11px; color:#000;">
								<img src="${imgPath }" onerror="/images/writer_noimage.gif"/>
								<br>[${bookMngDetail.img }]
							</td>
						</tr>
						<tr>
							<th align="left" width="10%" style="font-size:11px; color:#000;">상세설명</th>
							<td colspan="3" align="left" style="font-size:11px; color:#000;">${bookMngDetail.book_content } </td>
						</tr>
					</table>
					<table>
						<tr align="right">
							<td>
								<a href="book_mngUpdate.do?book_code=${book_code }">
								<input type="button" value="수정" onclick="location='book_mngUpdate.do?book_code=${bookMngDetail.book_code}'" class="button"/></a>
								<input type="button" value="목록" onclick="javascript:history.back()" class="button"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>