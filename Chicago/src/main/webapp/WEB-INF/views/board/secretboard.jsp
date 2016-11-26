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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn2').click(function(){						
		var ss=$('#ss').val();
			
		if(ss==""){
			$('#ss').focus();
			return;
		}
		$('#ff').submit();			
		});
});
</script>



<body>
<!-- 각 게시판 링크 -->
	<br/>
	<table>
		<tr>

				<td align="left" style="font-size:30px; padding-left: 10px;">1:1 게시판</td>

				
		</tr>
		<tr>			
			<td align="right">
				<a href="noticeboard.do" style="color: #b3b3b3">공지사항</a> l
				<a href="faqboard.do" style="color: #b3b3b3"> Faq</a> l 1:1게시판 l
				<a href="reviewboard.do" style="color: #b3b3b3">리뷰게시판</a>
			</td>
		</tr>
	</table>
	<table>
		<tr>		
				<td class="bTitle">1:1게시판 입니다.</td>
			
				<td align="right" style="padding-right: 20px;">			
						
					&nbsp;&nbsp;${curpage } page / ${totalpage  } pages			
				
				</td>
		</tr>
	</table>
	<!-- 리스트 시작 -->
	
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
						<c:if test="${id==null || grade>1 }">
							<c:if test="${vo.secret==1}">
								<a href="secret_content.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
							</c:if>
							<c:if test="${vo.secret==2 }">
								<c:if test="${vo.mine == null || id!=vo.mine}">
									<img src="./board_img/lock.png" style="width: 10px; height:auto;" >
									<a href="secretboard_pwd_check.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
								</c:if>
								<c:if test="${vo.mine !=null && id==vo.mine }">
								
									<img src="./board_img/unlocked.png" style="width: 20px; height:auto;" >
									<a href="secret_content.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
								</c:if>
								
							</c:if>
					</c:if>
						<c:if test="${grade<=1 }">
							<c:if test="${vo.secret==2 }">
								<img src="./board_img/lock.png" style="width: 10px; height:auto;" align="middle">
							</c:if>
								<a href="secret_content.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
						</c:if>
						<%-- <!-- new 이미지 표시 -->
						 <c:if test="${today eq vo.dbday}">
							<sup><img src="./board_img/new7.png" style="width: 15px; height:auto;" ></sup>											
						</c:if>   --%>
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
					
					<table >						
						<tr>
							<td style="padding-left: 20px;">
								<form method="post" action="secretboard.do" id="ff">
									Search: 
									<select name="fs">
											<c:if test="${fs eq 'id' }" >
										<option value="id" selected="selected">ID</option>
											</c:if>
											<c:if test="${fs ne 'id' }">
												<option value="id">ID</option>
											</c:if>
											<c:if test="${fs eq 'subject' }">
										<option value="subject" selected="selected">제목</option>
											</c:if>
											<c:if test="${fs ne 'subject' }">
										<option value="subject">제목</option>
											</c:if>
											<c:if test="${fs eq 'content' }">
										<option value="content" selected="selected">내용</option>
											</c:if>
										<c:if test="${fs ne 'content' }">
											<option value="content">내용</option>
										</c:if>
									</select>
									
									<c:if test="${ss eq null }">
						
										<input type="text" size="10" name="ss" id="ss" style="border: 1px solid  #e3e3e3; height: 17px;">
									</c:if>
									<c:if test="${ss ne null }">
										<input type="text" size="10" name="ss" id="ss" value="${ss }" style="border: 1px solid  #e3e3e3">
									</c:if>
									
									<input type="button" value="찾기" id="findBtn2" style="background-color: white;"> 
									<input type="hidden" name="page" value="${curpage }">
									<!-- 	<span id="print"></span> -->
								</form>
							</td>			
							<c:if test="${id!=null }">
							<td align="right"><a href="secretboard_insert.do" style="padding-right:30px;">글쓰기</a></td>
							</c:if>
						</tr>
					</table>
				
					<table>
						<tr>
							<td align="center"> 	
								<ul class="pagination pagination-sm" style="margin-top: 0px;">
									<c:if test="${curpage<=block }">
									<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage>1?curpage-1:curpage}">&laquo;</a></li>
								</c:if>
								<c:if test="${curpage>block }">
									<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${fromPage }" end="${toPage }">
									<c:if test="${curpage==i }">
										<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage}">${i }</a></li>
									</c:if>
									<c:if test="${curpage!=i }">
										<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${i}">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${toPage<totalPage }">
									<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${toPage+1}">&raquo;</a></li>
								</c:if>
								<c:if test="${toPage>=totalPage }">
									<li><a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage<totalPage?curpage+1:curpage}">&raquo;</a></li>
								</c:if>								
								</ul>
								
								
							</td>							
						</tr>
					</table>
			
					
				</center>
				
</body>
</html>