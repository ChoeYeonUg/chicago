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
		var enable = document.getElementsByName('amount')[i].getAttribute('disabled');
			if(enable == null){
			var price = document.getElementsByName('price')[i].getAttribute('value');
			var amount = document.getElementsByName('amount')[i].getAttribute('value');
			sum += (price*amount);
		}
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
	var a = $('#basketFee').html();
	if(a != "0 원"){
		document.frm.submit();
	}else{
		alert("선택된 상품이 없습니다.");
	}
};

function deleteBook(data){
	location.replace("wlbookdelete.do?book_code="+data);	
};
//disabled="disabled"
function cancel(checkbox,book,amount){
	if ( checkbox.checked == true ){
		var target1 = document.getElementById(book);
		if(target1.hasAttribute("disabled")){
			target1.removeAttribute("disabled");
		}
		var target2 = document.getElementById(amount);
		if(target2.hasAttribute("disabled")){
			target2.removeAttribute("disabled");
		}
	}else{
		document.getElementById(book).setAttribute("disabled","disabled");
		document.getElementById(amount).setAttribute("disabled","disabled");
	}
	sum();

};
</script>
<style type="text/css">
	th, td {
		align: center;
		vertical-align: middle;
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
						<h3 class="panel-title">회원찜내역</h3>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							◎&nbsp;회원님의 찜내역을 확인할 수 있습니다.<br /> 
							◎&nbsp;찜내역에서 찜하신 서적을 재고량에 따라 추후에 구매하실 수 있습니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<h4>${id }님의 찜 내역</h4>
	<!-- 본인확인 안내 msg 끝 -->
	<h6>${wishList.size() }개 상품이 찜목록에 있습니다.</h6>
	<hr/>
	</div>
	<c:if test="${wishList != null && wishList.size() != 0}">
		<form action="purchase.do" method="post" name="frm">
			<table>
				<c:if test="${wishList != null }">
					<c:forEach items="${wishList}" var="item">
						<tr>
							<td width="5%"><input type="checkbox" class="inp_g" checked="checked" onclick="cancel(this,'am_${item.book_code}','${item.book_code}')"></td>
							<td width="15%"><a href="bookDetail.do?book_code=${item.book_code}" class="link_thumb"> <img src="${item.img}"> </a></td>	
							<td width="45%"><a href="bookDetail.do?book_code=${item.book_code}"> ${item.book_name } </a></td>
							<td width="10%"><fmt:formatNumber value="${item.price}" type="number"/>원</td>
							<td width="20%" align="center">
								<button type="button" class="btn total" onclick="down('am_${item.book_code}');"><img alt="down" src="book_img\down.png" style="width:6px; height:10px; vertical-align: middle;"> </button>
								<input type="text" name="amount" value="1" size="2" id="am_${item.book_code}" class="inp_quantity">
								<button type="button" class="btn total" onclick="up('am_${item.book_code}',${item.amount});"> <img alt="up" src="book_img\up.png" style="width:6px; height:10px; vertical-align: middle;"></button>
							</td>
							<td width="5%">
								<button type="button" class="btn total" onclick="deleteBook('${item.book_code}')">X</button>
								<input type="hidden" name="book_code" id="${item.book_code}" value="${item.book_code}">
								<input type="hidden" name="price" value="${item.price}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<br/><br/>
			<table>
				<tr>
					<td align="right">선택 물품 합계 :&nbsp;<span id="basketFee"></span>&nbsp;&nbsp;&nbsp;| 배송비 : &nbsp;<span id="shipFee"></span>&nbsp;&nbsp;&nbsp;| 총 결제금액 : &nbsp;<strong><span id="totalFee"></span></strong></td>
				</tr>
				<tr>
					<td align="right">
						<button class="btn total" onclick="send();">주문하기</button>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
</body>
</html>