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
</head>
<body>
	<div id="sb_content" class="cont_basket">
		<fieldset>
			<form action="purchase.do" method="post">
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
								<button type="button" class="btn_g btn_minus">
									<img alt="" src="book_img\down.png">
								</button>
								<button type="button" class="btn_g btn_plus">
									<img alt="" src="book_img\up.png">
								</button>
							</div>
							
							
							
						
						<input type="hidden" name="book_code" value="${item.book_code }">
						
					</c:forEach>
				</c:if>
				</ul>
				<input type="submit" value="전송">
				</div>
				<div class="info_price">
					<dl class="list_price"></dl>
				</div>
				
				
			</form>
		</fieldset>
	</div>
</body>
</html>