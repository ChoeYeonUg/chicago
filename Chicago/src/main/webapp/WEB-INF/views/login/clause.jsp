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
		<h2>약관</h2>
		<p><spring:message code="clause.content" /></p>
		<form action="join.do" method="post">
			<label>
				<input type="checkbox" name="agree" value="true">약관 동의
			</label>
			<input type="submit" value="다음"/>
		</form>
</body>
</html>