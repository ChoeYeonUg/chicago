<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function openPop(page,board_no){
/* 	 	alert(page);
	alert(board_no);  */
	
	if(confirm("삭제하시겠습니까?")){ 
		location.href ="myQ_delete.do?page="+page+"&board_no="+board_no;
		/* location.href = "deleteMember.do?id="+data; */
	} 
	return false;
};
</script>
</head>
<body>

<table>
			<tr>	
				<td style="font-size:20px; color:#505050; padding: 15px;" align="left">
				문의내역 보기
				</td>
			</tr>
</table>
	<table class="tableContent" width="500px" style="border: 1px solid #e3e3e3">	
			<tr>
				<th width="20%" align="center" style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">번호</th>
				<td width="30%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">${vo.board_no}</td>
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
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3; border-left:  1px solid #e3e3e3;" >HIT</th>
				<td width="30%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">	${vo.hit }</td>
			</tr>				
			<tr>
				<th width="20%" align="center" style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3;" >제목</th>
				<td width="80%" align="left" colspan="3" style="padding:10px;">
				${vo.subject}</td>
			</tr>			
			<tr>

				<td colspan="4" valign="top" align="left" height="200" >
					<pre style="background-color: white; padding:20px; border: 0px ; font-size:11px; color:#505050;">${vo.content}</pre>
				</td>
			</tr>			
			</table>
			<table class="commonTable" style="width: 700px;">
			<tr>
				<td align="right">
				<%-- <c:if test="${id!=null}">
					<a href="myQ_reply.do?board_no=${board_no}">답글</a>&nbsp;					
				</c:if> --%>
				<c:if test="${id==vo.id || grade<=1 }">
					<a href="myQ_update.do?page=${page }&board_no=${board_no }">수정</a>&nbsp;
					<a href="#" onclick="return openPop('${page}','${board_no}');">삭제</a>&nbsp;
				</c:if>
					<a href="myMemberquestion.do?page=${page }">목록</a>&nbsp;
				</td>
			</tr>
		</table>

</body>
</html>