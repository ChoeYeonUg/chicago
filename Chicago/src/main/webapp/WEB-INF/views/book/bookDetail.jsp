<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css" />
<link rel="stylesheet" type="text/css" href="book_css/bootstrap.min.css" />
<!-- <script type="text/javascript">
	function wishpop2(data) {
		var popOption = "width=300, hegiht=300, top=500, left=500";
		window.open('wishpop.do?book_code=' + data, "", popOption);
	}

	function sb2() {
		var popOption = "width=300, hegith=300, top=500, left=500";
		window.open('sbPage.do', "", popOption);
	}

	function purchase2() {
		var popOption = "width=300, hegith=300, top=500, left=500";
		window.open('purchase.do', "", popOption);
	}
</script> -->
</head>
<body>
	<h1>test</h1>

	<a href="purchase.do?book_code=${book_code }"> <img src="book_img\purchase.png" alt="purchase.png" title="바로구매" class="icon">
	</a>
</body>
</html>