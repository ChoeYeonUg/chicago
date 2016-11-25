<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/board_css/board_css.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>	
			<td align="left" style="font-size:30px; padding-left: 10px;">나의 문의내역</td>
		</tr>			
	</table>
	<table>
		<tr>		
			<td class="bTitle">내 문의 내역과 답변입니다.</td>		
			<td align="right" style="padding-right: 20px;">							
				&nbsp;&nbsp;${curpage } page / ${totalpage  } pages
		
			</td>
		</tr>
	<table class="commonTable">
			<tr>
				<th width="10%" >번호</th>							
				<th width="50%">제목</th>
				<th width="15%" >ID</th>
				<th width="15%" >날짜</th>
				<th width="10%" >hit</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td width="10%">${vo.board_no}</td>
					<td width="50%" style="text-align: left;">
					<c:if test="${vo.group_tab>0 }">
						<c:forEach var="i" begin="1" end="${vo.group_tab}">&nbsp;&nbsp;	</c:forEach>		
							<img src="./board_img/next.png" style="width: 15px; height:auto;" >
					</c:if> 
					<c:if test="${msg!=vo.subject}">
						<c:if test="${vo.secret==1}">
							<a href="myQcontent.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
						</c:if>
							<c:if test="${vo.secret==2 }">
							<img src="./board_img/unlocked.png" style="width: 20px; height:auto;" >
							<a href="myQcontent.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
						</c:if>
					
						<%-- <c:if test="${grade<=1 }">
							<c:if test="${vo.secret==2 }">
								<img src="./board_img/lock.png" style="width: 10px; height:auto;" align="middle">
							</c:if>
								<a href="myQcontent.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
						</c:if>
						<%-- <!-- new 이미지 표시 --> 
						<c:if test="${today eq vo.dbday}">
							<sup><img src="./board_img/new7.png" style="width: 15px; height:auto;" ></sup>											
						</c:if>  --%>
					</c:if> 
						<!-- 삭제된 글이면 읽을 수 없게 막음 --> 
							<c:if test="${msg==vo.subject}">
								<font color="#BDBDBD" >${vo.subject }</font>
							</c:if>				
					</td>
					<td width="15%" class="tdcenter" >${vo.id }</td>
					<td width="15%" class="tdcenter" >${vo.dbday } </td>
					<td width="10%" class="tdcenter" >${vo.hit }</td>
				</tr>
			</c:forEach>
		</table>	
	<table>
						<tr>
							<td align="center"  style="position: relative;"> 	
								<ul class="pagination pagination-sm" style="margin-top: 0px;">
									<c:if test="${curpage<=block }">
									<li><a href="myMemberquestion.do?page=${curpage>1?curpage-1:curpage}">&laquo;</a></li>
								</c:if>
								<c:if test="${curpage>block }">
									<li><a href="myMemberquestion.do?page=${curpage-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${fromPage }" end="${toPage }">
									<c:if test="${curpage==i }">
										<li><a href="myMemberquestion.do?page=${curpage}">${i }</a></li>
									</c:if>
									<c:if test="${curpage!=i }">
										<li><a href="myMemberquestion.do?page=${i}">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${toPage<totalpage }">
									<li><a href="myMemberquestion.do?page=${toPage+1}">&raquo;</a></li>
								</c:if>
								<c:if test="${toPage>=totalpage }">
									<li><a href="myMemberquestion.do?page=${curpage<totalpage?curpage+1:curpage}">&raquo;</a></li>
								</c:if>
								</ul>
							
								
							</td>														
						</tr>
					</table>
					<!-- <table>
						<tr>
							<td align="right" style="position: relative; right: 0px; bottom: 62px;"><a href="secretboard_insert.do" style="padding-right:30px;"><span style=" width:100px; height:100px; 2em; padding: 1px solid black;">글쓰기</span></a></td>
						</tr>
					</table>
			 -->
</table>
</body>
</html>