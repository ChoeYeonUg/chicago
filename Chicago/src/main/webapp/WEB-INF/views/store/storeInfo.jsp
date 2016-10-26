<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=AJLoOIbdkptv3uVxSBZ7"></script>

</head>
<body>
	<div class="outline">
		<div class="div_menu">
			<h2>Category</h2>
			<ul class="nav_bar">
				<c:forEach items="${storeList }" var="name">
					<li><a href="storeInfo.do?store_name=${name }">${name }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-md-9">
			<div id="map" style="width:600px;height:400px;"></div>
				<script>
				var store = new naver.maps.LatLng(${vo.lat}, ${vo.lng}),
				    map = new naver.maps.Map('map', {
				        center: store,
				        zoom: 10
				    }),
				    marker = new naver.maps.Marker({
				        map: map,
				        position: store
				    });

				var contentString = [
				        '<div class="iw_inner">',
				        '   <center><h4>${vo.store_name}점</h4></center>',
				        '   <p>${vo.addr}<br />',
				        '   </p>',
				        '</div>'
				    ].join('');

				var infowindow = new naver.maps.InfoWindow({
				    content: contentString
				});

				naver.maps.Event.addListener(marker, "click", function(e) {
				    if (infowindow.getMap()) {
				        infowindow.close();
				    } else {
				        infowindow.open(map, marker);
				    }
				});

				infowindow.open(map, marker);
				</script>
			<div class="panel panel-default">
  				<div class="panel-heading">
    				<h3 class="panel-title">${vo.store_name }</h3>
  				</div>
    			<div class="panel-body">
     				 문의 전화 : ${vo.tel}<br/>
     				 주소 : ${vo.addr}<br/>
     				 <br/>
     				 ${vo.info}
     				 
     				 <br/><br/>
     				 개점  : 10:00<br/>
     				 폐점 : 22:00
  				</div>
			</div>
		</div>
	</div>

</body>
</html>