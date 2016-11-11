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
			var ss=$('#ss').val();
			
			if(ss==""){
				
				$('#ss').focus();
				return;
			}
			$('#ff').submit();			
		});
	});
</script>
</head>
<body>
<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- �� �Խ��� ��ũ -->
				<table width="700">
					<tr>
						<td width="50%"><h2 align="left">����Խ���</h2></td>
						<td width="50%" align="right"><a href="noticeboard.do" style="color: #b3b3b3">��������</a> l
						<a href="faqboard.do" style="color: #b3b3b3"> Faq</a><a href="secretboard.do" style="color: #b3b3b3"> l 1:1�Խ��� </a>l  ����Խ���
						</td>
					</tr>
				</table>

				<div>
					<h5>����Խ��� �Դϴ�.</h5>
				</div>
				<!-- ����Ʈ ���� -->
				<center>
					<table width="900">					
						<c:forEach var="vo" items="${list }">
							<tr>
								<td rowspan="2" width="150px"><a href="bookDetail.do?book_code=${vo.book_code }"><img alt="bookImage" src="${vo.img }" style="vertical-align: bottom;"></a></td>
								<td width="500px"><a href="bookDetail.do?book_code=${vo.book_code }"><b>[${vo.writer}]&nbsp;${vo.book_name }</b></a></td>
																	
								<td width="50px" class="tdcenter">${vo.id }</td>
								<td width="150px" class="tdcenter">${vo.dbday } </td>
								<td width="50px" class="tdcenter">
									<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
										<p style="WIDTH: ${vo.score}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
										</p>
									</div>
								
								</td>
							</tr>	
							<tr>
								
								<td colspan="4" width="750px" align="left" valign="top" style="font-size:14px; color:#505050;">${vo.content}</td>
							</tr>					
						</c:forEach>						
					</table>
					
					<!-- ����Ʈ ��- ->
					
					<!-- ������ǥ�� -->
					<table border="0" width="600">
						<tr>
							<td align="right"> 	
								<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=1">���</a>
								<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage>1?curpage-1:curpage}">������</a> &nbsp;
			
								<c:forEach var="i" begin="${fromPage }" end="${toPage }">
									[<c:if test="${ curpage ==i}"><span style="color:red">${i }</span></c:if>		
									<c:if test="${ curpage !=i}"><a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a></c:if>]
								</c:forEach>
			
								<c:if test="${toPage<totalpage }">
									<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${toPage+1 }">�ؽ�Ʈ</a>
									<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${totalpage }">��</a>
								</c:if>		
								<c:if test="${toPage>=totalpage }">
									<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${curpage<totalpage?curpage+1:curpage }">�ؽ�Ʈ</a>&nbsp;
									<a href="reviewboard.do?fs=${fs }&ss=${ss }&page=${totalpage }">��</a>
								</c:if>
								&nbsp;&nbsp;${curpage } page / ${totalpage  } pages
							</td>
		
						</tr>
					</table>
					<!-- ������ǥ�� �� -->
					<%-- <!-- �۾��� -->
					<table width="700">
						<tr>
							<!-- �����ڸ����̰� ���� -->
							<c:if test="${id!=null }">
							<td align="right"><a href="secretboard_insert.do">�۾���</a></td>
							</c:if>
						</tr>
					</table>
					<!-- �۾��� �� --> --%>
					<!-- �˻� ���� -->
					<table>
						<tr>
							<td>
								<form method="post" action="reviewboard.do" id="ff">
									Search: 
									<select name="fs">
											
											<c:if test="${fs eq 'id' }" >
												<option value="id" selected="selected">ID</option>
											</c:if>
											<c:if test="${fs ne 'id' }">
												<option value="id">ID</option>
											</c:if>
											<c:if test="${fs eq 'book_name' }">
												<option value="book_name" selected="selected">å����</option>
											</c:if>
											<c:if test="${fs ne 'book_name' }">
												<option value="book_name">å����</option>
											</c:if>
											<c:if test="${fs eq 'content' }">
												<option value="content" selected="selected">����</option>
											</c:if>
											<c:if test="${fs ne 'content' }">
												<option value="content">����</option>
											</c:if>
											<c:if test="${fs eq 'writer' }">
												<option value="writer" selected="selected">�۰�</option>
											</c:if>
											<c:if test="${fs ne 'writer' }">
												<option value="writer">�۰�</option>
											</c:if>
											<c:if test="${fs eq 'book_code' }">
												<option value="book_code" selected="selected" >���ڵ�</option>
											</c:if>
											<c:if test="${fs ne 'book_code' }">
												<option value="book_code" style="display:none;">���ڵ�</option>
											</c:if>											
											
									<%-- 		<c:if test="${fs eq 'score' }">
												<option value="score" selected="selected">����</option>
											</c:if>
											<c:if test="${fs ne 'score' }">
												<option value="score">����</option>
											</c:if> --%>
										
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