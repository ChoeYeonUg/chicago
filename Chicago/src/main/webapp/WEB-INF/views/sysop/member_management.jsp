<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function send(){
	var vg = $('#vograde').val();
	var g = $('#grade').val();
	if(vg == g){
		return;
	}
	elem = document.getElementById($('#id').val());
	alert($('#id').val());
	elem.submit();
};

function openPop(data){
	
	alert(data);
	
	if(confirm("삭제하시겠습니까?")){ 
		location.href = "deleteMember.do?id="+data;
	} 
	return false;
};
</script>
</head>
<body>
<table class="commonTable" style="	width: inherit;">
	<tr>
		<th width="100">id</th>
		<th width="100">이름</th>
		<th width="200">휴대폰</th>
		<th width="100">등급</th>
		<th width="100">비고</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.id }</td>
			<td>${vo.name }</td>
			<td>${vo.phone }</td>
			<td><%-- ${vo.grade }<a href="#">변경</a> --%>
				<form action="changeGrade.do" id="${vo.id }" method="post">
					<input type="hidden" name="id" value="${vo.id }" id="id">
					<input type="hidden" name="vograde" value="${vo.grade }" disabled="disabled" id="vograde">
					<select name="grade" id="grade">
					<c:forEach begin="2" end="5" step="1" var="i">
						<c:if test="${vo.grade == i }"><option value="${i }" selected="selected">${i }</option></c:if>
						<c:if test="${vo.grade != i }"><option value="${i }">${i }</option></c:if>
					</c:forEach>
					</select>
					<!-- <input type="button" value="변경" onclick="send()"> -->
					<input type="submit" value="변경">
				</form>
			</td>
			<td><a href="#" onclick="return openPop('${vo.id}');">회원삭제</a></td>
		</tr>
	</c:forEach>	
</table>
<table style="	width: inherit;">
	<tr>
		<td align="center">
			<ul class="pagination pagination-sm">
				<li><a href="member_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
				<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
					<li><a href="member_management.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a></li>
				</c:forEach>
				<li><a href="member_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>
			</ul>
		</td>
	</tr>
	
	<tr>
		<td>
			<form action="member_management.do" method="post">
				<select name="fs">
					<option value="id">id</option>
					<option value="name">name</option>
				</select>
				<input type="search" id="ss" name="ss">
				<input type="submit" value="검색" class="btn total">
			</form>
		</td>
	</tr>
</table>
</body>
</html>