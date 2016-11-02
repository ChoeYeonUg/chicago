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
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#id").keyup(function() {
		var idVal = $('#id').val();
		var params = "id="+idVal;
		console.log($('form').serialize());
		if(idVal.length > 4){
			$.ajax({
				url : "id_check.do",
				type : "post",
				data : params,
				dataType : 'text',
				success : function(data) {
					//$("#idResult").html(data);
					if(data == "true"){
						$("#idResult").html("사용가능한 아이디 입니다.");
						$("#check").attr('value','Y');
					}else{
						$("#idResult").html("이미 존재하는 아이디 입니다.");
						$("#check").attr('value','N');
					}
				},
				error : function(error) {
					alert(error.statusText);
				}
			});
			return false;
		}else{
			$('#idResult').html("");
			$("#check").attr('value','N');
		}
	});
	
	$('#sendBtn').click(function(){
		var f = document.frm;
		var idVal = $('#id').val();
		if(idVal.trim()=='' || $('#check').val()=="N"){
			alert('아이디를 확인해주세요');
			$('#id').focus();
			return;
		}
		
		var name = $('#name').val();
		if(name.trim()==''){
			alert('이름을 입력해주세요.');
			$('#name').focus();
			return;
		}
		
		var pwd = $('#pwd').val();
		if(pwd.trim()==''){
			alert('비밀번호를 입력해주세요.');
			$('#pwd').focus();
			return;
		}
		var phone = $('#phone').val();
		if(phone.trim()==''){
			alert('휴대폰 번호를 입력해주세요.');
			$('#phone').focus();
			return;
		}
		
		var addr = $('#addr').val();
		var addr2 = $('#addr2').val();
		if(addr2.trim()!="" && addr.trim()!=""){
			document.getElementById("addr").value = addr+' '+addr2;
		}
		
		if(addr == null || addr.trim() == ""){
			$('#zipcode').val(0);
		}
		
		f.submit();
	});
	
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

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}
</script>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-30">
			<!-- Register Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<h2 class="margin-bottom-20"><spring:message code="form.join"/></h2>
						<form:form action="join_ok.do" commandName="memberVO" name="frm" id="frm">
		<table>
			<tr>
				<td><spring:message code="form.id"/></td>
				<td><form:input path="id" maxlength="16" id="id"/>
					<span id="idResult"></span><form:errors path="id"/>
					<input type="hidden" id="check" value="Y" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td><spring:message code="form.name"/></td>
				<td><form:input path="name" maxlength="16" /><form:errors path="name"/></td>
			</tr>
			<tr>
				<td><spring:message code="form.pwd"/></td>
				<td><form:password path="pwd" maxlength="16"/><form:errors path="pwd"/></td>
			</tr>
<%-- 			<tr>
				<td>패스워드 확인</td>
				<td><form:input path="confirmpwd"/></td>
			</tr> --%>
			<tr>
				<td><spring:message code="form.email"/></td>
				<td><form:input path="email"/><br/><form:errors path="email"/></td>
			</tr>
			<tr>
				<td><spring:message code="form.phone"/></td>
				<td><form:input path="phone" maxlength="12" id="phone"/><form:errors path="phone"/></td>
			</tr>
			<tr>
				<td><spring:message code="form.gender"/></td>
				<td><%-- <form:radiobuttons items="${gender }"  path="gender"/> --%>
					<input type="radio" name="gender" value="1" checked="checked"><spring:message code="form.man"/>
					<input type="radio" name="gender" value="2"><spring:message code="form.woman"/>
				</td>
			</tr>
			<tr>
				<td><spring:message code="form.addr"/></td>
				<td>
					<input type="text" name="zipcode" id="zipcode" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
						<input type="button" onclick="sample6_execDaumPostcode()" value="<spring:message code="form.zipcode"/>"><br/>
					<input type="text" name="addr" id="addr" placeholder="<spring:message code="form.addr"/>">
					<input type="text" id="addr2" placeholder="<spring:message code="form.addr2"/>">
					
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="<spring:message code="form.btn"/>" id="sendBtn" onclick="send"></td>
			</tr>
		
		</table>
		</form:form>
	</div>
	</div>
	</div>
	</div>

</body>
</html>