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
						<c:if test="${vo.img == null }"><img src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008x&pos=1639&bodylen=9386&realname=24665145_20120621170544.gif&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fgif&attnum=1&attid=0.1" class="bd"></c:if>
						<c:if test="${vo.img != null }"><img src="${vo.img }" class="bd"></c:if>
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