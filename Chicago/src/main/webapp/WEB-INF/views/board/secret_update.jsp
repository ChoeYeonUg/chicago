<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	$('.secret').click(function(){ //���
		var radio = $('input:radio[name="secret"]:checked').val();
		if(radio==2){
			$('#pwd').show();						 
			
		}else{
			$('#pwd').hide();
			$('#pwd').val("");
		}
	}) 
	
	
	$('#sendBtn').click(function(){			
	 	var subject=$('#subject').val();
		if(subject.trim()==""){
			$('#subject').focus();
			alert("������ �Է��ϼ���.");
			return;
		} 
		
		var content=$('#chicago1').val();

		if(content.trim()==""){
			$('#chicago1').focus();
			alert("������ �Է��ϼ���.");
			return;
		}
		
		
		var radio = $('input:radio[name="secret"]:checked').val();
		 var pwd=$('#pwd').val();
						
			if(radio==2 && pwd.trim()==""){
				$('#pwd').focus();
				$('#pwd').val(""); 
				alert("��й�ȣ�� �Է��ϼ���.");
			 	return;
		
			} 
			
		$('#frm').submit();
		
	})
	
});


</script>
</head>
<body>
<h3>1:1 �Խ��� �����ϱ�</h3>

	<form action="secret_update_ok.do" method="post" id="frm">
		
		<table border="0" bordercolor="black" width="500" >
	
			
			<tr>
				<th width="20%">ID</th>
				<td width="30%" align="left">${vo.id }
				<input type="hidden" name="id" id="id" value="${vo.id }"/>
				<input type="hidden" name="board_no" id="board_no" value="${vo.board_no }"/>
				<input type="hidden" name="hit" id="hit" value="${vo.hit }"/>
				</td>
				
			</tr>
				

			<tr>
				<th width="20%" align="right">����</th>
				<td width="80%" align="left" colspan="3">
				<input type="text" name="subject" id="subject" size="70" value="${vo.subject}"></td>
			
			</tr>
			
			<tr>

				<th width="15%" align="right">����</th>
				<td colspan="3" width="85%" align="left">
				<textarea rows="10" cols="50" name="content" id="chicago1" >${vo.content }</textarea></td>


			</tr>
				<tr>
					
					<th width="15%" align="right">��й�ȣ</th>
					<td colspan="3" width="85%" align="left">
						<input type="radio" name="secret" value="1" checked="checked" class="secret">������  
						<input type="radio" name="secret" value="2" id="secret_btn" class="secret">��б� &nbsp;&nbsp;  
						<input type="password" name="pwd" size="10" id="pwd" style="display:none">
					</td>
				</tr>

			</table>
			<table>
			<tr>

				<td colspan="2" align="center"><input type="button" value="�۾���"
					id="sendBtn"> <input type="button" value="���" 
					onclick="javascript:history.back()"></td>
			</tr>
			</table>
			

	</form>
</body>
</html>