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

<link href="css/board_css/board_css.css" rel="stylesheet" />
</head>

<body>
<div style="padding-bottom: 120px;">
<br/>
	<table>
		<tr>
			<td align="left" style="font-size:30px; padding-left: 10px;">FAQ 게시판</td>
		</tr>
		<tr>			
			<td align="right">
				<a href="noticeboard.do" style="color: #b3b3b3">공지사항</a> l Faq l
				<a href="secretboard.do" style="color: #b3b3b3"> 1:1게시판</a> l
				<a href="reviewboard.do" style="color: #b3b3b3">리뷰게시판</a>
			</td>
		</tr>
	</table>
	
	
	<table >
		<tr>
	 		<td align="right" colspan="2" style="font-size: 15px;">
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
          			</c:choose>         	
          			<c:if test="${i ne 6}"> &nbsp;l</c:if>		 					
         		 </c:forEach>    	
     		 </td>    		 
		</tr>	
	</table>

	<table>
		<tr>
			<td class="bTitle" style="font-size: 14px; ">총 ${totalfaq }건의 FAQ가 있습니다.</td>
			<td align="right" >${curpage } page / ${totalpage  } pages</td>
		</tr>
		
	</table>
	<table >
	<tr>
	<td>
	<!--FAQ 반복-->
		<div class="tab-content">
		<div class="tab-pane active in fade" id="faq">
		<div class="panel-group" id="accordion">
				<c:forEach var="vo" items="${flist}">				
				<!-- FAQ Item -->
					<div class="panel panel-default panel-faq">
						<div class="panel-heading" >
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
	</td>
	</tr>
</table>
	<table width="700">
		<tr>
		<!-- 관리자만보이게 설정 -->
			<c:if test="${grade<=1 }">
				<td align="right"><a href="faqboard_insert.do">글쓰기</a></td>
			</c:if>
		</tr>
	</table>

	<table  >
		<tr>
			<td align="center"> 	
				<ul class="pagination pagination-sm" style="margin-top: 0px;">		
					<c:if test="${curpage<=block }">
							<li><a href="faqboard.do?faq_category=${ faq_category}&page=${curpage>1?curpage-1:curpage}">&laquo;</a></li>
						</c:if>
						<c:if test="${curpage>block }">
							<li><a href="faqboard.do?faq_category=${ faq_category}&page=${curpage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							<c:if test="${curpage==i }">
								<li><a href="faqboard.do?faq_category=${ faq_category}&page=${curpage}">${i }</a></li>
							</c:if>
							<c:if test="${curpage!=i }">
								<li><a href="faqboard.do?faq_category=${ faq_category}&page=${i}">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${toPage<totalpage }">
							<li><a href="faqboard.do?faq_category=${ faq_category}&page=${toPage+1}">&raquo;</a></li>
						</c:if>
						<c:if test="${toPage>=totalpage }">
							<li><a href="faqboard.do?faq_category=${ faq_category}&page=${curpage<totalpage?curpage+1:curpage}">&raquo;</a></li>
						</c:if>
					&nbsp;&nbsp;
					
				</ul>
			</td>		
		</tr>
	</table>
	<!-- 페이지표시 끝 -->				
</div>

</body>
</html>