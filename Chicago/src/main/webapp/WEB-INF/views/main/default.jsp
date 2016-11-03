<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
.mySlides {display:none;}
</style>
</head>
<body>
	<!-- <section>
		호우
	</section> -->
	<div class="w3-content w3-section" style="max-width:100%">
  <img class="mySlides" src="http://www.w3schools.com/w3css/img_la.jpg" style="width:100%">
  <img class="mySlides" src="http://www.w3schools.com/w3css/img_ny.jpg" style="width:100%">
  <img class="mySlides" src="http://www.w3schools.com/w3css/img_chicago.jpg" style="width:100%">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 5000); // Change image every 2 seconds
}
</script>
	
</body>
</html>