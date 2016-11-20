<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/sb/sbList.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	sum();
});

//수량 내림
function down(data){
	var amount = document.getElementById(data).getAttribute('value');
	if(amount > 1){
		document.getElementById(data).setAttribute('value', --amount);
		sum();
	}
};
//수량 올림
function up(data,amount){
	var am = document.getElementById(data).getAttribute('value');
	if(amount > am){
		document.getElementById(data).setAttribute('value', ++am);
		sum();
	}
	
};
//수량에 따른 총 금액, 배송료 실 결제금액을 계산
function sum(){
	var count = document.getElementsByName('price').length;
	var sum = 0;
	
	for(var i = 0; i < count ; i++){
		var price = document.getElementsByName('price')[i].getAttribute('value');
		var amount = document.getElementsByName('amount')[i].getAttribute('value');
		sum += (price*amount);
	}
	var fee = 0;
	if(sum < 25000){
		$('#shipFee').html("2,500 원");
		fee = 2500;
	}else{
		$('#shipFee').html("0 원");
		fee = 0;
	}

	
	$('#basketFee').html(comma(sum)+' 원');
	$('#totalFee').html(comma(sum+fee)+' 원');
	
}
//액수에 ,를 추가
function comma(num){
    var len, point, str;  
       
    num = num + "";  
    point = num.length % 3 ;
    len = num.length;  
   
    str = num.substring(0, point);  
    while (point < len) {  
        if (str != "") str += ",";  
        str += num.substring(point, point + 3);  
        point += 3;  
    }  
     
    return str;
 
}

function send(){
	document.frm.submit();
};
</script>
</head>
<body>
	<div id="sb_content" class="cont_basket">
	
		<c:if test="${sbList != null }">
		<fieldset>
			<form action="purchase.do" method="post" name="frm">
				<div class="info_basket">
					<p class="desc_total">
						<em class="emph_total">${sbList.size() }개</em>
						상품
					</p>
					
					<ul class="list_basket">
				<c:if test="${sbList != null }">
					<c:forEach items="${bookList }" var="item">
						<li class="check_on">
							<a href="bookDetail.do?book_code=${item.book_code }" class="link_thumb">
								<img src="${item.img}">
							</a>
							
							<div class="desc_basket">
								<strong class="tit_product"><a href="bookDetail.do?book_code=${item.book_code }">
								${item.book_name }
								</a></strong>
								
								<ul class="list_append">
								<li>
									<em class="tit_append">금액 : </em>
									<span class="product_price"><fmt:formatNumber value="${item.price }" pattern="###,###"/>원</span>
								</li>
							</ul>
							</div>
							<div class="box_quantity">
								<input type="text" name="amount" value="1" id="am_${item.book_code }" class="inp_quantity">
								<button type="button" class="btn_g btn_minus" onclick="down('am_${item.book_code }');">
									<img alt="" src="book_img\down.png">
								</button>
								<button type="button" class="btn_g btn_plus" onclick="up('am_${item.book_code }',${item.amount });">
									<img alt="" src="book_img\up.png">
								</button>
							</div>
							
							
							
						
						<input type="hidden" name="book_code" value="${item.book_code }">
						<input type="hidden" name="price" value="${item.price }">
						
					</c:forEach>
				</c:if>
				</ul>
				<!-- <input type="submit" value="전송"> -->
				</div>
				<div class="info_price">
					<dl class="list_price">
						<dt>장바구니 합계 : </dt>
						<dd>
							<span id="basketFee"> </span>
						</dd>
						<dt>배송비</dt>
						<dd>
							<span id="shipFee"></span>
						</dd>
					
					</dl>
					<dl class="list_price price_total">
						<dt>총 결제금액</dt>
						<dd>
							<strong>
								<span id="totalFee"></span>
							</strong>
						</dd>
					</dl>
				</div>
				
				<div class="order_btn">
					<button class="btn_order btn_payment" onclick="send();">
						<span class="txt_g">주문하기</span>
					</button>
				</div>
				
				
				
				
				
			</form>
		</fieldset>
		</c:if>
	</div>
	
	<div id="cEtc"></div>
</body>
</html>