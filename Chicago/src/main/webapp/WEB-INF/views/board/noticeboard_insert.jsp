<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
function send(){
	var f = document.frm;

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
	
	f.submit();
	
};	
	
</script>
</head>
<body>
	<table>
		<tr>
			<td style="float:inherit; font-size:15px; color:#505050; padding: 14px;" >
				�������� ����
			</td>
		</tr>
	</table>	
	<form action="noticeboard_insert_ok.do" method="post" name="frm" id="frm">
		<table class="tableContent1" >
			<tr>
			<th width="15%" style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">ID</th>
				<td align="left" style="padding-left:20px; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;">${id }
				<input type="hidden" name="id" id="id""/>
				</td>				
			</tr>
			<tr>
				<th style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">����</th>
				<td  align="left" style="border-bottom:1px solid #e3e3e3; ">
				<input type="text" name="subject" id="subject" size="40" ></td>
			</tr>			
			<tr>
				<th width="center" style="background-color: #fbfafa; padding:10px; padding-left:20px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3; vertical-align:middle;">����</th>
				<td align="left" style="border-bottom:1px solid #e3e3e3; "><textarea rows="10" cols="50"
						name="content" id="chicago1" "></textarea></td>
			</tr>
		</table>
		<table class="commonTable" >
			<tr>
				<td colspan="2" align="center">					
					<a href="#" onclick="send();">�۾���</a>
					 &nbsp;
					<a href="#" onclick="javascript:history.back()">�ݱ�</a>
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>