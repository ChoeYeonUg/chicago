<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ī��Ͻ�|�ڰ��������輭</title>
<link rel="stylesheet" type="text/css" href="book_css/bookMain.css" />
<link rel="stylesheet" type="text/css" href="book_css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="book_css/header1.css" />
<script type="text/javascript">
	function likepop() {
		var popOption = "width=300, hegiht=300, top=500, left=500";
		window.open('book/likePop.do',"",popOption);
	}
</script>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<!-- ���� ī�װ� ���� -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav" id="sidebar-nav">
						<!-- ī�װ�1 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=1">
								<spring:message code="book.cate1" />
							</a>
						</li>
						<!-- ī�װ�2 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=2">
								<spring:message	code="book.cate2" />
							</a>
						</li>
						<!-- ī�װ�3 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=3">
								<spring:message code="book.cate3" />
							</a>
						</li>
						<!-- ī�װ�4 -->
						<li class="list-group-item list-toggle">
							<a href="categoryList.do?book_category=4">
								<spring:message code="book.cate4" />
							</a>
						</li>	
					</ul>
				</div>
				<!-- ���� ī�װ� �� -->
				<!-- ������� -->
				<div class="col-md-9">
				<table width="100%" class="table_content" border="0">
					<c:forEach items="${cateList }" var="list">
					<tr>
						<td width="15%" height="200">
							<table>
								<!-- å �̹��� -->
								<tr>
									<td align="center"><a href="bookDetail.do"><img alt="image" src="${list.img }"></a></td>
								</tr>
								<!-- �ֹ����� ������ -->
								<tr>
									<td align="center" class="icontd">
										<a href="javascript:likePopup();">
											<img src="book_img\like.png" alt="like.png" title="���ϱ�" class="icon" onclick="likepop()">&nbsp;
										</a> 
										<img src="book_img\shopping.png" alt="shopping.png" title="��ٱ���" class="icon">&nbsp; 
										<img src="book_img\purchase.png" alt="purchase.png" title="�ٷα���" class="icon">
									</td>
								</tr>
							</table>
						</td>
						<!-- å ���� �Ұ����� -->
						<td width="85%" height="200">
							<table border="0">
								<tr>
									<td height="5" align="left" colspan="3">ISBN : ${list.book_code }</td>
								</tr>
								<tr>
									<td height="20" colspan="3"><h4><b>${list.book_name }</b></h4></td>
								</tr>
								<tr>
									<td height="20" width="60%" colspan="2">[����]&nbsp;${list.writer }</td>
									<td height="20"  width="40%">[���ǻ�]&nbsp;${list.publisher }</td>
								</tr>
								<tr>
									<td height="20"  width="30%">[������]&nbsp; <fmt:formatDate value="${list.publication }" pattern="yyyy�� M�� d��"/></td>
									<td height="20"  width="30%">[�ݾ�]&nbsp; <fmt:formatNumber value="${list.price }" type="number"/>��</td>
									<td height="20"  width="40%">[�ʼ�]&nbsp;${list.pages }��</td>
								</tr>
								<tr>
									<td height="50"  colspan="3"><br/>&nbsp;${list.book_content }</td>
								</tr>
							</table>
						</td>
					</tr>
					</c:forEach>
				</table>
				<table width="100" id="table_page">
					<tr>
						<td align="center">
							<ul class="pagination pagination-sm">
								<c:if test="${curPage<=block }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage>1?curPage-1:curPage}">&laquo;</a></li>
								</c:if>
								<c:if test="${curPage>block }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${fromPage }" end="${toPage }">
									<c:if test="${curPage==i }">
										<li><a href="categoryList.do?book_category=${book_category }&page=${curPage}">${i }</a></li>
									</c:if>
									<c:if test="${curPage!=i }">
										<li><a href="categoryList.do?book_category=${book_category }&page=${i}">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${toPage<totalPage }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${toPage+1}">&raquo;</a></li>
								</c:if>
								<c:if test="${toPage>=totalPage }">
									<li><a href="categoryList.do?book_category=${book_category }&page=${curPage<totalPage?curPage+1:curPage}">&raquo;</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</table>
				<!-- ���� �� -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>