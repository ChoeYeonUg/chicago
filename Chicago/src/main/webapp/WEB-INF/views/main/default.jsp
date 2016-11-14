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
  <a href="writerDetail.do?writer_no=61"><img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=000000000000091&pos=1639&bodylen=1421162&realname=f2.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=3&attid=0.1" style="width:100%"></a>
  <a href="writerDetail.do?writer_no=5"><img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=000000000000091&pos=1422982&bodylen=477338&realname=f3.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=3&attid=0.2" style="width:100%"></a>
  <a href="writerDetail.do?writer_no=8"><img class="mySlides" src="http://wwl1456.daum.net/Mail-bin/view_submsg3.cgi?TM=jOi5o%2BGuQw1NRmViIvMfnbroiQNl8zVeu%2Bzu%2FzJP26uf08M80EvQpFbm1DZg7%2FvXvX7282m5sj8%2Br7su0lkW2yDCdrU23G7r3dOg9yspGYeMP4utw151l5z6PekFDT5ik02OFRAfdLGVi3kLJZC44Tm307BWdy0QvUMquNa99fPiR%2FjkEIuCdAI8M8KmRd1sbL9Vwmf5ONSZxVnlvtL%2BvIk3t0u4pXqvKSQmrtG%2B3k682ioenSessOhmG6jYOe0kcSrtTReBkKA4yo9zqetu%2BpfrZMoIxXl4iNHZZe9xxfAlKkOMZfMYAMo748iT6naX%2BMuVY6iRH1cE1M80FUlBcbNRzuM36TTpmppURYmTRNg2%2BjvRfpYVzOC%2BnIiR0uFuPq2DqI0ok98agqhZ9ZHx1PC4hTMRNAu952HZmftCLriGLBrpmBsR7VX2iJ46DGVtyD3LWd7j5QJXizS%2BiNzSsaUFDBvPPpE30xhIJFuAjQByVhs2GlmO8rydXLMYsrFVe3Vu%2BVE330OM0wpPiq6cNd4xoyohcYt48ywvgeK1zvGS3xwyeknQ75mDUBaPSeFENqF0HhzfY52YsAw1O7w%2BTg%3D%3D&encoding=UTF-8&MSGID=000000000000091&pos=1900501&bodylen=1009768&realname=f1.jpg&downtype=VIEW&encoding=UTF-8&contenttype=image%2Fjpeg&attnum=3&attid=0.3" style="width:100%"></a>
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