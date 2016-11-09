<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	var popOption="width=500, height=460, resizable=no scrollbars=no status=no;";
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
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="100">글쓴이</th>
			<th width="100">제목</th>
			<th width="200">등록일</th>
			<th width="60">평점</th>
			<th width="60">기타</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>		
				<td>${vo.review_no }</td>	
				<td>${vo.id }</td>
				<td><a href="javascript:popupOpen('${vo.review_no }');">${vo.subject }</a></td>
				<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${vo.score }</td>
				<td>
					<a href="#" onclick="return openPop('${vo.review_no}');">삭제</a>
				</td>
			</tr>
		</c:forEach>	
	</table>
	<table>
		<tr>
			<td>
				<a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
				</c:forEach>
				&nbsp;<a href="reviewboard_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
			</td>
		</tr>
		
		<tr>
			<td>
				<form action="reviewboard_management.do" method="post">
					<select name="fs">
						<option value="id">id</option>
						<option value="subject">subject</option>
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