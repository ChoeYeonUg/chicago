<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('board_img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}

.star-input>.input>label[for="p0_5"]{width:15px;z-index:10;}
.star-input>.input>label[for="p1"]{width:30px;z-index:9;}
.star-input>.input>label[for="p1_5"]{width:45px;z-index:8;}
.star-input>.input>label[for="p2"]{width:60px;z-index:7;}
.star-input>.input>label[for="p2_5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p3"]{width:90px;z-index:5;}
.star-input>.input>label[for="p3_5"]{width:105px;z-index:4;}
.star-input>.input>label[for="p4"]{width:120px;z-index:3;}
.star-input>.input>label[for="p4_5"]{width:135px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
</head>
<body>
<span class="star-input">
	<span class="input">

    	<input type="radio" name="star-input" value="0_5" id="p0_5">
    	<label for="p0_5">0.5</label>

		<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>

		<input type="radio" name="star-input" value="1_5" id="p1_5">
    	<label for="p1_5">1.5</label>

		<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>

		<input type="radio" name="star-input" value="2_5" id="p2_5">
    	<label for="p2_5">2.5</label>

    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>

		<input type="radio" name="star-input" value="3_5" id="p3_5">
    	<label for="p3_5">3.5</label>

    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>

		<input type="radio" name="star-input" value="4_5" id="p4_5">
    	<label for="p4_5">4.5</label>

    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
  	</span>
  	<output for="star-input"><b>0</b>점</output>				
  	
  	
  	
  	<form action="review_insert_ok.do" method="post" id="frm">
  		<table border="1" bordercolor="black">
  			<tr>
  				<td>zz</td>
  				<td>zz</td>
  				
  			</tr>
  		</table>
  	</form>
  	
  	
  	
  	
  	
  	
  	
  			
</span>
<script src="board_js/jquery-1.11.3.min.js"></script>
<script src="board_js/star.js"></script>
</body>
</html>