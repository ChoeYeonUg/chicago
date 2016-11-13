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
<link href="css/join/join.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#phone").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }

    });
	$("#id").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
        }

    });
});

	function send(){
		var f = document.frm;
		var pwd = $('#pwd').val();
		if(pwd.trim()=="" && pwd.length < 5){
			$('#pwd').focus();
			return;
		}
		var pwdCheck = $('#pwdCheck').val();
		if(pwdCheck.trim()=="" && pwdCheck.length < 5){
			$('#pwdCheck').focus();
			return;
		}
		
		f.submit();		
	}
</script>
</head>
<body>
	<div class="row margin-vert-30">
			<!-- Register Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<h2 class="margin-bottom-20">비밀번호 재설정</h2>
						<form action="changePwd_ok.do" name="frm" id="frm">
							<input type="hidden" name="id" value="${id }">
							<div class="join_mem">
								<div class="join_cont1">
									<table width="100%">
			<tr>
				<th><span class="titR">*</span><spring:message code="form.pwd"/></th>
				<td><input type="password" name="pwd" maxlength="16" id="pwd" placeholder="비밀번호 확인" /></td>
			</tr>
			<tr>
				<th><span class="titR">*</span>비밀번호 확인</th>
				<td><input type="password" name="pwdCheck" maxlength="16" id="pwdCheck" placeholder="비밀번호 확인" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="번경" id="sendBtn" onclick="send();" class="btn btn-primary"></td>
			</tr>
		
		</table>
								
								
								</div>
							</div>
		
		</form>
	</div>
	</div>
</body>
</html>