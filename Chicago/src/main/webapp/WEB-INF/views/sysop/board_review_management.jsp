<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<style type="text/css">
table {
	width: inherit;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function openPop(review_no){
	
/* 	alert(review_no);  */
	if(confirm("삭제하시겠습니까?")){ 
		location.href ="reviewboard_management_delete.do?&review_no="+review_no;
		/* location.href = "deleteMember.do?id="+data; */
	} 
	return false;
};
function popupOpen(review_no){
	var popUrl="boardReview_management_content.do?review_no="+review_no;
	var popOption="width=500, height=370, resizable=no scrollbars=no status=no;";
	window.open(popUrl,"",popOption);
};
</script>
</head>
<body>
	<table width="700">
					<tr>
						
						<td width="30%" align="left" ><a href="board_management.do"	style="color: #b3b3b3">일반게시판 </a>l 
						 리뷰게시판</td>
					</tr>
				</table>
	<table class="commonTable" style="	width: inherit;">
		<tr>
			<th width="10%">번호</th>
			<th width="10%">글쓴이</th>
			<th width="40%">내용</th>
			<th width="20%">등록일</th>
			<th width="10%">평점</th>
			<th width="15%">기타</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>		
				<td>${vo.review_no }</td>	
				<td>${vo.id }</td>
				<td style="text-align: left;"><a href="javascript:popupOpen('${vo.review_no }');">${vo.content }</a></td>
				<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td align="center">
					<div style="CLEAR: both; PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						<p style="WIDTH: ${vo.score*20}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						</p>
					</div>				
			
				</td>
				
				<td>
					<a href="#" onclick="return openPop('${vo.review_no}');">삭제</a>
				</td>
			</tr>
		</c:forEach>	
	</table>
	<table>
		<tr>
			<td align="center">
				<ul class="pagination pagination-sm">		
					<li><a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<li><a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a>
				</c:forEach>
					<li><a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>	
				</ul>
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="reviewboard_management.do" method="post">
					<select name="fs">
						<option value="id">id</option>
						<option value="content">내용</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
		
</body>
</html>