<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function send(){
	var f = document.frm;
	f.submit();
}
</script>
</head>
<body>
<form:form action="update_event_ok.do" commandName="event" id="frm" name="frm" method="post">
<table>
	<tr>
		<th>이벤트명</th>
		<td><form:input path="event_name" value="${event.event_name }" />
			<form:hidden path="event_no" value="${event.event_no }" />
		</td>
	</tr>
	<tr>
		<th>이벤트 장소</th>
		<td><form:select path="store_name">
			<c:forEach items="${storeList }" var="store">
				<c:if test="${store eq event.store_name }">
					<form:option value="${store }">${store }</form:option>
				</c:if>
				<c:if test="${store ne event.store_name }">
					<form:option value="${store }">${store }</form:option>
				</c:if>
			</c:forEach>
		</form:select></td>
	</tr>
 	<tr>
		<th>이벤트 시작</th>
		<td><input type="date" name="startDay" id="start" value="${startDay }" /></td>
	</tr>
	<tr>
		<th>이벤트 끝</th>
		<td><input type="date" name="endDay" id="end" value="${endDay }" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<form:textarea path="description" cols="40" rows="10" value="${event.description }" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<%-- <form:button>전송</form:button> --%>
			<input type="button" value="추가" onclick="send();">
		</td>
	</tr>
	
</table>
</form:form>
</body>
</html>