<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board_css/board_css.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function send(){
	var f = document.frm;
	
	var content=$('#chicago1').val();

	var $star = $(".star_input"),
    $result = $star.find("output>b");
	
	/* alert($result.text()); */
	
	if(($result.text())==0){
		alert("별점을 선택하세요.");
		$('#chicago1').focus();
		return;
	}
	
	if(content.trim()==""){
		$('#chicago1').focus();
		alert("내용을 입력하세요.");
		return;
	}		

	
	$(document).ready(function() {

	    $('#chicago1').on('keyup', function() {

	        if($(this).val().length > 140) {
	        	alert("글자수는 140자를 넘을 수 없습니다.")
	        	$(this).val($(this).val().substring(0, 140));
	        }

	    });

	});
	
	
	f.submit();
	
};




</script>
<style>
.star_input>.input,
.star_input>.input>label:hover,
.star_input>.input>input:focus+label,
.star_input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('board_img/grade_img.png')no-repeat;}
.star_input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star_input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star_input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star_input>.input.focus{outline:1px dotted #ddd;}
.star_input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star_input>.input>label:hover,
.star_input>.input>input:focus+label,
.star_input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star_input>.input>label:hover~label{background-image: none;}

.star_input>.input>label[for="p0_5"]{width:15px;z-index:10;}
.star_input>.input>label[for="p1"]{width:30px;z-index:9;}
.star_input>.input>label[for="p1_5"]{width:45px;z-index:8;}
.star_input>.input>label[for="p2"]{width:60px;z-index:7;}
.star_input>.input>label[for="p2_5"]{width:75px;z-index:6;}
.star_input>.input>label[for="p3"]{width:90px;z-index:5;}
.star_input>.input>label[for="p3_5"]{width:105px;z-index:4;}
.star_input>.input>label[for="p4"]{width:120px;z-index:3;}
.star_input>.input>label[for="p4_5"]{width:135px;z-index:2;}
.star_input>.input>label[for="p5"]{width:150px;z-index:1;}
.star_input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
</head>
<body>
	<center>
		<form action="bookContentReviewInsert.do" method="post" id="frm" name="frm">
			 <table class="tableContent" style="border: 1px solid #e3e3e3; border-collapse: collapse; width: 450px; ">
				<tr>
					<th width="30%" align="center" style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
						border-top: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">id</th>
					<td width="70%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
						border-top: 1px solid #e3e3e3;">${id }
					<input type="hidden" name="id" id="id" value="${id }"/>		
					<input type="hidden" name="book_code" id="book_code" value="${book_code }"/></td>	
				</tr>
				<tr>
					<th width="30%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
						border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3;" >책제목</th>
					<td width="70%" align="center" style="padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;" >${detailBook.book_name}</td>
					<input type="hidden" name="img" id="img" value="${detailBook.img }"/>	
				</tr>
				<tr>
					<th width="30%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
						border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3;" >별점선택</th>
					<td width="70%" style="border-bottom: 1px solid #e3e3e3;">
						<span class="star_input">
							<span class="input">						
						    	<input type="radio" name="star_input" value="0_5" id="p0_5" >
						    	<label for="p0_5">0.5</label>
						
								<input type="radio" name="star_input" value="1" id="p1" >
						    	<label for="p1">1</label>
						
								<input type="radio" name="star_input" value="1_5" id="p1_5" >
						    	<label for="p1_5">1.5</label>
						
								<input type="radio" name="star_input" value="2" id="p2" >
						    	<label for="p2">2</label>
						
								<input type="radio" name="star_input" value="2_5" id="p2_5" >
						    	<label for="p2_5">2.5</label>
						
						    	<input type="radio" name="star_input" value="3" id="p3" >
						    	<label for="p3">3</label>
						
								<input type="radio" name="star_input" value="3_5" id="p3_5" >
						    	<label for="p3_5">3.5</label>
						
						    	<input type="radio" name="star_input" value="4" id="p4" >
						    	<label for="p4">4</label>
						
								<input type="radio" name="star_input" value="4_5" id="p4_5" >
						    	<label for="p4_5">4.5</label>
						
						    	<input type="radio" name="star_input" value="5" id="p5" >
						    	<label for="p5">5</label>
						  	</span>
						  	<output for="star_input"><b>0</b>점</output>
					</td>			
				</tr>		
				<tr>
					<th width="30%" align="center"  style="background-color: #fbfafa; padding:10px; border-bottom: 1px solid #e3e3e3;
					border-top: 1px solid #e3e3e3;  border-right: 1px solid #e3e3e3; border-left:  1px solid #e3e3e3;" >간단리뷰 작성</th>
					<td style="font-size:11px; color:#505050;">최대 한글 140자 까지 가능합니다.</td>
				</tr>
				<tr>
					<td colspan="2" width="80%" align="left">
					<textarea rows="10" cols="60" name="content" id="chicago1" "></textarea></td>
				</tr>				
			</table>
					
			<table class="commonTable" style="width: 450px;">
				<tr>
					<td align="center">					
						<a href="#" onclick="send();">글쓰기</a> &nbsp;
						<a href="#" onclick="window.close();">닫기</a>&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
	<script src="board_js/jquery-1.11.3.min.js"></script>
	<script src="board_js/star.js"></script>
</body>
</html>

