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
		
	if(f.zipcode1.value==""){
		alert("우편번호는 꼭 있어야합니다!");
		f.zipcode1.focus();
		return;
	}
	
	if(f.addr1.value=="" || f.addr1E.value==""){
		alert("나머지 주소를 입력하세요!");
		f.addr1.focus();
		return;
	}
	
	var addr1 = $('#addr1').val();
	var addr1E = $('#addr1E').val();
	if(addr1E.trim()!="" && addr1.trim()!=""){
		document.getElementById("addr1").value = addr1+' '+addr1E;
	}
	
	if(addr1 == null || addr1.trim() == ""){
		$('#zipcode1').val(0);
	}
	
	var addr2 = $('#addr2').val();
	var addr2E = $('#addr2E').val();
	if(addr2E.trim()!="" && addr2.trim()!=""){
		document.getElementById("addr2").value = addr2+' '+addr2E;
	}
	
	if(addr2 == null || addr2.trim() == ""){
		$('#zipcode2').val(0);
	}
	
	var addr3 = $('#addr2').val();
	var addr3E = $('#addr2E').val();
	if(addr3E.trim()!="" && addr3.trim()!=""){
		document.getElementById("addr3").value = addr3+' '+addr3E;
	}
	
	if(addr3 == null || addr3.trim() == ""){
		$('#zipcode3').val(0);
	}
	
	alert("수정되었습니다!");
	
	f.submit();
	
}

function sample6_execDaumPostcode1() {
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
            document.getElementById('zipcode1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr1E').focus();
        }
    }).open();
}

function sample6_execDaumPostcode2() {
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
            document.getElementById('zipcode2').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr2').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2E').focus();
        }
    }).open();
}

function sample6_execDaumPostcode3() {
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
            document.getElementById('zipcode3').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr3').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr3E').focus();
        }
    }).open();
}

</script>

</head>
<body>
<div class="col-md-9">
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							주소수정
						</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;배송지 관리 페이지입니다. <br/>
							◎&nbsp;자주 사용하시는 주소를 "기본 배송주소"로 설정하세요.<br/>
							◎&nbsp;2군데 주소를 보조 배송주소로 사용할 수 있습니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본인확인 안내 msg 끝 -->
		<form:form method="post" name="frm" id="frm" action="modyfyMemberAddrs_ok.do" commandName="com.sist.dao.AddressVO">
			<h4>기본 배송주소</h4>
			<h6>${avo.zipcode1} &nbsp;&nbsp; ${avo.addr1}</h6>
			<br>
			<table>
				<tr>
					<td>기본 배송주소 수정</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="zipcode1" id="zipcode1" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
						<input type="button" class="" onclick="sample6_execDaumPostcode1()" value="<spring:message code="memberInfoModify.btZipcode"/>">
						<br/><br/>
						<input type="text" name="addr1" id="addr1" placeholder="<spring:message code="form.addr"/>">
						<input type="text" id="addr1E" placeholder="<spring:message code="form.addr2"/>">
					</td>
				</tr>
			</table>
			<br><br>
			<h4>보조 배송주소 1</h4>
			<h6>${avo.zipcode2} &nbsp;&nbsp; ${avo.addr2}</h6>
			<table>
				<tr>
					<td>보조 배송주소 1 수정</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="zipcode2" id="zipcode2" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
						<input type="button" class="" onclick="sample6_execDaumPostcode2()" value="<spring:message code="memberInfoModify.btZipcode"/>">
						<br/><br/>
						<input type="text" name="addr2" id="addr2" placeholder="<spring:message code="form.addr"/>">
						<input type="text" id="addr2E" placeholder="<spring:message code="form.addr2"/>">
					</td>
				</tr>
			</table><br><br>
			<h4>보조 배송주소 2</h4>
			<h6>${avo.zipcode3} &nbsp;&nbsp; ${avo.addr3}</h6>
			<table>
				<tr>
					<td>보조 배송주소 2 수정</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="zipcode3" id="zipcode3" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
						<input type="button" class="" onclick="sample6_execDaumPostcode3()" value="<spring:message code="memberInfoModify.btZipcode"/>">
						<br/><br/>
						<input type="text" name="addr3" id="addr3" placeholder="<spring:message code="form.addr"/>">
						<input type="text" id="addr3E" placeholder="<spring:message code="form.addr2"/>">
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="right"><input type="button" value="변경하기" onclick="send()"></td>
				</tr>
			</table>
		</form:form>
	</div>

				

