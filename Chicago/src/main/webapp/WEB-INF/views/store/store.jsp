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
  <img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=1639&bodylen=444268&realname=fixedw_large_4x.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.1" style="width:100%">
  <img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=446114&bodylen=3136972&realname=Sandmeyer-up-close.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.2" style="width:100%">
  <img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=3583299&bodylen=1547868&realname=8_bookstore.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.3" style="width:100%">
  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-opacity" 
      src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=1639&bodylen=444268&realname=fixedw_large_4x.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.1" onclick="currentDiv(1)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity"
      src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=446114&bodylen=3136972&realname=Sandmeyer-up-close.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.2" onclick="currentDiv(2)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity" 
      src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=00000000000008z&pos=3583299&bodylen=1547868&realname=8_bookstore.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=4&attid=0.3" onclick="currentDiv(3)">
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