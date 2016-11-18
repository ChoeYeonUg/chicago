<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function sendBtn() {
		var f = document.form;
		f.submit();
	};
</script>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				ISBN : ${vo.book_code }
				<hr/>
				<form action="book_mngUpdateOk.do" id="form" name="form" method="post">
				<input type="hidden" value="${vo.book_code }" name="book_code"/>
					<table>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">제목</td>
							<td colspan="3" style="font-size:11px; color:#505050;"><input type="text" size="50" value="${vo.book_name }"  name="book_name" id="book_name"  style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">카테고리</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<div style="line-height: 11px; vertical-align: bottom;">
								<input type="radio" value="1" name="book_book_category" id="book_book_category" checked="checked"/><spring:message code="book.cate1"/>
								&nbsp;<input type="radio" value="2" name="book_book_category" id="book_book_category"/><spring:message code="book.cate2"/>
								&nbsp;<input type="radio" value="3" name="book_book_category" id="book_book_category"/><spring:message code="book.cate3"/>
								&nbsp;<input type="radio" value="4" name="book_book_category" id="book_book_category"/><spring:message code="book.cate4"/>
								</div>							
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">저자</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.writer }" name="writer" id="writer" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">출판사</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.publisher }" name="publisher" id="publisher" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">출판일</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="<form:formatDate value="${vo.publication }" pattern="yyyy/MM/dd"/>" name="publication" id="publication" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">수량</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.amount }" name="amount" id="amount" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">절판상태</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.out_of_print }" name="out_of_print" id="out_of_print" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">페이지</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.pages }" name="pages" id="pages" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">가격</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.price }" name="price" id="price" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">Img</td>
							<td colspan="3" style="font-size:11px; color:#505050;"><input type="text" size="20" value="${vo.img }" name="img" id="img"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">책소개</td>
							<td colspan="3"><textarea cols="160" rows="3" name="book_content" id="book_content" style="font-size:11px; color:#505050;">${vo.book_content }</textarea></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="right">
								<input type="button" value="수정" onclick="sendBtn();"/>
								<input type="button" value="취소" onclick="javascript:history.back();"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>