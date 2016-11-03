<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- 	Template CSS -->
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
	<h3>1:1 게시판 글 보기</h3>


		
		<table border="0" bordercolor="black" width="500" >
	
			<tr>
				<th width="20%">번호</th>
				<td width="30%" align="center">${vo.board_no}</td>
				<th width="20%">날짜</th>
				<td width="30%" align="center">				
					<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		
			<tr>
				<th width="20%">작성자</th>
				<td width="30%" align="center">${vo.id }</td>
				<th width="20%">HIT</th>
				<td width="30%" align="center">	${vo.hit }</td>
			</tr>			
	
			<tr>
				<th width="20%" align="right">제목</th>
				<td width="80%" align="left" colspan="3">
				${vo.subject}</td>
			</tr>
			
			<tr>

				<th width="15%" align="right">내용</th>
				<td colspan="3" valign="top" align="left" height="200"><pre>${vo.content}</pre>
				</td>


			</tr>
				<!-- <tr>
					
					<th width="15%" align="right">비밀번호</th>
					<td colspan="3" width="85%" align="left">
						<input type="radio" name="secret" value="1" checked="checked" class="secret">공개글  
						<input type="radio" name="secret" value="2" id="secret_btn" class="secret">비밀글 &nbsp;&nbsp;  
						<input type="password" name="pwd" size="10" id="pwd" style="display:none">
					</td>
				</tr> -->

			</table>
			<table>
			<tr>
				<td align="right">
					<a href="#">답글</a>&nbsp;
					
				<c:if test="${id==vo.id }">
					<a href="secret_update.do?page=${page }&board_no=${board_no }">수정</a>&nbsp;
					<a href="#">삭제</a>&nbsp;
				</c:if>
					<a href="secretboard.do?page=${page}">목록</a>&nbsp;
				</td>
			</tr>
		</table>
			


</body>
</html>