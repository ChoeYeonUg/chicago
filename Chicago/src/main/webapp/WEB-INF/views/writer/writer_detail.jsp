<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/writerDetail.css" rel="stylesheet" />
</head>
<body>
	<div id="writerLast">
		<div  class="wL_1st">
			<div class="w1_left">
				<div class="cateLeft">
					<div class="writerPic">
						<img src="${imagePath }" class="bd" onerror="/images/writer_noimage.gif" >
					</div>
					<div class="btnIco"></div>
				</div>
				<div class="cateCenter">
					<div class="writerInfo">
						<p class="wName">${vo.writer_name }</p>
						<p class="boneDate">
							<c:if test="${vo.birth == null }">?</c:if>
									 <c:if test="${vo.birth != null }"><fmt:formatDate value="${vo.birth }" pattern="yyyy.MM.dd"/>&nbsp; 출생</c:if>
									 /
									 <c:if test="${vo.death == null }">?</c:if>
									 <c:if test="${vo.death != null }"><fmt:formatDate value="${vo.death }" pattern="yyyy.MM.dd"/>&nbsp; 사망</c:if>
						</p>
					</div>
					<div class="writerInfo2">
						<p class="content">
							<span id="txtWrapView1" style="display: block;">${vo.info }</span>
						</p>
					</div>
				</div>
				
				<div class="wL_2st">
					<h2>출간작</h2>
					<ul class="majorList" id="defaultList">
						<c:forEach items="${vo.list }" var="book" begin="0" end="11" step="1">
							<li>
								<p class="bookImg">
									<span class="bShadow">
										<span class="bookFrontbg"></span>
										<a href="bookDetail.do?book_code=${book.book_code }">
											<img alt="${book.book_name }" src="${book.img }">
										</a>
									</span>
								</p>
								<p class="bookTxt">
									<span>${book.book_name }</span>
								</p>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="wL_4st_L"></div>
			</div>
		
		</div>
	
	</div>
</body>
</html>