<%-- 			

	<!-- Modify Member PASSWORD Member -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<!-- <div class="HeadlineSettingForm">
				<div class="Headline">
					주소수정
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li>배송주소 수정하는거임</li>
						<li>너님은 회원이라서 세개까지 수정 가능</li>
					</ul>
				</div>
			</div> -->
			<div class="MemberSettingForm">
				<div class="ModifyMemberAddressHeadlineForm">
					<label class="ModifyMemberPwdHeadline"><spring:message code="memberPasswordModify.modifyPasswordheader"/></label>
				</div>
				<div class="InnerBox">
					<div id="ModifyMemberAddress-Box">
						<form:form method="post" name="frm" id="frm" action="modyfyMemberAddrs_ok.do" commandName="com.sist.dao.AddressVO">
						<input type="hidden" value="<%=request.getAttribute("id") %>">
						<fieldset>
								<div class="ModifyMemberAddress">
									<dl class="mma">
									
										<!-- Modify ADRESS -->
										<dt>
											<label for="USER_CADDRESS1">주 배송주소</label>
										</dt>
										<dd>
											${avo.zipcode1}
											&nbsp;
											${avo.addr1}
										</dd>
										<dt>
											<label for="USER_ADDRESS1">주 배송주소 수정</label>
										</dt>
										<dd>
											<input type="text" name="zipcode1" id="zipcode1" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
											<input type="button" class="" onclick="sample6_execDaumPostcode1()" value="<spring:message code="memberInfoModify.btZipcode"/>"><br/>
											&nbsp;
											주소입력<br/>
											<input type="text" name="addr1" id="addr1" placeholder="<spring:message code="form.addr"/>">
											<input type="text" id="addr1E" placeholder="<spring:message code="form.addr2"/>">
										</dd>
									
										<dt>
											<label for="USER_CADDRESS2">주 배송주소1</label>
										</dt>
										<dd>
											${avo.zipcode2}
											&nbsp;
											${avo.addr2}
										</dd>
										<dt>
											<label for="USER_ADDRESS2">보조 배송 주소1</label>
										</dt>
										<dd>
											<input type="text" name="zipcode2" id="zipcode2" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
											<input type="button" class="" onclick="sample6_execDaumPostcode2()" value="<spring:message code="memberInfoModify.btZipcode"/>"><br/>
											&nbsp;
											주소입력<br/>
											<input type="text" name="addr2" id="addr2" placeholder="<spring:message code="form.addr"/>">
											<input type="text" id="addr2E" placeholder="<spring:message code="form.addr2"/>">
										</dd>
										
										<dt>
											<label for="USER_CADDRESS3">주 배송주소2</label>
										</dt>
										<dd>
											${avo.zipcode3}
											&nbsp;
											${avo.addr3}
										</dd>
										<dt>
											<label for="USER_ADDRESS3">보조 배송 주소2</label>
										</dt>
										<dd>
											<input type="text" name="zipcode3" id="zipcode3" placeholder="<spring:message code="form.zip"/>" readonly="readonly">
											<input type="button" class="" onclick="sample6_execDaumPostcode3()" value="<spring:message code="memberInfoModify.btZipcode"/>"><br/>
											&nbsp;
											주소입력<br/>
											<input type="text" name="addr3" id="addr3" placeholder="<spring:message code="form.addr"/>">
											<input type="text" id="addr3E" placeholder="<spring:message code="form.addr2"/>">
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<input type="button" value="변경하기" onclick="send()">
									<form:button name="" id="" class="" onclick="javascript:history.back()"><spring:message code="memberInfoModify.btCancel"/></form:button>
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
