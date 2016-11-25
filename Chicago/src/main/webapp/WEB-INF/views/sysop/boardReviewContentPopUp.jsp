<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function openPop(review_no){
	/* 	alert(page);
	alert(board_no); */	
	if(confirm("삭제하시겠습니까?")){ 
		location.href ="boardreview_contentManagement_delete.do?review_no="+review_no;
		/* location.href = "deleteMember.do?id="+data; */
	} 
	return false;
};
</script>
</head>
<body>
<br/>
	<center>
		<table class="tableContent" style="border: 1px solid #e3e3e3; border-collapse: collapse; width: 450px; ">
			<tr>
				<th width="20%" align="center" style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">번호</th>
				<td width="30%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">${vo.review_no}</td>
				<th width="20%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3; border-left:  1px solid #e3e3e3;">날짜</th>
				<td width="30%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">				
					<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>			
			<tr>
				<th width="20%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3;" >작성자</th>
				<td width="30%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;" >${vo.id }</td>
				<th width="20%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3; border-left:  1px solid #e3e3e3;" >별점</th>
				<td width="30%" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">
					<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(board_img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						<p style="WIDTH: ${vo.score*20}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(board_img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						</p>
					</div>				
				</td>
			</tr>	
			<tr>
				<td colspan="4" valign="top" align="left" height="200" >
					<pre style="background-color: white; padding:20px; border: 0px ; font-size:11px; color:#505050;">${vo.content}</pre>
				</td>
			</tr>		
		</table>
		<table  style="width: 500px;">
			<tr>
				<td align="center" style="padding-top: 20px;">					
					<a href="#" onclick="return openPop('${vo.review_no}');" style="font-size: 12px;" class="myButton">삭제</a>&nbsp;
					<a href="#" onclick="window.close();" style="font-size: 12px;" class="myButton">닫기</a>&nbsp;
				</td>
			</tr>
		</table>
	</center>
</body>
</html>