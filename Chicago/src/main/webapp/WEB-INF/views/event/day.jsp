<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="100%" class="table_content" border="0">
					<c:forEach items="${dayToday }" var="list">
					<tr>
						<!-- 책 간략 소개내용 -->
						<td width="85%" height="200">
							<table border="0">
								<tr>
									<td height="5" align="left" colspan="3"><h2> ${list.event_name }</h2></td>
								</tr>								
								<tr>
									<td height="20" width="60%" colspan="3" style="color:#999999;">[장소]&nbsp;${list.store_name }</td>									
								</tr>
								<tr>
									<td height="20"  width="33%" style="color:#999999;">[시작일]&nbsp;<fmt:formatDate value="${list.start_day }" pattern="yyyy년 M월 d일"/></td>
									<td height="20"  width="33%" style="color:#999999;">[종료일]&nbsp; <fmt:formatDate value="${list.end_day }" pattern="yyyy년 M월 d일"/></td>																		
								</tr>
								<tr>
									<td height="50"  colspan="3"><br/>&nbsp;&nbsp;&nbsp;${list.description }&nbsp;
								</tr>
							</table>
						</td>
					</tr>
					</c:forEach>
				</table>
<!-- 페이지표시 -->
	<table border="0" width="600">
		<tr>
		<td align="right"> 
		
		
		<!-- [1][2][3][4][5] -->
		<!-- fp           tp -->
								
		<%-- <c:if test="${curpage>block}">
			<a href="noticeboard.do?page=1">
				비긴</a> &nbsp;
				<a href="noticeboard.do?page=${fromPage-1}">
				프리브</a> &nbsp;
		</c:if>    --%>
		
		<c:forEach var="i" begin="${fromPage }" end="${toPage }">
		[<c:if test="${ curpage ==i}">
		
		<span style="color:red">${i }</span>
		
		</c:if>		
		<c:if test="${ curpage !=i}">
		<a href="event_day.do?page=${i }">${i }</a>
					
		</c:if>		
		]
		</c:forEach>
		
		<c:if test="${toPage<dayPage }">
			<a href="event_day.do?page=${toPage+1 }">넥스트</a>
			
		</c:if>
		
		<c:if test="${toPage>=dayPage }">
			<a href="event_day.do?page=${curpage<dayPage?curpage+1:curpage }">넥스트</a>&nbsp;
			
		</c:if>
		&nbsp;&nbsp;
		${curpage } page / ${dayPage } pages
		
		</td>
		
		</tr>
		</table>
		<!-- 페이지표시 끝 -->
		
				<!-- End FAQ Item -->

				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>