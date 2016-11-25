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
<link href="css/board_css/board_css.css" rel="stylesheet" />
<style type="text/css">
#content

</style>
</head>
<body>
<div style="height: 1000PX;">
	<br/>
	<table>
		<tr>
			<td align="left" style="font-size:30px ; padding-left: 10px;">공지사항</td>
		</tr>
		<tr>			
			<td align="right">
				공지사항 l
				<a href="faqboard.do" style="color: #b3b3b3"> Faq</a> l 
				<a href="secretboard.do" style="color: #b3b3b3"> 1:1게시판</a> l
				<a href="reviewboard.do" style="color: #b3b3b3">리뷰게시판</a>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td class="bTitle">공지사항 입니다.</td>
			<td align="right" style="padding-right: 20px;">							
				&nbsp;&nbsp;${curpage } page / ${totalpage  } pages
			</td>
		</tr>
	</table>
	<table>
		<tr>
		<td>
		<div class="tab-content">
		<div class="tab-pane active in fade" id="faq">
		<div class="panel-group" id="accordion">
			<c:forEach var="vo" items="${list}">
			<!-- FAQ Item -->
				<div class="panel panel-default panel-faq">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion" href="#faq-sub-${vo.board_no}">
							<h4 class="panel-title" style="font-size: 13px;">${vo.subject} 
								<span class="pull-right">
									<i class="glyphicon glyphicon-plus"></i>
								</span>
							</h4>
						</a>
					</div>
					<div id="faq-sub-${vo.board_no}" class="panel-collapse collapse">
						<div class="panel-body">${vo.content }</div>
					</div>
				</div>
				<!-- End FAQ Item -->
			</c:forEach>
		</div>
		</div>
		</div>
	</td>
	</tr>
</table>
<!-- 글쓰기 -->
	<table >
		<tr>
		<!-- 관리자만보이게 설정 -->
			<c:if test="${grade<=1 }">
				<td align="right"><a href="noticeboard_insert.do" style="font-size: 12px;" class="myButton" >글쓰기</a></td>
			</c:if>
		</tr>
	</table>

	<!-- 페이지표시 -->
	<table  >
		<tr>
			<td align="center"> 	
				<ul class="pagination pagination-sm" style="margin-top: 0px; ">
					<c:if test="${curpage<=block }">
					<li><a href="noticeboard.do?page=${curpage>1?curpage-1:curpage}">&laquo;</a></li>
				</c:if>
				<c:if test="${curpage>block }">
					<li><a href="noticeboard.do?page=${curpage-1}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${fromPage }" end="${toPage }">
					<c:if test="${curpage==i }">
						<li><a href="noticeboard.do?page=${curpage}">${i }</a></li>
					</c:if>
					<c:if test="${curpage!=i }">
						<li><a href="noticeboard.do?page=${i}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${toPage<totalPage }">
					<li><a href="noticeboard.do?page=${toPage+1}">&raquo;</a></li>
				</c:if>
				<c:if test="${toPage>=totalPage }">
					<li><a href="noticeboard.do?page=${curpage<totalPage?curpage+1:curpage}">&raquo;</a></li>
				</c:if>
				</ul>
							
				
				<%-- 
				<a href="noticeboard.do?page=1">비긴</a>
				<a href="noticeboard.do?page=${curpage>1?curpage-1:curpage}">프리브</a> &nbsp;
				<c:forEach var="i" begin="${fromPage }" end="${toPage }">
					[<c:if test="${ curpage ==i}">		
						<span style="color:red">${i }</span>		
					</c:if>		
					<c:if test="${ curpage !=i}">
						<a href="noticeboard.do?page=${i }">${i }</a>					
					</c:if>		
					]
				</c:forEach>
					
					<c:if test="${toPage<totalpage }">
						<a href="noticeboard.do?page=${toPage+1 }">넥스트</a>
						<a href="noticeboard.do?page=${totalpage }">끝</a>
					</c:if>
					
					<c:if test="${toPage>=totalpage }">
						<a href="noticeboard.do?page=${curpage<totalpage?curpage+1:curpage }">넥스트</a>&nbsp;
						<a href="noticeboard.do?page=${totalpage }">끝</a>
					</c:if>
					&nbsp;&nbsp;
					${curpage } page / ${totalpage  } pages					 --%>
			</td>		
		</tr>
	</table>
	<!-- 페이지표시 끝 -->
	
</div>
</body>

</html>