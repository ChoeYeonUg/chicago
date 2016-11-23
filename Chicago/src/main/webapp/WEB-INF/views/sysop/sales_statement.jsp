<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function openPop(data){
	
	alert(data);
	
	if(confirm("배송상태를 변경하시겠습니까?")){ 
		location.href = "deleteMember.do?id="+data;
	} 
	return false;
};
</script>
</head>
<body>
<table class="commonTable" style="	width: inherit;">
	<tr>
		<th width="100">구매번호</th>
		<th width="100">금액</th>
		<th width="100">결제수단</th>
		<th width="200">주문일</th>
		<th width="60">배송</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.order_id }</td>
			<td>${vo.total_price }</td>
			<td>${vo.payment }</td>
			<td><fmt:formatDate value="${vo.order_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>
				<c:choose>
					<c:when test="${vo.delivery==1 }">
						<a href="delivery_change.do?order_id=${vo.order_id }">물품준비중</a>
					</c:when>
					<c:when test="${vo.delivery == 2 }">
						배송중
					</c:when>
					<c:otherwise>배송완료</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>	
</table>
<table>
	<tr>
		<td>
			<a href="sales_management.do?fs=${fs }&ss=${ss }&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a>&nbsp;
			<c:forEach begin="${formpage }" end="${topage }" step="1" var="i">
				<a href="sales_management.do?fs=${fs }&ss=${ss }&page=${i }">[${i }]</a>
			</c:forEach>
			&nbsp;<a href="sales_management.do?fs=${fs }&ss=${ss }&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a>		
		</td>
	</tr>
	
	<tr>
		<td>
			<form action="sales_management.do" method="post">
				<select name="fs">
					<option value="id">id</option>
					<option value="subject">제목</option>
				</select>
				<input type="search" id="ss" name="ss">
				<input type="submit" value="검색">
			</form>
		</td>
	</tr>
</table>
</body>
</html>