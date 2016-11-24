<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: inherit;
}
</style>
<link href="css/board_css/board_css.css" rel="stylesheet" />
</head>
<body>
	<table>
		<tr><td align="left"><input type="button" value="추가" style="hegiht:8px; width:40px; border-radius:2px; font-size:11px;" onclick="location='book_mngInsert.do'"/></td></tr>
	</table>
	<!-- 전체 리스트 출력 -->
	<table class="commonTable" style="	width: inherit;">
			<tr>
				<td width="8%" style="font-size: 11px;"><b>ISBN</b></td>
				<td width="52%" style="font-size: 11px;"><b>도서이름</b></td>
				<td width="20%" style="font-size: 11px;"><b>저자</b></td>
				<td width="10%" style="font-size: 11px;"><b>절판여부</b></td>
				<td width="10%" style="font-size: 11px;"><b>관리</b></td>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td width="8%" style="font-size: 11px; color: #505050; algin: center;"><a href="book_mngDetail.do?book_code=${vo.book_code }">${vo.book_code }</a></td>
					<td width="52%" style="font-size: 11px; color: #505050;">&nbsp;${vo.book_name }</td>
					<td width="15%" style="font-size: 11px; color: #505050;">${vo.writer }</td>
					<td width="10%" style="font-size: 11px; color: #505050;">
						<c:choose>
							<c:when test="${vo.out_of_print == 1 }">출간 </c:when>
							<c:when test="${vo.out_of_print == 0 }">절판 </c:when>
							<%-- <c:otherwise>절판</c:otherwise> --%>
						</c:choose>
					</td>
					<td width="10%" style="font-size: 11px; color: #505050;"><a href="#">관리</a></td>
				</tr>
			</c:forEach>
	</table>
	<table style="	width: inherit;">
		<tr>
			<td align="center">
				<ul class="pagination pagination-sm">
					<li><a href="book_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
					<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
						<li><a href="book_management.do?fs=${fs }&ss=${ss }&page=${i }">${i}</a></li>
					</c:forEach>
					<li><a href="book_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>
				</ul>
			</td>
		</tr>
		<!-- 검색 -->
		<tr>
			<td>
				<form action="book_management.do" method="post">
					<div style="line-height: 11px;">
						<label><input type="radio" value="book_code" name="fs" id="fs" checked="checked"/>
							<span style="font-size:11px; color:#505050; vertical-align: bottom;">ISBN</span></label>
						<label><input type="radio" value="book_name" name="fs" id="fs"/>
							<span style="font-size:11px; color:#505050; vertical-align: bottom;">제목</span></label>
						<label><input type="radio" value="book_content" name="fs" id="fs"/>
							<span style="font-size:11px; color:#505050; vertical-align: bottom;">내용</span></label>
						<input type="search" id="ss" name="ss"> 
						<input type="submit" value="검색"/>
					</div>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>