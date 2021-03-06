<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta >
<title>Made By ChoDing!!</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/mypage_css/memberinfo.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script src="js/animate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function send(){
	var f=document.frm;
		
	/* if(f.USER_ZIPCODE.value==""){
		alert("우편번호는 꼭 있어야합니다!");
		f.USER_ZIPCODE.focus();
		return;
	} */
	
	var addr = $('#addr').val();
	var addr2 = $('#addr2').val();
	if(addr2.trim()!="" && addr.trim()!=""){
		document.getElementById("addr").value = addr+' '+addr2;
	}
	
	if(addr == null || addr.trim() == ""){
		$('#zipcode').val(0);
	}
	
	/* if(f.USER_ADDESS.value==""){
		alert("나머지 주소를 입력하세요!");
		f.USER_ADDRESS.focus();
		return;
	} */
	
	/* if(f.USER_EMAIL.value==""){
		alert("이메일을 입력하시오!");
		f.USER_EMAIL.focus();
		return;
	} */
		
	if(f.USER_PHONE.value==""){
		alert("전화번호를 입력하시오!");
		f.USER_PHONE.focus();
		return;
	}
	
	/* if(f.USER_ZIPCODE.value!="" && f.USER_ADDESS.value!="" && f.USER_EMAIL.value!="" && f.USER_PHONE.value!=""){
		alert("수정되었습니다!");
		return;
	} */
	
	f.submit();
	
}

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
<style type="text/css">
	th {
		text-align: left;
		width: 20%;
		
	}
	
	th, td {
		height: 50px;
		vertical-align: middle;
		margin: 1px;
		padding: 1px;
	}
	
	.text {
		border-top: 0px;
		border-right: 0px;
		border-left: 0px;
		border-bottom: #505050 1px solid;
	}
	
