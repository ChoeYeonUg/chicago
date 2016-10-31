<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
								<spring:message code="header.faqBoard" />
							</h2></td>
						<td width="30%" align="right"><a href="noticeboard.do" style="color: #b3b3b3">공지사항</a> l Faq l <a href="secretboard.do" style="color: #b3b3b3">1:1게시판</a></td>
					</tr>
				</table>

				<div>
					<table width="700">
						<tr>
							<td width="30%" align="left">
								<h5>총 ${totalpage }건의 FAQ가 있습니다.</h5>
							</td>
					 		<td align="right">
							<c:forEach var="i" begin="0" end="6" step="1">
									<c:choose>
									<c:when test="${i>=0 }">
										<c:if test="${faq_category eq i }">
											<a href="faqboard.do?faq_category=${i }" class="#" >${categoryList[i] }</a>
        								</c:if>
										<c:if test="${faq_category ne i}">
											<a href="faqboard.do?faq_category=${i }" class="#" style="color: #b3b3b3">${categoryList[i] }</a>
        								</c:if>         			 			
         			 				</c:when>
         			 				<c:otherwise>
         			 					<%--  <c:if test="${faq_category eq 0 }">
         			 						<a href="faqboard.do?faq_category=0" class="#" >${categoryList[i] }</a>
        								</c:if>
         			 					<c:if test="${faq_category ne 0 }">
         			 						<a href="faqboard.do?faq_category=0" class="#" style="color: #b3b3b3">${categoryList[i] }</a>
        								</c:if>  --%>
         			 				</c:otherwise>
         			 			</c:choose>         	
         			 			<c:if test="${i ne 6}"> &nbsp;l</c:if>		 					
         					 </c:forEach>    	
         					 </td> 
						</tr>
					</table>
				
				
				<!--FAQ 반복-->
			
				<div class="tab-content">
					<div class="tab-pane active in fade" id="faq">
						<div class="panel-group" id="accordion">
				<c:forEach var="vo" items="${flist}">
				
							<!-- FAQ Item -->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#faq-sub-${vo.board_no}">
										<h4 class="panel-title">
											${vo.subject}  <span class="pull-right">
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
				
				<table width="700">
					<tr>
						<!-- 관리자만보이게 설정 -->
						<td align="right"><a href="faqboard_insert.do">글쓰기</a></td>

					</tr>
				</table>
				
				
				<!-- End FAQ Item -->

				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
	<!-- === END CONTENT === -->
</body>
</html>