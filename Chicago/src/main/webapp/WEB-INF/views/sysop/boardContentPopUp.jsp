<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function openPop(board_no){
	/* 	alert(page);
	alert(board_no); */	
	if(confirm("삭제하시겠습니까?")){ 
		location.href ="board_contentManagement_delete.do?board_no="+board_no;
		/* location.href = "deleteMember.do?id="+data; */
	} 
	return false;
};
</script>
</head>
<body>
	<center>
		<table>
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
		</table>
		<table>
			<tr>
				<td align="right">					
					<a href="#" onclick="return openPop('${vo.board_no}');">삭제</a>&nbsp;
					<a href="#" onclick="window.close();">닫기</a>&nbsp;
				</td>
			</tr>
		</table>
	</center>
</body>
</html>