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
	
	
	$('#sendBtn').click(function(){			
	 	
		
		var pwd=$('#pwd').val();

		if(pwd.trim()==""){
			$('#pwd').focus();
			alert("��й�ȣ�� �Է��ϼ���.");
			return;
		}
		
		if(pwd.trim()!="${db_pwd}"){
			$('#pwd').focus();
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���.");
			$('#pwd').val("");
		
			return;
		}
		
		
		
		
			
		$('#frm').submit();
		
	})
	
});


</script>

</head>
<body>
<div class="col-md-9">
		<!-- ����Ȯ�� �ȳ� msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							��й�ȣ�� �Է��� �ּ���
						</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
		<form action="secretboard_pwd_check_ok.do" method="post" id="frm">
			<input type="hidden" name="typecheck" value="${typecheck}">
			<table border="1" width="100" height="150" >
				<tr >
					<td align="center" >
						<input type="password" name="pwd" size="10" id="pwd">
						<input type="hidden" name="board_no" id="board_no" value="${board_no }">
						<input type="hidden" name="page" id="page" value="${page}">
						
					</td>
					<%-- <td >
						�����:${db_pwd }
					</td> --%>
				</tr>
				<tr>
					<td align="center">
						<input type="button" value="Ȯ��" id="sendBtn" >
						<input type="button" value="���" onclick="location.href='secretboard.do?page=${page}'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>