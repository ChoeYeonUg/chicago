<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th width="100">ISBN</th>
			<th width="100">책이름</th>
			<th width="100">저자</th>
			<th width="200">절판</th>
			<th width="60">관리</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.book_code }</td>
				<td>${vo.book_name }</td>
				<td>${vo.writer }</td>
				<td>
					<c:choose>
						<c:when test="${vo.out_of_print ==1 }">
							출간중
						</c:when>
						<c:otherwise>
							절판
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					관리하자
				</td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<a href="book_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<a href="book_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
				</c:forEach>
				&nbsp;<a href="book_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="book_management.do" method="post">
					<select name="fs">
						<option value="book_code">ISBN</option>
						<option value="book_name">제목</option>
						<option value="book_content">내용</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>