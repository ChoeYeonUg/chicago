<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="board_css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="board_css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="board_css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/custom.css" rel="stylesheet">

<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Raleway:100,300,400"
	type="text/css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	type="text/css" rel="stylesheet">
</head>
<body>
<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">

<table width="700">
					<tr>
						<td width="70%"><h2 align="left">
								1:1�Խ���
							</h2></td>
						<td width="30%" align="right"><a href="noticeboard.do" style="color: #b3b3b3">��������</a> l<a href="faqboard.do" style="color: #b3b3b3"> Faq</a> l 1:1�Խ���</td>
					</tr>
				</table>

				<div>
					<h5>1:1�Խ��� �Դϴ�.</h5>
				</div>

<center>
	<table width="600">
			<tr id="title">
				<th width="10%">��ȣ</th>
				<th width="50%" align="center">����</th>
				<th width="15%">�۾���</th>
				<th width="15%">��¥</th>
				<th width="10%">��ȸ��</th>
			</tr>
	</table>
		<!-- �����ڸ����̰� ���� -->
	<table width="700">
					<tr>
					
						<td align="right"><a href="#">�۾��� &nbsp;&nbsp;<a href="#">����</a></td>
					</tr>
				</table>
				
				<table>
			<tr>
				<td>
					<form method="post" action="find.do" id="ff">
						Search:
						<select name="fs">
							<option value="name">�̸�</option>
							<c:if test="${fs eq 'subject' }">
								<option value="subject" selected="selected">����</option>
							</c:if>
							<c:if test="${fs ne 'subject' }">
								<option value="subject">����</option>
							</c:if>
							<c:if test="${fs eq 'content' }">			
							<option value="content" selected="selected">����</option></c:if>
							<c:if test="${fs ne 'content' }">
							<option value="content" >����</option>
							</c:if>
						</select>
						<c:if test="${ss eq null }">
						<input type="text" size="10" name="ss" id="ss">
						</c:if>
						<c:if test="${ss ne null }">
						<input type="text" size="10" name="ss" id="ss" value="${ss }"> 
						</c:if>
						<input type="button" value="ã��" id="findBtn1">
						<input type="hidden" name="page" value="${curpage }">
							<!-- <span id="print"></span> -->
					</form>
				</td>
			
			</tr>
			
		</table>
		
</center>

	<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>