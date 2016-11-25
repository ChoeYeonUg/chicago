<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

function openPop(board_no){	
/* 	alert(board_no);  */	
	if(confirm("삭제하시겠습니까?")){ 
		location.href ="board_management_delete.do?&board_no="+board_no;
		/* location.href = "deleteMember.do?id="+data; */
	} 
	return false;
};
function popupOpen(board_no){
	var popUrl="board_management_content.do?board_no="+board_no;
	var popOption="width=500, height=400, resizable=no scrollbars=no status=no;";
	window.open(popUrl,"",popOption);
};
</script>
<style type="text/css">


</style>
</head>
<body>

	<table>
		<tr>						
			<td width="30%" align="left" >일반게시판 l <a href="reviewboard_management.do"
							style="color: #b3b3b3"> 리뷰게시판 </a></td>
					</tr>
				</table>
	<table class="commonTable" style="	width: inherit;">
		<tr>
			<th width="10%">번호</th>
			<th width="10%">글쓴이</th>
			<th width="45%">제목</th>
			<th width="20%">등록일</th>
			<th width="15%">기타</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.board_no }</td>					
				<td>${vo.id }</td>
				<td style="text-align: left;"><a href="javascript:popupOpen('${vo.board_no }');" >${vo.subject }</a></td>
				<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>				
				<c:if test="${msg!=vo.subject }">
				<a href="#" onclick="return openPop('${vo.board_no}');">삭제</a>				
				</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>
	<table>
		<tr>
			<td align="center">
				<ul class="pagination pagination-sm">				
					<li><a href="board_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<li><a href="board_management.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a></li>
				</c:forEach>
				<li><a href="board_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>		
				</ul>
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="board_management.do" method="post">
					<select name="fs">
						<option value="id">id</option>
						<option value="subject">subject</option>
						<option value="content">내용</option>
					</select>
					<input type="search" id="ss" name="ss">
					<input type="submit" value="검색" class="btn total">
				</form>
			</td>
		</tr>
	</table>

</body>
</html>