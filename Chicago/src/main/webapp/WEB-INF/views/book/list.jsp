<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시카고북스|도서</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css" />
<link rel="stylesheet" type="text/css" href="book_css/bootstrap.min.css" />
</head>
<body>
	<div id="content">
		<div class="container background-white">
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
				<!-- 좌측 카테고리 끝 -->
				<!-- 내용시작 -->
				<!-- 신간소개 시작 -->
				<div class="col-md-9">
					<h2 class="margin-bottom-30">
						<spring:message code="con.subject" />
					</h2>
					<div class="margin-bottom-30">
						<hr>
					</div>
					<!-- Tab v2 -->
					<div class="tabs alternative">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#sample-2a" data-toggle="tab">
									<spring:message code="newBook.hd1" />
							</a></li>
							<li><a href="#sample-2b" data-toggle="tab"> <spring:message
										code="newBook.hd2" />
							</a></li>
							<li><a href="#sample-2c" data-toggle="tab"> <spring:message
										code="newBook.hd3" />
							</a></li>
							<li><a href="#sample-2d" data-toggle="tab"> <spring:message
										code="newBook.hd4" />
							</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="sample-2a">
								<div class="row">
									<c:forEach items="${newBookCate1 }" var="vo">
										<div class="imgdiv">
											<img class="newimg" src="${vo.img }" alt="filler image">
										</div>
										<div class="desdiv">
											<h3>${vo.book_name }</h3>
											<%-- <p>${vo.book_content }</p> --%>
											<h5>
												<b>[저자]</b> ${vo.writer }&nbsp;&nbsp; <b>[출판사]</b>
												${vo.publisher }&nbsp;&nbsp;<b>[출판일]</b>
												<fmt:formatDate value="${vo.publication }"
													pattern="yyyy년 M월 d일" />
												&nbsp;&nbsp;<b>[가격]</b> <fmt:formatNumber value="${vo.price }" type="number"/>원&nbsp;&nbsp;
											</h5>
											<p>${vo.book_content }<a href="#">&nbsp;&nbsp;▶ 더보기</a>
											</p>
											<hr>
										</div>
										<br />
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade in" id="sample-2b">
								<div class="row">
									<c:forEach items="${newBookCate2 }" var="vo">
										<div class="imgdiv">
											<img class="newimg" src="${vo.img }" alt="filler image">
										</div>
										<div class="desdiv">
											<h3>${vo.book_name }</h3>
											<%-- <p>${vo.book_content }</p> --%>
											<h5>
												<b>[저자]</b> ${vo.writer }&nbsp;&nbsp; <b>[출판사]</b>
												${vo.publisher }&nbsp;&nbsp;<b>[출판일]</b>
												<fmt:formatDate value="${vo.publication }"
													pattern="yyyy년 M월 d일" />
												&nbsp;&nbsp;<b>[가격]</b> <fmt:formatNumber value="${vo.price }" type="number"/>원&nbsp;&nbsp;
											</h5>
											<p>${vo.book_content }<a href="#">&nbsp;&nbsp;▶ 더보기</a>
											</p>
											<hr>
										</div>
										<br />
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade in" id="sample-2c">
								<div class="row">
									<c:forEach items="${newBookCate3 }" var="vo">
										<div class="imgdiv">
											<img class="newimg" src="${vo.img }" alt="filler image">
										</div>
										<div class="desdiv">
											<h3>${vo.book_name }</h3>
											<%-- <p>${vo.book_content }</p> --%>
											<h5>
												<b>[저자]</b> ${vo.writer }&nbsp;&nbsp; <b>[출판사]</b>
												${vo.publisher }&nbsp;&nbsp;<b>[출판일]</b>
												<fmt:formatDate value="${vo.publication }"
													pattern="yyyy년 M월 d일" />
												&nbsp;&nbsp;<b>[가격]</b> <fmt:formatNumber value="${vo.price }" type="number"/>원&nbsp;&nbsp;
											</h5>
											<p>${vo.book_content }<a href="#">&nbsp;&nbsp;▶ 더보기</a>
											</p>
											<hr>
										</div>
										<br />
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade in" id="sample-2d">
								<div class="row">
									<c:forEach items="${newBookCate4 }" var="vo">
										<div class="imgdiv">
											<img class="newimg" src="${vo.img }" alt="filler image">
										</div>
										<div class="desdiv">
											<h3>${vo.book_name }</h3>
											<%-- <p>${vo.book_content }</p> --%>
											<h5>
												<b>[저자]</b> ${vo.writer }&nbsp;&nbsp; <b>[출판사]</b>
												${vo.publisher }&nbsp;&nbsp;<b>[출판일]</b>
												<fmt:formatDate value="${vo.publication }"
													pattern="yyyy년 M월 d일" />
												&nbsp;&nbsp;<b>[가격]</b> <fmt:formatNumber value="${vo.price }" type="number"/>원&nbsp;&nbsp;
											</h5>
											<p>${vo.book_content }<a href="#">&nbsp;&nbsp;▶ 더보기</a>
											</p>
										</div>
										<br />
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- 신간소개 끝 -->
					<!-- 이벤트 소개 시작 -->
					<h2 class="margin-bottom-30">
						<spring:message code="con.event" />
					</h2>
					<div class="margin-bottom-30">
						<hr>
					</div>
					<div class="row portfolio-group">
						<!-- Portfolio Item -->
						<div
							class="portfolio-item col-sm-6 col-xs-12 margin-bottom-40 code">
							<div>
								<a href="#"><img alt="book_img\image1.jpg" src="book_img\image1.jpg" class="eventimg"></a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div
							class="portfolio-item col-sm-6 col-xs-12 margin-bottom-40 code">
							<div>
								<a href="#"><img alt="book_img\image1.jpg" src="book_img\image2.jpg" class="eventimg"></a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- 이벤트 소개 끝 -->
						<div class="margin-bottom-40">
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- === END CONTENT === -->
	</div>
</body>
</html>