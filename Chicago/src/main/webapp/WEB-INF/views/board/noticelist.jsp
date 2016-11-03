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

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="board_css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="board_css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="board_css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/custom.css" rel="stylesheet">

<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Raleway:100,300,400"
	type="text/css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	type="text/css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">


				<!-- FAQ Item -->

				<table width="700">
					<tr>
						<td width="70%"><h2 align="left">
								<spring:message code="header.noticBoard" />
							</h2></td>
						<td width="30%" align="right">공지사항 l <a href="faqboard.do"
							style="color: #b3b3b3"> Faq </a>l <a href="secretboard.do"
							style="color: #b3b3b3">1:1게시판</a></td>
					</tr>
				</table>

				<div>
					<h5>공지사항입니다.</h5>
				</div>



				<!--FAQ 반복-->
			
				<div class="tab-content">
					<div class="tab-pane active in fade" id="faq">
						<div class="panel-group" id="accordion">
							<c:forEach var="vo" items="${list}">
				
								<!-- FAQ Item -->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#faq-sub-${vo.board_no}">
											<h4 class="panel-title">
												${vo.subject} <span class="pull-right">
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
					</div>
				</div>
				
	
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
			<a href="noticeboard.do?page=1">비긴</a>
				<a href="noticeboard.do?page=${curpage>1?curpage-1:curpage}">
				프리브</a> &nbsp;
		<%-- </c:if>    --%>
		
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
						<td align="right"><a href="noticeboard_insert.do">글쓰기</a></td>
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
	<!-- === END CONTENT === -->
</body>
</html>