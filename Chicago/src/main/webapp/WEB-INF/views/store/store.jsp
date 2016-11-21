<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="css/store.css" rel="stylesheet" />

<style>
.mySlides {display:none}
.demo {cursor:pointer}
a{color: #68A4C4}
</style>

</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<div class="col-md-3">
					<ul class="nav_bar">
						<c:forEach items="${storeList }" var="name">
							<li class="list-group-item"><a href="storeInfo.do?store_name=${name }">${name }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-md-9">
					<div class="w3-content" style="max-width:1200px">
  <img class="mySlides" src="images\store_1.jpg" style="width:100%">
  <img class="mySlides" src="images\store_2.jpg" style="width:100%">
  <img class="mySlides" src="images\store_3.jpg" style="width:100%">
  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-opacity" 
      src="images\store_1.jpg" onclick="currentDiv(1)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity"
      src="images\store_2.jpg" onclick="currentDiv(2)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity" 
      src="images\store_3.jpg" onclick="currentDiv(3)">
    </div>
  </div>
</div>
				</div>
			</div>
		</div>
	</div>
	<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>
	
</body>
</html>