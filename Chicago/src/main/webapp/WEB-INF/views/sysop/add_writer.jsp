<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<form:form action="add_writer_ok.do" commandName="writer" acceptCharset="UTF-8" enctype="multipart/form-data" id="frm" name="frm" method="post">
<table>
	<tr>
		<th>이름</th>
		<td><form:input path="writer_name"/></td>
	</tr>
 	<tr>
		<th>출생</th>
		<td><input type="date" name="birthVal" id="birth" /></td>
	</tr>
	<tr>
		<th>사망</th>
		<td><input type="date" name="deathVal" id="death" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<form:textarea path="info" cols="40" rows="10"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="file" size="56" id="upload" name="upload">
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