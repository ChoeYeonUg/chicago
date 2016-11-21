<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css"/>
<script type="text/javascript">
	$(function(){
		$('#sendBtn').click(function(){
			var book_code = $('#book_code').val();
			if(book_code.trim()=="") {
				$('#book_code').focus();
				alert('ISBN(�����ڵ�)�� �Է��ϼ���.');
				return;
			}
			var book_name = $('#book_name').val();
			if(book_name.trim()=="") {
				$('#book_name').focus();
				alert('������ �Է��ϼ���.');
				return;
			}
			
			var cate = $('#book_category').length;
			if(!cate && $('#book_category').checked) {
				return $('#book_category').length;
			}
			for(var i = 0 , v = $('#book_category').length; i < v ; i++ ) {
				if($('#book_category')[i].checked) {
					return $('#book_category')[i].value;
				}
			}
			
			var writer = $('#writer').val();
			if(writer.trim()=="") {
				$('#writer').focus();
				alert('�۰��� �Է��ϼ���.');
				return;
			}
			var publisher = $('#publisher').val();
			if(publisher.trim()=="") {
				$('#publisher').focus();
				alert('���ǻ縦 �Է��ϼ���.');
				return;
			}
			var publication = $('#publication').val();
			if(publication.trim()=="") {
				$('#publication').focus();
				alert('�������� �Է��ϼ���.');
				return;
			}
			var amount = $('#amount').val();
			if(amount.trim()=="") {
				$('#amount').focus();
				alert('������ �Է��ϼ���.');
				return;
			}
			var out_of_print = $('#out_of_print').val();
			if(out_of_print.trim()=="") {
				$('#out_of_print').focus();
				alert('���ǿ��θ� �Է��ϼ���.');
				return;
			}
			var pages = $('#pages').val();
			if(pages.trim()=="") {
				$('#pages').focus();
				alert('���������� �Է��ϼ���.');
				return;
			}
			var price = $('#price').val();
			if(price.trim()=="") {
				$('#price').focus();
				alert('������ �Է��ϼ���.');
				return;
			}
			var book_content = $('#book_content').val();
			if(book_content.trim()=="") {
				$('#book_content').focus();
				alert('å �Ұ������� �Է��ϼ���.');
				return;
			}
			$('#form').submit();
		})
	});
</script>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- <form action="book_mngInsertOk.do" method="post" id="form" name="form"> -->
				<form:form commandName="vo" action="book_mngInsertOk.do" method="post" id="form" name="form">
					<table>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">ISBN</td>
							<td colspan="3"><input type="text" size="20" name="book_code" id="book_code" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">����</td>
							<td colspan="3"><input type="text" size="50" name="book_name" id="book_name" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">ī�װ�</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<div style="line-height: 11px; vertical-align: bottom;">
								<input type="radio" value="1" name="book_category" id="book_category1" checked="checked"/><spring:message code="book.cate1"/>
								&nbsp;<input type="radio" value="2" name="book_category" id="book_category2"/><spring:message code="book.cate2"/>
								&nbsp;<input type="radio" value="3" name="book_category" id="book_category3"/><spring:message code="book.cate3"/>
								&nbsp;<input type="radio" value="4" name="book_category" id="book_category4"/><spring:message code="book.cate4"/>
								<!-- &nbsp;&nbsp;&nbsp;<input type="button" value="����" onclick="sch_value_cate"/> -->
								</div>							
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">����</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="writer" id="writer" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">���ǻ�</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="publisher" id="publisher" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">������</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><!-- <input type="text" size="20" name="publication" id="publication" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/> --></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">����</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="amount" id="amount" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">���ǻ���</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="out_of_print" id="out_of_print" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">������</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="pages" id="pages" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">����</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" name="price" id="price" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">å�Ұ�</td>
							<td colspan="3"><textarea cols="130" rows="3" name="book_content" id="book_content"></textarea></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="right">
								<input type="button" value="���" id="sendBtn"/>
								<input type="button" value="���" onclick="javascript:history.back()"/>
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