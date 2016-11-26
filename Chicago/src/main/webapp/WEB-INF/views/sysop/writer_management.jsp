<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>
<body>
	<table>
		<tr><td align="left"><input type="button" value="추가" class="btn total" onclick="location='add_writer.do'"/></td></tr>
	</table>
	<table class="commonTable" style="	width: inherit;">
		<tr>
			<th width="100">작가번호</th>
			<th width="100">작가명</th>
			<th width="100">출생일</th>
			<th width="200">수정</th>
			<th width="60">비고</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.writer_no }</td>
				<td>${vo.writer_name }</td>
				<td><fmt:formatDate value="${vo.birth }" pattern="yyyy.MM.dd"/></td>
				<td>
					<a href="update_writer.do?writer_no=${vo.writer_no }">수정</a>
				</td>
				<td>
					<a href="writer_delete.do?writer_no=${vo.writer_no }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table style="	width: inherit;">
		<tr>
			<td align="center">
				<ul class="pagination pagination-sm">
					<li><a href="writer_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
					<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
						<li><a href="writer_management.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a></li>
					</c:forEach>
					<li><a href="writer_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>
				</ul>
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="writer_management.do" method="post">
					<select name="fs">
						<option value="writer_no">저자번호</option>
						<option value="writer_name">저자명</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색" class="btn total">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>