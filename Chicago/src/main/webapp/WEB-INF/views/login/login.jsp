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
</head>
<body>
	<form:form action="login_ok.do" commandName="memberVO">
	<div class="container">
		<div class="row margin-vert-30">
		<!-- Login Box -->
			<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
				<c:if test="${id eq null }">
					<div class="login-header margin-bottom-30">
						<h2>로그인 하기</h2>
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon">
							<i class="fa fa-user"></i>
						</span>
						<form:input path="id" class="form-control" />
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<form:password path="pwd" class="form-control" />
					</div>
					<div class="row">
						<div class="col-md-6">
							<label class="checkbox">
								<a href="clause.do">아직 회원이 아니신가요?</a>
							</label>
						</div>
						<div class="col-md-6">
							<input type="submit" value="로그인" class="btn btn-primary pull-right">
						</div>
					</div>
						<hr>
						<h4>비밀번호를 잊어버리셨나요?</h4>
						<p>
						<a href="findPwd.do">비밀번호 찾기</a>를 눌러주세요</p>
					</c:if>
					<c:if test="${id ne null }">
						<hr>
						<h4>이미 로그인 중이십니다!</h4>
						<p>
						<a href="logout.do">로그아웃</a> 하시겠습니까?</p>
					</c:if>
				</div>
			</div>
		</div>
	</form:form>
	<%-- 
	<c:if test="${id ne null }">
	<h2>현재 접속한 아아디 ${id }</h2>
	</c:if>
	 --%>
</body>
</html>