</style>
</head>
<body>
	<div class="col-md-9">
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							<spring:message code="memberInfoModify.header"/>
						</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;<spring:message code="memberInfoModify.notFy1"/><br/>
							◎&nbsp;<spring:message code="memberInfoModify.notFy2"/><br/>
							◎&nbsp;<spring:message code="memberInfoModify.notFy3"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<!-- 회원 정보 수정 시작 -->
		<form:form method="post" name="frm" id="frm" action="modyfyMemberInfo_ok.do" commandName="com.sist.dao.MemberVO">
			<table>
				<tr>
					<th >이름</th>
					<td><input type="text" name="name" id="name" class="text" maxlength="36" value="${vo.name}"></td>
				</tr>
				<tr>
					<th >성별</th>
					<td>
						<c:if test="${vo.gender == 1 }">
							<spring:message code="memberInfoModify.genderMan"/>
						</c:if>
						<c:if test="${vo.gender == 2 }">
							<spring:message code="memberInfoModify.genderWoman"/>
						</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;			
						<b><spring:message code="form.gender"/></b>
							<input type="radio" name="gender" value="1" checked="checked"><spring:message code="form.man"/>
							<input type="radio" name="gender" value="2"><spring:message code="form.woman"/></td>
				</tr>
				<tr>
					<th >비밀번호</th>
					<td><a id="USER_PASSWORD" class="" href="modyfyMemberPwd.do" target=""><spring:message code="memberInfoModify.btPassword"/></a></td>
				</tr>
				<tr>
					<th >주소</th>
					<td height="90px">
						<b><spring:message code="memberInfoModify.CurAddress"/></b>
						${vo.zipcode}&nbsp;${vo.addr}
						
						<br/>
						<b><spring:message code="memberInfoModify.NewAddress"/></b>
						<input type="text" name="zipcode" id="zipcode" placeholder="<spring:message code="form.zip"/>" readonly="readonly" class="text" >
						<input type="button" class="btn total" onclick="sample6_execDaumPostcode()" value="<spring:message code="memberInfoModify.btZipcode"/>">
						<br>
						<input type="text" name="addr" id="addr" placeholder="<spring:message code="form.addr"/>" class="text" >
						<input type="text" id="addr2" placeholder="<spring:message code="form.addr2"/>" class="text" >
					</td>
				</tr>
				<tr>
					<th >이메일</th>
					<td><input type="text" name="email" id="email" class="" maxlength="36" value="${vo.email}" class="text" ></td>
				</tr>
				<tr>
					<th >전화번호</th>
					<td><input type="text" name="phone" id="USER_PHONE" class="" maxlength="36" value="${vo.phone}" class="text" ></td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="right">
						<input type="button" value="<spring:message code="memberInfoModify.btOk"/>" onclick="send()" class="btn total">
						<input type="button" value="<spring:message code="memberInfoModify.btCancel"/>" onclick="javascript:location.href='main.do';" class="btn total">
					</td>
				</tr>
			</table>
		</form:form>
		<!-- 회원 정보 수정 끝 -->
	</div>

	<%-- <!-- Member Info Modify -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="memberInfoModify.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="memberInfoModify.notFy1"/></li>
						<li><spring:message code="memberInfoModify.notFy2"/></li>
						<li><spring:message code="memberInfoModify.notFy3"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberInfoSettingForm">
				<div class="MemberInfoHeadlineForm">
					<label class="MemberInfoHeadline"><spring:message code="memberInfoModify.modifyInfoheader"/></label>
				</div>
				<div class="InnerBox">
					<div id="MemberInfo-Box">
							<form:form method="post" name="frm" id="frm" action="modyfyMemberInfo_ok.do" commandName="com.sist.dao.MemberVO">
							
							<fieldset>
								<div class="InfoModify">
									<dl class="mim">
										<!-- View NAME -->
										<dt>
											<label for="USER_NAME"><spring:message code="memberInfoModify.name"/></label>
										</dt>
										<dd>
											<input type="text" name="name" id="name" class="" maxlength="36" value="${vo.name}">
										</dd>
										
										<!-- View GENDER -->
										<dt>
											<label for="USER_GENDER"><spring:message code="memberInfoModify.gender"/></label>
										</dt>
										<dd>
											<c:if test="${vo.gender == 1 }">
												<spring:message code="memberInfoModify.genderMan"/>
											</c:if>
											<c:if test="${vo.gender == 2 }">
												<spring:message code="memberInfoModify.genderWoman"/>
											</c:if>
											<br/>
											<spring:message code="form.gender"/>
												<input type="radio" name="gender" value="1" checked="checked"><spring:message code="form.man"/>
												<input type="radio" name="gender" value="2"><spring:message code="form.woman"/>
										</dd>
										
										<!-- Modify PASSWORD -->
										<dt>
											<label for="USER_PASSWORD"><spring:message code="memberInfoModify.Password"/></label>
										</dt>
										<dd>
											<a id="USER_PASSWORD" class="" href="modyfyMemberPwd.do" target=""><spring:message code="memberInfoModify.btPassword"/></a>
										</dd>
										
										<!-- Modify ADRESS -->
										<dt>
											<label for="USER_ADDRESS"><spring:message code="memberInfoModify.Address"/></label>
										</dt>
										<dd>
											<spring:message code="memberInfoModify.CurAddress"/>
											${vo.zipcode}&nbsp;${vo.addr}
											
											<br/>
											<input type="text" name="zipcode" id="zipcode" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
											<input type="button" class="" onclick="sample6_execDaumPostcode()" value="<spring:message code="memberInfoModify.btZipcode"/>"><br/>
											&nbsp;
											<spring:message code="memberInfoModify.NewAddress"/>
											<input type="text" name="addr" id="addr" placeholder="<spring:message code="form.addr"/>">
											<input type="text" id="addr2" placeholder="<spring:message code="form.addr2"/>">
										</dd>
										
										<!-- Modify Email -->
										<dt>
											<label for="USER_EMAIL"><spring:message code="memberInfoModify.email"/></label>
										</dt>
										<dd>
											<input type="text" name="email" id="email" class="" maxlength="36" value="${vo.email}">
										</dd>
										
										<!-- Modify Phone -->
										<dt>
											<label for="USER_PHONE"><spring:message code="memberInfoModify.phone"/></label>
										</dt>
										<dd>
											<input type="text" name="phone" id="USER_PHONE" class="" maxlength="36" value="${vo.phone}">
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<input type="button" value="<spring:message code="memberInfoModify.btOk"/>" onclick="send()">
									<input type="button" value="<spring:message code="memberInfoModify.btCancel"/>" onclick="javascript:location.href='main.do';">
								</div>
								
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
</body>
</html>
