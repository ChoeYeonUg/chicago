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
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if(pwd.trim()!="${db_pwd}"){
			$('#pwd').focus();
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
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
		<!-- 본인확인 안내 msg -->
		<div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h3 class="panel-title">
							비밀번호를 입력해 주세요
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
						디비비번:${db_pwd }
					</td> --%>
				</tr>
				<tr>
					<td align="center">
						<input type="button" value="확인" id="sendBtn" >
						<input type="button" value="취소" onclick="location.href='secretboard.do?page=${page}'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>