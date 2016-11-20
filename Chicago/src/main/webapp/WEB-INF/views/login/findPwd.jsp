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
		var id = $('#id').val();
		if(id.trim()==""){
			$('#id').focus();
			return;
		}
		var name = $('#name').val();
		if(name.trim()==""){
			$('#name').focus();
			return;
		}
		var phone = $('#phone').val();
		if(phone.trim()==""){
			$('#phone').focus();
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
					<h2 class="margin-bottom-20">비밀번호 찾기</h2>
						<form:form action="findPwd_ok.do" commandName="memberVO" name="frm" id="frm">
							<div class="join_mem">
								<div class="join_cont1">
									<table width="100%">
			<tr>
				<th><span class="titR">*</span><spring:message code="form.id"/></th>
				<td><form:input path="id" maxlength="16" id="id" placeholder="5자리 이상 입력하세요"/>
					<span id="idResult"></span>
					<input type="hidden" id="check" value="Y" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th><span class="titR">*</span><spring:message code="form.name"/></th>
				<td><form:input path="name" maxlength="16" placeholder="이름을 정확히 입력해주세요" id="name" /></td>
			</tr>
			<tr>
				<th><span class="titR">*</span><spring:message code="form.phone"/></th>
				<td><form:input path="phone" maxlength="12" id="phone" placeholder="숫자만 입력하세요" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="조회" id="sendBtn" onclick="send();" class="btn btn-primary"></td>
			</tr>
		
		</table>
								
								
								</div>
							</div>
		
		</form:form>
	</div>
	</div>
</body>
</html>