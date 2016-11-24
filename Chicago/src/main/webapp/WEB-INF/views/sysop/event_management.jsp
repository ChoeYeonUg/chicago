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
			<td><a href="add_event.do">이벤트 추가</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th width="100">이벤트번호</th>
			<th width="100">이벤트명</th>
			<th width="100">시작일</th>
			<th width="200">수정</th>
			<th width="60">비고</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.event_no }</td>
				<td>${vo.event_name }</td>
				<td><fmt:formatDate value="${vo.start_day }" pattern="yyyy.MM.dd"/></td>
				<td>
					<a href="update_event.do?event_no=${vo.event_no }">수정</a>
				</td>
				<td>
					<a href="event_delete.do?event_no=${vo.event_no }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<a href="event_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<a href="event_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
				</c:forEach>
				&nbsp;<a href="event_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="event_management.do" method="post">
					<select name="fs">
						<option value="event_no">이벤트번호</option>
						<option value="event_name">이벤트이름</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>