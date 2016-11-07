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
</head>
<body>
	<a href="purchase.do?book_code=${book_code }"> 
	<img src="book_img\purchase.png" alt="purchase.png" title="바로구매" class="icon">
	</a>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- 좌측 카테고리 시작 -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- 카테고리1 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=1"> 
								<spring:message code="book.cate1" />
							</a>
						</li>
						<!-- 카테고리2 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=2"> 
								<spring:message code="book.cate2" />
							</a>
						</li>
						<!-- 카테고리3 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=3"> 
								<spring:message code="book.cate3" />
							</a>
						</li>
						<!-- 카테고리4 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=4"> 
								<spring:message code="book.cate4" />
							</a>
						</li>
					</ul>
				</div>
				<!-- 좌측 카테고리 끝 -->
				<!-- 내용시작 -->
				<div class="col-md-9">
				<table width="100%" class="table_content" border="0">
					<tr>
						<!-- 책 이미지 -->
						<td><img alt="bookImage" src="${detailBook.img }"></td>
						<td>
							<table width="100%">
							
							</table>
						</td>
					</tr>
				</table>
				</div>
				
				${detailBook.book_name }<br/>
				${detailBook.book_code }<br/>
				${detailBook.book_content }<br/>
				${detailBook.book_category }<br/>
				${detailBook.publisher }<br/>
				${detailBook.amount }<br/>
				${detailBook.out_of_print }<br/>
				${detailBook.pages }<br/>
				${detailBook.price }<br/>
				${detailBook.publication }<br/>
				${detailBook.img }
				
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>