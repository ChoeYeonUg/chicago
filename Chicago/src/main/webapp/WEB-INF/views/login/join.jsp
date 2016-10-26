<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form:form action="join_ok.do" commandName="memberVO">
		<table>
			<tr>
				<td>아이디</td>
				<td><form:input path="id" maxlength="16"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><form:input path="name" maxlength="16"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><form:password path="pwd" maxlength="16"/></td>
			</tr>
<%-- 			<tr>
				<td>패스워드 확인</td>
				<td><form:input path="confirmpwd"/></td>
			</tr> --%>
			<tr>
				<td>E메일</td>
				<td><form:input path="email"/></td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><form:input path="phone" maxlength="12"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%-- <form:radiobuttons items="${gender }"  path="gender"/> --%>
					<input type="radio" name="gender" value="1" checked="checked">남
					<input type="radio" name="gender" value="2">여
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입하기"></td>
			</tr>
		
		</table>
		</form:form>
	</center>

</body>
</html>