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
		if(idVal.length > 4){
		$.ajax({
			url : "id_check.do",
			type : "post",
			data : $("form").serialize(),
			dataType : 'text',
			success : function(data) {
				$("#idResult").html(data);
			},
			error : function(error) {
				alert(error.statusText);
			}
		});

		return false;
		}else{
			$('#idResult').html("");
		}
	});
	
	$('#sendBtn').click(function(){
		var f = document.frm;
		var idVal = $('#id').val();
		if(idVal.trim()==''){
			alert('아이디 입력좀;;;');
			$('#id').focus();
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

</script>
</head>
<body>
	<div id="content">
            <div class="container background-white">
                <div class="row margin-vert-30">
                    <!-- Register Box -->
                    <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                     <h2 class="margin-bottom-20">회원가입</h2>
		<form:form action="join_ok.do" commandName="memberVO" name="frm">
		<table>
			<tr>
				<td>아이디</td>
				<td><form:input path="id" maxlength="16" id="id"/>
					<span id="idResult"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><form:input path="name" maxlength="16" /></td>
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
				<td><form:input path="phone" maxlength="12" id="phone"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%-- <form:radiobuttons items="${gender }"  path="gender"/> --%>
					<input type="radio" name="gender" value="1" checked="checked">남
					<input type="radio" name="gender" value="2">여
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="zipcode" placeholder="우편번호" disabled="disabled">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="addr" id="addr" placeholder="주소">
					<input type="text" id="addr2" placeholder="상세주소">
					
<script>
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
				
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="가입하기" id="sendBtn" onclick="send"></td>
			</tr>
		
		</table>
		</form:form>
	</div>
	</div>
	</div>
	</div>

</body>
</html>