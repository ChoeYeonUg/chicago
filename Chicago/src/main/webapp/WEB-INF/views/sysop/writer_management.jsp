<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th width="100">저자번호</th>
			<th width="100">저자명</th>
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
					수정
				</td>
				<td>
					삭제
				</td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<a href="writer_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<a href="writer_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
				</c:forEach>
				&nbsp;<a href="writer_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
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
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>