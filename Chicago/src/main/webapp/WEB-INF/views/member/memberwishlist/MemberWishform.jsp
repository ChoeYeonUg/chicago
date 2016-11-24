<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Made By ChoDing!!</title>
</head>
<body>
	<form action="purchase.do" method="post">
		<c:if test="${wishList != null}">
			<c:forEach items="${myWishList}" var="item">
				<input type="text" name="book_code" value="${item.book_code}">
				<input type="text" name="amount" value="1">
			</c:forEach>
		</c:if>
		<input type="submit" value="전송">
	</form>
</body>
</html>