<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-3">
		<ul class="nav_bar">
			<li class="list-group-item"><a href="member_management.do"><spring:message code="header.saMember"/></a></li>
			<li class="list-group-item"><a href="book_management.do"><spring:message code="header.saBook"/></a></li>
			<li class="list-group-item"><a href="board_management.do"><spring:message code="header.saBoard"/></a></li>
			<li class="list-group-item"><a href="sales_management.do"><spring:message code="header.saList"/></a></li>
			<li class="list-group-item"><a href="sales_management.do"><spring:message code="header.writer"/></a></li>
		</ul>
	</div>
</body>
</html>