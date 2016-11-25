<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		font-size: 14px;
		height: 100%;
	}
	#content{
		min-height: 100%;
		padding-bottom: 19px;
	}
	#footer{
		/* position: absolute; */
		/* bottom: 0; */
		left: 0;
		right: 0;
	}
</style>
</head>
<body>
	<footer id="footer">
		<div class="container no-padding">
                <div class="row">
                    <!-- Footer Menu -->
                    <div id="footermenu" class="col-md-8" style="padding-left: 100px;"> 
                        <ul class="list-unstyled list-inline" style="padding-top: 20px;">
                            <li>
                                <a href="#" target="_blank" class="footer-link">회사소개&nbsp; &nbsp;&nbsp;</a><b>l</b>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">이용안내 &nbsp;&nbsp;&nbsp;</a><b>l</b>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">이용약관&nbsp; &nbsp;&nbsp;</a><b>l</b>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">개인정보방침취급안내</a>
                            </li>
                        </ul>
                    </div>
                 <div align="center">
                    <img src="images\logo1.png" style="width:20%; height:auto; float: right; position: relative;  right:190px; bottom: -50px;" >
                    <img src="images\footer1.png" style="width:80%; height:auto; padding-left: 10px;" >
                  
                 </div>
                    <!-- End Footer Menu -->
                    <!-- Copyright -->
                    <!-- <div id="copyright" class="col-md-4">
                        <p class="pull-right">(c)Chicago books</p>
                    </div> -->
                    <!-- End Copyright -->
                </div>
            </div>
	</footer>
	
	<script>
  var Height_Index = Number(document.getElementById("content").clientHeight);
  window.onload  = changeContentSize;
  window.onresize  = changeContentSize;
  function changeContentSize() {
   var Height_Window   = Number(document.documentElement.clientHeight);
   var Height_Footer   = Number(document.getElementById("footer").clientHeight);
   var ContentTop = Height_Window - Height_Footer - 350;
   document.getElementById("content").style.minHeight = Height_Index + 'px';
   document.getElementById("content").style.height = ContentTop + "px";
  }
 </script>
	
</body>
</html>