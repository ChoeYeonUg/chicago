<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
<table>
	<tr>
		<th>id</th>
		<th>이름</th>
		<th>휴대폰</th>
		<th>등급</th>
		<th>비고</th>
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
					<c:forEach begin="1" end="5" step="1" var="i">
						<c:if test="${vo.grade == i }"><option value="${i }" selected="selected">${i }</option></c:if>
						<c:if test="${vo.grade != i }"><option value="${i }">${i }</option></c:if>
					</c:forEach>
					</select>
					<!-- <input type="button" value="변경" onclick="send()"> -->
					<input type="submit" value="변경">
				</form>
			</td>
			<td><a href="#">회원삭제</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>