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
/* 		bottom: 0; */
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
                    <div id="footermenu" class="col-md-8">
                        <ul class="list-unstyled list-inline">
                            <li>
                                <a href="#" target="_blank" class="footer-link">Sample Link</a>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">Sample Link</a>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">Sample Link</a>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="footer-link">Sample Link</a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Footer Menu -->
                    <!-- Copyright -->
                    <div id="copyright" class="col-md-4">
                        <p class="pull-right">(c)Chicago books</p>
                    </div>
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