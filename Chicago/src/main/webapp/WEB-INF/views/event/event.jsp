<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>      
</head>


						 <!-- <form action="event.do" method="post">
						 	<input type="hidden" name="af" value="1">
						 	<input type="">
						 </form> -->

<table width="100%" class="table_content" border="0">							
		
					<%-- <%String toDate = new java.text.SimpleDateFormat("yyyy년").format(new java.util.Date());%> 
					
					
					<h1><%=toDate %></h1>
						
						
						<input type="button" name=bf id=bf onclick="bf_click();" value="캬오옹"/>
						<table>
							<tr>
								<td><h1>${today }</h1></td>							
							</tr>
						</table>
						<input type="button" name=af id=af "value="캬옹"/> 					
						 --%>
						 
						 
						 
						<!-- <input hidden name=sd value=${sd}>  -->
						<c:forEach items="${schedule }" var="list">
						<tr>					
							<td width="85%" height="200">
								<table border="0">								
										<tr>
											<td height="5" align="left" colspan="3"><h2> ${list.event_name }</h2></td>
										</tr>								
										<tr>
											<td height="20" width="60%" colspan="3" style="color:#999999;">[장소]&nbsp;${list.store_name }</td>									
										</tr>
										<tr>
											<td height="20"  width="33%" style="color:#999999;">[시작일]&nbsp;<fmt:formatDate value="${list.start_day }" pattern="yyyy년 M월 d일 hh시mm분ss초"/></td>
											<td height="20"  width="33%" style="color:#999999;">[종료일]&nbsp; <fmt:formatDate value="${list.end_day }" pattern="yyyy년 M월 d일 hh시mm분ss초"/></td>																		
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
		
		<%-- <c:if test="${curpage<=block}"> --%>
			<%-- <a href="noticeboard.do?page=1">비긴</a>
				<a href="noticeboard.do?page=${curpage>1?curpage-1:curpage}">
				프리브</a> &nbsp; --%>
		<%-- </c:if>    --%>
		
		<c:forEach var="i" begin="${fromPage }" end="${toPage }">
		[<c:if test="${ curpage ==i}">
		
		<span style="color:red">${i }</span>
		
		</c:if>		
		<c:if test="${ curpage !=i}">
		<a href="event.do?page=${i }">${i }</a>
					
		</c:if>		
		]
		</c:forEach>
		
		<c:if test="${toPage<totalpage }">
			<a href="event.do?page=${toPage+1 }">넥스트</a>
			<a href="event.do?page=${totalpage }">끝</a>
		</c:if>
		
		<c:if test="${toPage>=totalpage }">
			<a href="event.do?page=${curpage<totalpage?curpage+1:curpage }">넥스트</a>&nbsp;
			<a href="event.do?page=${totalpage }">끝</a>
		</c:if>
		&nbsp;&nbsp;
		${curpage } page / ${totalpage  } pages
		
		</td>
		
		</tr>
		</table>
		<!-- 페이지표시 끝 -->
		<!-- 글쓰기 -->
				<table width="700">
					<tr>
						<!-- 관리자만보이게 설정 -->
						<c:if test="${grade<=1 }">
						<td align="right"><a href="event_insert.do">글쓰기</a></td>
						</c:if>
					</tr>
				</table>
		<!-- 글쓰기 끝 -->
				<!-- End FAQ Item -->

				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>