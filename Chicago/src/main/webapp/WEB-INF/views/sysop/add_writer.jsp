<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function send() {

		var f = document.frm;

		f.submit();
	}
</script>
<style type="text/css">
	.button {
		background-color: white;
		color: black;
		border: 2px solid #505050;
		font-size: 11px;
	}
</style>
</head>
<body>
	<div id="content">
		<form:form action="add_writer_ok.do" commandName="writer"
			acceptCharset="UTF-8" enctype="multipart/form-data" id="frm"
			name="frm" method="post">
			<table>
				<tr>
					<th width="20%">이름</th>
					<td colspan="3"><form:input path="writer_name" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;" /></td>
				</tr>
				<tr>
					<th width="20%">출생</th>
					<td width="30%"><input type="date" name="birthVal" id="birth" style="border-top: 0px; border-right: 0px; border-left: 0px; border-bottom: #00000 1px solid;" /></td>
					<th width="20%">사망</th>
					<td width="30%"><input type="date" name="deathVal" id="death" style="border-top: 0px; border-right: 0px; border-left: 0px; border-bottom: #00000 1px solid;" /></td>
				</tr>
				<tr>
					<th width="20%">작가소개</th>
					<td colspan="3"><form:textarea path="info" cols="130" rows="3" /></td>
				</tr>
				<tr>
					<th width="20%">Img</th>
					<td colspan="3"><input type="file" size="56" id="upload" name="upload" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<input type="button" value="추가" onclick="send();" class="button">
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>