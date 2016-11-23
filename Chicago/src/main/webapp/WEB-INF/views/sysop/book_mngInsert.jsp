<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('#book_code').keyup(function(){
			var codeVal = $('#book_code').val();
			var params = "book_code=" + codeVal;
			/* console.log($('form').serialize()); */
			/* console.log(params); */
			if(codeVal.length > 12) {
				$.ajax ({
					url : "code_check.do",
					type : "post",
					data : params, 
					dataType : 'text',
					success : function(data) {
						/* alert(data); */
						if(data == "true") {
							$('#codeResult').html("사용가능한 ISBN 입니다.");
							$('#check').attr('value', 'Y');
						} else {
							$('#codeResult').html("이미 존재하는 ISBN 입니다.");
							$('#check').attr('value','N');
						}
					},
					error : function(error) {
						alert(error.statusText);
					}
				});
				return false;
			} else {
				$('#codeResult').html("");
				$('#check').attr('value','N');
			}
		});
		
		$('#sendBtn').click(function(){
			
			var f = document.form;
			
			var codeVal = $('#book_code').val();
			if(codeVal.trim()=='' || $('#check').val()=="N" || codeVal.length < 13) {
				alert('ISBN(도서코드)를 확인하세요.');
				$('#book_code').focus();
				return;
			}
			
			var book_name = $('#book_name').val();
			if(book_name.trim()=="") {
				alert('제목을 입력하세요.');
				$('#book_name').focus();
				return;
			}
		
			var writer = $('#writer').val();
			if(writer.trim()=="") {
				alert('작가를 입력하세요.');
				$('#writer').focus();
				return;
			}
			var publisher = $('#publisher').val();
			if(publisher.trim()=="") {
				alert('출판사를 입력하세요.');
				$('#publisher').focus();
				return;
			}
			var publication = $('#publication').val();
			if(publication.trim()=="") {
				alert('출판일을 입력하세요.');
				$('#publication').focus();
				return;
			}
			var amount = $('#amount').val();
			if(amount.trim()=="") {
				alert('수량을 입력하세요.');
				$('#amount').focus();
				return;
			}
					
			var pages = $('#pages').val();
			if(pages.trim()=="") {
				alert('페이지수를 입력하세요.');
				$('#pages').focus();
				return;
			}
			var price = $('#price').val();
			if(price.trim()=="") {
				alert('가격을 입력하세요.');
				$('#price').focus();
				return;
			}
			var book_content = $('#book_content').val();
			if(book_content.trim()=="") {
				alert('책 소개내용을 입력하세요.');
				$('#book_content').focus();
				return;
			}
		/* 	alert(1234); */
			f.submit();
		});
	});
</script>
<!-- <style type="text/css">
	input [type="text"],
	textarea {
		border-top: 0px;
		border-right: 0px;
		border-left: 0px;
		border-bottom: #00000 1px solid;
	}
</style> -->
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- <form action="book_mngInsertOk.do" method="post" id="form" name="form"> -->
				<form:form commandName="vo" action="book_mngInsertOk.do" method="post" id="form" name="form" acceptCharset="UTF-8" enctype="multipart/form-data">
					<table>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">ISBN</td>
							<td colspan="3">
								<input type="text" size="20" name="book_code" id="book_code" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
								<span id="codeResult"></span><form:errors path="book_code"/>
								<input type="hidden" id="check" value="Y" disabled="disabled"/>
								<!-- <input type="text" size="20" name="book_code" id="book_code"/> -->
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">제목</td>
							<td colspan="3">
								<input type="text" size="50" name="book_name" id="book_name" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">저자</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="text" size="20" name="writer" id="writer"  style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">카테고리</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="radio" value="1" name="book_category" id="book_category" checked="checked"/><spring:message code="book.cate1"/>
								<input type="radio" value="2" name="book_category" id="book_category"/><spring:message code="book.cate2"/>
								<input type="radio" value="3" name="book_category" id="book_category"/><spring:message code="book.cate3"/>
								<input type="radio" value="4" name="book_category" id="book_category"/><spring:message code="book.cate4"/>
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">출판사</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="text" size="20" name="publisher" id="publisher"  style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">출판일</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="text" size="40" name="publication" id="publication" placeholder="2016/11/23 형식으로 작성하세요."  style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">수량</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="amount" id="amount" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">절판상태</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="radio" value="0" name="out_of_print" id="out_of_print" />&nbsp;절판&nbsp;&nbsp;
								<input type="radio" value="1" name="out_of_print" id="out_of_print" checked="checked"/>&nbsp;출간
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">페이지</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="text" size="20" name="pages" id="pages"  style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">가격</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<input type="text" size="20" name="price" id="price" style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"/>
							</td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">이미지</td>
							<td colspan="3" style="font-size:11px; color:#505050;"><input type="file" size="20" name="upload" id="upload"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">책소개</td>
							<td colspan="3" style="font-size:11px; color:#505050;"><textarea cols="130" rows="3" name="book_content" id="book_content"  style="border-top:0px; border-right:0px; border-left: 0px; border-bottom:#00000 1px solid;"></textarea></td>
						</tr> 
					</table>
					<table>
						<tr>
							<td align="right">
								<input type="button" value="등록" id="sendBtn"/>
								<input type="button" value="취소" onclick="javascript:history.back()"/>
							</td>
						</tr>
					</table>
				<%-- </form> --%>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>