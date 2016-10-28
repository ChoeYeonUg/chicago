<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#sendBtn').click(function(){			
		 	var subject=$('#subject').val();
			if(subject.trim()==""){
				$('#subject').focus();
				$('#subject').val("");
				alert("제목을 입력하세요.");
				return;
			} 
			
			var content=$('#chicago').val();

			if(content.trim()==""){
				$('#chicago').focus();
				$('#chicago').val(""); 
				alert("내용을 입력하세요.");
				return;
			}
				
			
			$('#frm').submit();
			
		})
	});
</script>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- 	Template CSS -->
<link rel="stylesheet" href="board_css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="board_css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="board_css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="board_css/custom.css" rel="stylesheet">

<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Raleway:100,300,400"
	type="text/css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	type="text/css" rel="stylesheet">
</head>
<body>

 <!-- === BEGIN CONTENT === -->
        <div id="content">
            <div class="container background-white">
                <div class="row margin-vert-30">
                    <!-- Register Box -->
                    <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                        <form class="signup-page margin-top-20" action="noticeboard_insert_ok.do" method="post" name="frm" id="frm">
                            <div class="signup-header">
                                <h2 class="margin-bottom-40">WRITE A NEW NOTE</h2>
                                <p>새로운 공지사항을 입력하세요.</p>
                            </div>
                            <label>제목<span class="color-red">*</span></label>
                            <input class="form-control margin-bottom-20" type="text" name="subject" id="subject">
                            <label>내용<span class="color-red">*</span></label>
                            <textarea class="form-control margin-bottom-90" name="content" id="chicago"></textarea>
                            	<br/>
                                <div align="right">
                                <a href="#">수정</a>
                                <input type="button" class="btn btn-primary" value="글쓰기" id="sendBtn" >
                                <input type="button" value="취소" onclick="javascript:history.back()">                                   
                                </div>
                            </div>                       
                            </div>
                        </form>
                    </div>
                    <!-- End Register Box -->
                </div>
            </div>
        </div>
        <!-- === END CONTENT === -->




	
</body>
</html>