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
						<td width="30%" align="right"><a href="noticeboard.do" style="color: #b3b3b3">��������</a> l Faq l <a href="secretboard.do" style="color: #b3b3b3">1:1�Խ���</a></td>
					</tr>
				</table>

				<div>
					<table width="700">
						<tr>
							<td width="30%" align="left">
								<h5>�� ${totalfaq }���� FAQ�� �ֽ��ϴ�.</h5>
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
				
				
				<!--FAQ �ݺ�-->
			
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
											${vo.subject}<!--  <a href="#" >���� </a> <a href="#" >���� </a> --> <span class="pull-right">
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
				<!-- ������ǥ�� -->
	<table border="0" width="600">
		<tr>
		<td align="right"> 
		
		
		<!-- [1][2][3][4][5] -->
		<!-- fp           tp -->
								
		<%-- <c:if test="${curpage>block}">
			<a href="noticeboard.do?page=1">
				���</a> &nbsp;
				<a href="noticeboard.do?page=${fromPage-1}">
				������</a> &nbsp;
		</c:if>    --%>
		
		<%-- <c:if test="${curpage<=block}"> --%>
			<a href="faqboard.do?faq_category=${ faq_category}&page=1">���</a>
				<a href="faqboard.do?faq_category=${ faq_category}&page=${curpage>1?curpage-1:curpage}">
				������</a> &nbsp;
		<%-- </c:if>    --%>
		
		<c:forEach var="i" begin="${fromPage }" end="${toPage }">
		[<c:if test="${ curpage ==i}">
		
		<span style="color:red">${i }</span>
		
		</c:if>		
		<c:if test="${ curpage !=i}">
		<a href="faqboard.do?faq_category=${ faq_category}&page=${i }">${i }</a>
					
		</c:if>		
		]
		</c:forEach>
		
		<c:if test="${toPage<totalpage }">
			<a href="faqboard.do?faq_category=${ faq_category}&page=${toPage+1 }">�ؽ�Ʈ</a>
			<a href="faqboard.do?faq_category=${ faq_category}&page=${totalpage }">��</a>
		</c:if>
		
		<c:if test="${toPage>=totalpage }">
			<a href="faqboard.do?faq_category=${ faq_category}&page=${curpage<totalpage?curpage+1:curpage }">�ؽ�Ʈ</a>&nbsp;
			<a href="faqboard.do?faq_category=${ faq_category}&page=${totalpage }">��</a>
		</c:if>
		&nbsp;&nbsp;
		${curpage } page / ${totalpage  } pages
		
		</td>
		
		</tr>
		</table>
		<!-- ������ǥ�� �� -->				
				
				<table width="700">
					<tr>
						<!-- �����ڸ����̰� ���� -->
						<c:if test="${grade<=1 }">
						<td align="right"><a href="noticeboard_insert.do">�۾���</a></td>
						</c:if>
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