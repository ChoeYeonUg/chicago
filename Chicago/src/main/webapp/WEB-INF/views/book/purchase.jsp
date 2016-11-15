<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/purchase.css" rel="stylesheet" />

<script type="text/javascript">
	
	function send(){
		
		var name = $("#name").val();
		if(name.trim()==""){
			$("#name").focus();
			return;
		}
		
		var phone = $("#phone").val();
		if(phone.trim()==""){
			$("#phone").focus();
			return;
		}	
		
		
		var zipcode = $("#zipcode").val();
		if(zipcode == 0 || zipcode == null){
			$("#zipcode").focus();
			return;
		}
		
		var addr = $("#addr").val();
		if(addr.trim()==""){
			$("#addr").focus();
			return;
		}
		
		$("#frm").submit();
	}

</script>
</head>
<body>
	<div id="main">
		<div id="purchase">
			<h2 class="tit_order">주문하기</h2>
			<form action="purchase_ok.do" method="post" id="frm">				
				<c:forEach items="${bookList }" var="bl">
					<input type="hidden" name="bookList" value="${bl }">
				</c:forEach>
				<c:forEach items="${bookCount }" var="bc">
					<input type="hidden" name="bookCount" value="${bc }">
				</c:forEach>
				
				<input type="hidden" name="payment" value="card">
				<input type="hidden" name="total_price" value="${totalPrice }">
				<fieldset>
					<legend class="screen_out">주문하기 양식</legend>
					<div class="info_delivery">
						<h3>주문배송 정보</h3>
						<dl class="list_delivery">
							<dt>이름</dt>
							<dd>
								<div class="box_input">
									<input type="text" class="tf_g" id="name" name="name" value="${vo.name }">
								</div>
							</dd>
							<dt>휴대폰 번호</dt>
							<dd>
								<div class="box_input">
									<input type="text" class="tf_g" id="phone" name="phone" value="${vo.phone }">
								</div>
							</dd>
							<dt>우편번호</dt>
							<dd>
								<div class="box_input box_postal">
									<input type="text" class="tf_g" id="zipcode" name="zipcode" value="${vo.zipcode == 0 ? '' : vo.zipcode }">
								</div>
								<button type="button" class="btn_postal" onclick="execDaumPostcode()">우편번호</button>
							</dd>
							
							<dt>주소</dt>
							<dd>
								<div class="box_input">
									<input type="text" class="tf_g" id="addr" name="addr" value="${vo.addr }">
								</div>
							</dd>
							
							<dt>배송메모</dt>
							<dd>
								<div class="box_input box_textarea"><textarea name="memo" class="tf_g" id="osDeliMemo"></textarea></div>
								<p class="note_info"><span class="ico_friends ico_bullet"></span>주소, 상세주소 및 배송메모 작성시 특수문자 &amp; &lt; &gt; ; 는 제외하고<br class="rw_show"> 입력해 주시기 바랍니다.</p>
							</dd>
						</dl>
					</div>
					
					<!-- 구매리스트 -->
					<div class="product_area">
						<div class="info_product">
							<h3>상품 리스트</h3>
							<ul class="list_item">
								<c:forEach items="${list }" var="bVO">
									<li>
										<span class="wrap_thumb">
											<img class="thumb_g" alt="${bVO.book_name }" src="${bVO.img }">
										</span>
										<div class="desc_product">
											<strong class="tit_product">${bVO.book_name }</strong>
											<ul class="list_append">
												<li>
													<em class="tit_append">금액 :</em>
													<fmt:formatNumber value="${bVO.price }" pattern="#,###"/> 원
												</li>
												<li>
													<em class="tit_append">수량 :</em>
													${bVO.amount } 개
												</li>
											</ul>
										</div>
									</li>
								</c:forEach>
							</ul>
							<!-- 결제금액 정보 -->
		
							<dl class="list_price">
								<dt>장바구니 합계 :</dt>
								<dd><fmt:formatNumber value="${price}" pattern="#,###"/> 원</dd>
								<dt>배송비 :</dt>
								<dd><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/> 원</dd>
								<dt>적립 포인트 :</dt>
								<dd><fmt:formatNumber value="${point}" pattern="#,###"/> 포인트</dd>
								<dt class="txt_total">총 결제금액 :</dt>
								<dd class="txt_total"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/> 원</dd>
							</dl>
							
							<!-- 결제단 -->
							<div class="info_pay">
								<h3 class="tit_sub">결제수단</h3>
							</div>
								
						</div>
						
						

					</div>
					
				
				
				</fieldset>
			</form>
		</div>
		
		<div class="order_btn">
			<button type="button" class="btn_order btn_payment"  id="submit" onclick="send();">
				<span class="txt_g">결제하기</span>
			</button>
		</div>
	
	</div>
	
	<div id="cEtc">
		<!-- <strong class="tit_friends tit_about">
		Chicago
		</strong>	 -->
	
	</div>
	
	
	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js" type="text/javascript"></script>
	<script type="text/javascript">
	function execDaumPostcode() {
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
				$("#zipcode").val(data.zonecode); //5자리 새우편번호 사용

//				$("#oaZoneCode").val(data.zonecode); //5자리 새우편번호 사용
//				$("#oaZipCode").val(data.zonecode); //6자리 우편번호

				$("#addr").val(fullAddr);

				// 커서를 상세주소 필드로 이동한다.
				$("#addr").focus();
			}
		}).open();
	}
	</script>
	
</body>
</html>