<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#findBtn2').click(function(){
			
			//ss : �Է�â print ff: form�±�  fs : ����Ʈ�ɼ��±�
			var ss=$('#ss').val();
			/* $('#print').html(""); */
			
			if(ss==""){
				/* $('#print').html("<font color=red>�˻��� �Է�</font>") */
				$('#ss').focus();
				return;
			}
			$('#ff').submit();
			
		});
	});
</script>
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
						<td width="70%"><h2 align="left">1:1�Խ���</h2></td>
						<td width="30%" align="right"><a href="noticeboard.do"
							style="color: #b3b3b3">��������</a> l<a href="faqboard.do"
							style="color: #b3b3b3"> Faq</a> l 1:1�Խ���</td>
					</tr>
				</table>

				<div>
					<h5>1:1�Խ��� �Դϴ�.</h5>
				</div>

				<center>
					<table width="900">
						<tr id="title">
							<th width="10%">��ȣ</th>
							<th width="50%" align="center">����</th>
							<th width="15%">ID</th>
							<th width="15%">��¥</th>
							<th width="10%">hit</th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td width="10%">${vo.board_no}</td>
								<td width="45%">
									<c:if test="${vo.group_tab>0 }">
										<c:forEach var="i" begin="1" end="${vo.group_tab}">&nbsp;&nbsp;	</c:forEach>
										<!-- ���ö����̹��� -->
										<img src="./board_img/reply.png" style="width: 10px; height:auto;" >
									</c:if> 
									
										<!-- ������ ���� �ƴϸ� �����۵�--> 
										<c:if test="${msg!=vo.subject}">
											<c:if test="${vo.secret==1}">
												<a href="secret_content.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
											</c:if>
											<c:if test="${vo.secret==2 }">
												<img src="./board_img/lock.png" style="width: 10px; height:auto;" >
												<a href="secretboard_pwd_check.do?board_no=${vo.board_no }&page=${curpage}">${vo.subject }</a>
											</c:if>
											
										<!-- new �̹��� ǥ�� -->
											<c:if test="${today eq vo.dbday}">
												<sup>
													<img src="./board_img/new.png" style="width: 10px; height:auto;" >
													<img src="./board_img/new1.png" style="width: 10px; height:auto;" >
												</sup>											
											</c:if> 
										</c:if> 
										<!-- ������ ���̸� ���� �� ���� ���� --> 
										<c:if test="${msg==vo.subject}">
											<font color="#BDBDBD">${vo.subject }</font>
										</c:if>				
								</td>
								<td width="15%" class="tdcenter">${vo.id }</td>
								<td width="20%" class="tdcenter">${vo.dbday } </td>
								<td width="10%" class="tdcenter">${vo.hit }</td>
							</tr>
						</c:forEach>


					</table>
					<!-- ������ǥ�� -->
	<table border="0" width="600">
		<tr>
		<td align="right"> 
		
		
		<!-- [1][2][3][4][5] -->
		<!-- fp           tp -->
								
		<%-- <c:if test="${curpage>block}">
			<a href="noticeboard.do?page=1">
				���</a> &nbsp;
				<a href="noticeboard.do?page=${fromPage-1}">
				������</a> &nbsp;
		</c:if>    --%>
		
		<%-- <c:if test="${curpage<=block}"> --%>
			<a href="secretboard.do?fs=${fs }&ss=${ss }&page=1">���</a>
				<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage>1?curpage-1:curpage}">
				������</a> &nbsp;
		<%-- </c:if>    --%>
		
		<c:forEach var="i" begin="${fromPage }" end="${toPage }">
		[<c:if test="${ curpage ==i}">
		
		<span style="color:red">${i }</span>
		
		</c:if>		
		<c:if test="${ curpage !=i}">
		<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a>
					
		</c:if>		
		]
		</c:forEach>
		
		<c:if test="${toPage<totalpage }">
			<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${toPage+1 }">�ؽ�Ʈ</a>
			<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${totalpage }">��</a>
		</c:if>
		
		<c:if test="${toPage>=totalpage }">
			<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${curpage<totalpage?curpage+1:curpage }">�ؽ�Ʈ</a>&nbsp;
			<a href="secretboard.do?fs=${fs }&ss=${ss }&page=${totalpage }">��</a>
		</c:if>
		&nbsp;&nbsp;
		${curpage } page / ${totalpage  } pages
		
		</td>
		
		</tr>
		</table>
		<!-- ������ǥ�� �� -->
					<!-- �۾��� -->
					<table width="700">
						<tr>
							<!-- �����ڸ����̰� ���� -->
							<c:if test="${id!=null }">
							<td align="right"><a href="secretboard_insert.do">�۾���</a></td>
							</c:if>
						</tr>
					</table>
					<!-- �۾��� �� -->
					<!-- �˻� -->
					<table>
						<tr>
							<td>
								<form method="post" action="secretboard.do" id="ff">
									Search: 
									<select name="fs">
											<c:if test="${fs eq 'id' }" >
										<option value="id" selected="selected">ID</option>
											</c:if>
											<c:if test="${fs ne 'id' }">
												<option value="id">ID</option>
											</c:if>
											<c:if test="${fs eq 'subject' }">
										<option value="subject" selected="selected">����</option>
											</c:if>
											<c:if test="${fs ne 'subject' }">
										<option value="subject">����</option>
											</c:if>
											<c:if test="${fs eq 'content' }">
										<option value="content" selected="selected">����</option>
											</c:if>
										<c:if test="${fs ne 'content' }">
											<option value="content">����</option>
										</c:if>
									</select>
									
									<c:if test="${ss eq null }">
										<input type="text" size="10" name="ss" id="ss">
									</c:if>
									<c:if test="${ss ne null }">
										<input type="text" size="10" name="ss" id="ss" value="${ss }">
									</c:if>
									<input type="button" value="ã��" id="findBtn2"> 
									<input type="hidden" name="page" value="${curpage }">
									<!-- 	<span id="print"></span> -->
								</form>
							</td>

						</tr>

					</table>
					<!-- �˻� �� -->
				</center>

				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>