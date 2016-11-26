<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">

function send(){
	var f = document.frm;

	var subject=$('#subject').val();
	if(subject.trim()==""){
		$('#subject').focus();
		alert("제목을 입력하세요.");
		return;
	} 
	
	var content=$('#chicago1').val();

	if(content.trim()==""){
		$('#chicago1').focus();
		alert("내용을 입력하세요.");
		return;
	}
	
	
	var radio = $('input:radio[name="secret"]:checked').val();
	 var pwd=$('#pwd').val();
					
		if(radio==2 && pwd.trim()==""){
			$('#pwd').focus();
			$('#pwd').val(""); 
			alert("비밀번호를 입력하세요.");
		 	return;
	
		} 
		
	
	f.submit();
	
};


$(function () {
	$('.secret').click(function(){ //토글
		var radio = $('input:radio[name="secret"]:checked').val();
		if(radio==2){
			$('#pwd').show();						 
			
		}else{
			$('#pwd').hide();
			$('#pwd').val("");
		}
	}) 
});

</script>
</head>
<body>
<table>
		<tr>
			<td style="float:inherit; font-size:15px; color:#505050; padding: 14px;" >
				수정하기
			</td>
		</tr>
	</table>	

	<form action="myQ_update_ok.do" method="post" id="frm" name="frm">		
		<table class="tableContent1" >			
			<tr>
				<th width="15%" style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">ID</th>
				<td align="left" style="padding-left:20px; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">${id }
					<input type="hidden" size="10px"name="id" id="id" value="${vo.id }"/>
					<input type="hidden" size="10px" name="board_no" id="board_no" value="${vo.board_no }"/>
					<input type="hidden" size="10px" name="hit" id="hit" value="${vo.hit }"/>
				</td>
				
			</tr>
				

			<tr>
				<th style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">제목</th>				
				<td  align="left" style="border-bottom:1px solid #e3e3e3; ">
				<input type="text" name="subject" id="subject" size="40" value="${vo.subject}" ></td>
				
			
			</tr>
			
			<tr>
				<th width="center" style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3; vertical-align:middle;">내용</th>
				<td align="left" style="border-bottom:1px solid #e3e3e3; "><textarea rows="10" cols="50"
						name="content" id="chicago1" >${vo.content } </textarea></td>

			</tr>
				<tr>
					
					<th style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">비밀번호</th>
					<td  width="85%" align="left">						
							<c:if test="${vo.secret==2}">
								<input type="radio" name="secret" value="1" class="secret">공개글   &nbsp;
								<input type="radio" name="secret" value="2" checked="checked"  id="secret_btn" class="secret">비밀글 &nbsp;  
								<input type="password" name="pwd" size="10" id="pwd" value="${vo.pwd }" style="display:none; border:1px solid #e3e3e3;	">
							</c:if>
							<c:if test="${vo.secret==1}">
								<input type="radio" name="secret" value="1" checked="checked" class="secret">공개글   &nbsp;
								<input type="radio" name="secret" value="2" id="secret_btn" class="secret">비밀글 &nbsp;  
								<input type="password" name="pwd" size="10" id="pwd" style="display:none; border:1px solid #e3e3e3;	">
							</c:if>
						
					</td>
				</tr>

		</table>
		<table class="commonTable" >
			<tr>
				<td colspan="2" align="center">					
					<a href="#" onclick="send();">글쓰기</a>
					 &nbsp;
					<a href="#" onclick="javascript:history.back()">닫기</a>
				</td>
			</tr>
		</table>
			

	</form>
</body>
</html>