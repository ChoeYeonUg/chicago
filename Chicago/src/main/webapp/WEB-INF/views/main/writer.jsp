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
	<div class="row margin-vert-40">
				<!-- 좌측 카테고리 시작 -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- 카테고리1 -->
						<li class="list-group-item list-toggle"><a
							href="categoryList.do?book_category=1"><spring:message code="book.cate1" /></a></li>
						<!-- 카테고리2 -->
						<li class="list-group-item list-toggle"><a
							href="categoryList.do?book_category=2"><spring:message code="book.cate2" /></a>
						</li>
						<!-- 카테고리3 -->
						<li class="list-group-item list-toggle"><a
							href="categoryList.do?book_category=3"><spring:message code="book.cate3" /></a>
						</li>
						<!-- 카테고리4 -->
						<li class="list-group-item list-toggle"><a
							href="categoryList.do?book_category=4"><spring:message code="book.cate4" /></a>
						</li>
					</ul>
				</div>
	</div>
</body>
</html>