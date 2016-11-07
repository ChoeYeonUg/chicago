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
			<th width="100">번호</th>
			<th width="100">글쓴이</th>
			<th width="100">제목</th>
			<th width="200">등록일</th>
			<th width="60">기타</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.board_no }</td>
				<td>${vo.id }</td>
				<td>${vo.subject }</td>
				<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					삭제
				</td>
			</tr>
		</c:forEach>	
	</table>
	<table>
		<tr>
			<td>
				<a href="board_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<a href="board_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
				</c:forEach>
				&nbsp;<a href="board_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="board_management.do" method="post">
					<select name="fs">
						<option value="id">id</option>
						<option value="name">name</option>
						<option value="content">내용</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>