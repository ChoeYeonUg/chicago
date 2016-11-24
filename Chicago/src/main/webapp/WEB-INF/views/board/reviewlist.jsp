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
<style type="text/css">



</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#findBtn2').click(function() {
			var ss = $('#ss').val();

			if (ss == "") {

				$('#ss').focus();
				return;
			}
			$('#ff').submit();
		});
	});
</script>

</head>
<body>
	<br/>
	<table>
		<tr>
			<td align="left" style="font-size:30px; padding-left: 10px;">리뷰 게시판</td>
		</tr>
		<tr>
			<td align="right"><a href="noticeboard.do"
				style="color: #b3b3b3">공지사항</a> l <a href="faqboard.do"
				style="color: #b3b3b3"> Faq</a> l <a href="secretboard.do"
				style="color: #b3b3b3"> 1:1게시판</a> l 리뷰게시판</td>
		</tr>
	</table>


	<table>
		<tr>
			<td class="bTitle">리뷰게시판 입니다.</td>
			<td align="right" style="padding-right: 20px;">
				&nbsp;&nbsp;${curpage } page / ${totalpage  } pages</td>
		</tr>
		
		<!-- border-top: 1px dotted #e3e3e3; -->
		
	</table>
	<!-- 리스트 시작 -->
	<table class="reviewTable" style="width: 800px;">
			<tr height="30px" >
				<th width="10%" >도서</th>							
				<th width="70%">내용</th>
				<th width="5%" >ID</th>
				<th width="10%" >날짜</th>
				<th width="5%">별점</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr height="20px">
					<td rowspan="2" class="A" width="15%" style="border-bottom: 1px solid #e3e3e3;"><a href="bookDetail.do?book_code=${vo.book_code }" ><img alt="bookImage" src="${vo.img }"  style="width: 70px; height:auto;" ></a></td>
					
					<td width="50%" class="A" align="left" style="text-align: left; "> <a href="bookDetail.do?book_code=${vo.book_code }" ><b>[${vo.writer}]&nbsp;${vo.book_name }</b></a></td>
					<td width="10%" class="A" style=" align:center; "><b>${vo.id }</b></td>
					<td width="15%" class="A" style=" ">${vo.dbday } </td>
					<td width="10"  class="A" style="" >
						<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
							<p style="WIDTH: ${vo.score}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
							</p>
						</div>
					</td>
				</tr>	
				<tr >
					<td colspan="5" class="reviewTableCnt" style="text-align: left; valign:top; border-bottom: 1px solid #e3e3e3; padding-left: 10px;">${vo.content}</td>
				</tr>					
			</c:forEach>						
		</table>		

		<table>
			<tr>
				<td style="padding-left: 20px;">
					<form method="post" action="reviewboard.do" id="ff">
						Search: <select name="fs">
							<c:if test="${fs eq 'id' }">
								<option value="id" selected="selected">ID</option>
							</c:if>
							<c:if test="${fs ne 'id' }">
								<option value="id">ID</option>
							</c:if>
							<c:if test="${fs eq 'book_name' }">
								<option value="book_name" selected="selected">책제목</option>
							</c:if>
							<c:if test="${fs ne 'book_name' }">
								<option value="book_name">책제목</option>
							</c:if>
							<c:if test="${fs eq 'content' }">
								<option value="content" selected="selected">내용</option>
							</c:if>
							<c:if test="${fs ne 'content' }">
								<option value="content">내용</option>
							</c:if>
							<c:if test="${fs eq 'writer' }">
								<option value="writer" selected="selected">작가</option>
							</c:if>
							<c:if test="${fs ne 'writer' }">
								<option value="writer">작가</option>
							</c:if>
							<c:if test="${fs eq 'book_code' }">
								<option value="book_code" selected="selected">북코드</option>
							</c:if>
							<c:if test="${fs ne 'book_code' }">
								<option value="book_code" style="display: none;">북코드</option>
							</c:if>
						</select>
						<c:if test="${ss eq null }">
							<input type="text" size="10" name="ss" id="ss" style="border: 1px solid  #e3e3e3; height: 17px;">
						</c:if>
						<c:if test="${ss ne null }">
							<input type="text" size="10" name="ss" id="ss" value="${ss }" style="border: 1px solid  #e3e3e3">
						</c:if>
						<input type="button" value="찾기" id="findBtn2" style="background-color: white;"> <input
							type="hidden" name="page" value="${curpage }">
						<!-- 	<span id="print"></span> -->
					</form>
				</td>
			</tr>
		</table>


		<table width="800px" >
			<tr>
				<td align="center">
					<ul class="pagination pagination-sm" style="margin-top: 0px;">
						<c:if test="${curpage<=block }">
							<li><a
								href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage>1?curpage-1:curpage}">&laquo;</a></li>
						</c:if>
						<c:if test="${curpage>block }">
							<li><a
								href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							<c:if test="${curpage==i }">
								<li><a
									href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage}">${i }</a></li>
							</c:if>
							<c:if test="${curpage!=i }">
								<li><a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${i}">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${toPage<totalPage }">
							<li><a
								href="reviewboard.do?fs=${fs }&ss=${ss }&page=${toPage+1}">&raquo;</a></li>
						</c:if>
						<c:if test="${toPage>=totalPage }">
							<li><a
								href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage<totalPage?curpage+1:curpage}">&raquo;</a></li>
						</c:if>
					</ul> 
				</td>
			</tr>
		</table>
</body>
</html>