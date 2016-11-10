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
<link href="css/mypagecss/memberinfo.css" rel="stylesheet" />

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

<script type="text/javascript">
function send(){
	var f=document.frm;
		
	if(f.Guest_OrderCode.value==""){
		alert("올바르지 않은 주민번호입니다!");
		f.Guest_OrderCode.focus();
		return;
	}
	
	f.submit();
	
}
</script>

</head>
<body>
	<!-- Guest Orderlist -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					비회원 구매목록
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li>휴대전화로 전송된 주문번호 입력시 구매목록과 배송상태를 확인할 수 있습니다.</li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="MemberSettingForm">
				<div class="InnerBox">
					<div id="GuestOrderlist-Box">
						<%-- <form:form name="frm" id="frm" method="post" action="#"> --%>
							<fieldset>
								<div class="GuestOrderlistCode">
									<dl class="goc">
										<!-- Input Confirm OrderCode -->
										<dt>
											<label for="Guest_OrderCode">주문번호</label>
										</dt>
										<dd>
											<input type="text" name="Guest_OrderCode" id="Guest_OrderCode" class="" maxlength="16">
										</dd>
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<input type="button" value="확인" onclick="send()">
								</div>
								
							</fieldset>
						<%-- </form:form> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
