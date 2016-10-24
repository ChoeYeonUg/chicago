<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="login_ok.do" commandName="memberVO">
		<label>id</label><form:input path="id" /><br/>
		<label>pwd</label><form:password path="pwd" /><br/>
		<input type="submit" value="로그인">

	</form:form>

	<a href="clause.do">나는 회원이기를 희망한다 조조</a>
	
	<c:if test="${id ne null }">
	<h2>현재 접속한 아아디 ${id }</h2>
	</c:if>
	
</body>
</html>