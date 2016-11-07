<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/join/clause.css" rel="stylesheet" />
</head>
<body>
	<form action="join.do" method="post">
		<div class="contents" align="center">
			<div class="userAgreement">
				<h2><spring:message code="join.clause" /></h2>
				
				<div class="uaCnts">
					<p class="ua">
						<input type="checkbox" name="agree" value="true">
						<label><spring:message code="join.clause" /></label>
					</p>
					<spring:message code="clause.content" />
				</div>
				
				<div class="bt">
					<input type="submit" value='<spring:message code="join.next"/>'/>
					<input type="button" value='<spring:message code="memberSecurePassword.btCancel"/>' onclick="javascript:history.back()"/>
				</div>
				
			</div>
		</div>
	</form>
</body>
</html>